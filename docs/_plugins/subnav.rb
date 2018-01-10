require "nokogiri"

class NavigationGenerator < Jekyll::Generator
  DELIMITER_TAGS = %w(h1)
  SUBNAV_TAGS = %w(h2)
  EXTRACT_RANGES = [2...3]

  def generate(site)
    parser = Jekyll::Converters::Markdown.new(site.config)

    site.pages.each do |page|
      if page.ext == '.md'
        doc = Nokogiri::HTML(parser.convert(page['content']))
        page.data['nav'] = []

        mainNav = nil
        page.data['ext'] = []
        doc.css('body').children.each do |el|
          if (DELIMITER_TAGS.include? el.name)
            add_to_page_name(page, mainNav)
            mainNav = {'title' => el.text, 'url' => [page.url, el['id']].join('#'), 'subNav' => [], 'id' => el['id']}
          elsif (SUBNAV_TAGS.include? el.name)
            add_sub_nav(mainNav, {'title' => el.text, 'url' => [page.url, el['id']].join('#')})
          end
        end
        add_to_page_name(page, mainNav)
      end
    end
  end

  def add_to_page_name(page, nav)
    if (!nav.nil?)
      Jekyll.logger.debug 'Adding navigation to page'
      page.data['nav'] << nav
    end
  end

  def add_sub_nav(mainNav, subNav)
    if (!mainNav.nil? && !subNav.nil?)
      Jekyll.logger.debug 'Adding sub navigation.'
      mainNav['subNav'] << subNav
    end
  end

end