# Install helm (OOTB)
  * helm install --name gocd-app --namespace gocd incubator/gocd
   1. Get the go-server ip using 
       `$ ip=$(kubectl get ingress gocd-app-gocd-server -o jsonpath="{.status.loadBalancer.ingress[0].ip}")` (put --namespace)
        
        - [ ] Update it with --namespace gocd
        
   2. Get a GoCD internal URL for plugin settings
       `$ echo "https://$(kubectl --namespace gocd get service gocd-app-gocd-server  -o jsonpath='{.spec.clusterIP}'):8154/go"`
       
         - [ ] Update a note.txt with above command how to get GoCD SSL url for agents
   3. Get Cluster url `kubectl cluster-info`
         - [ ] Put on note.txt
         
   4. Get token `kubectl --namespace=gocd get secret -o jsonpath='{.items[1].data.token} ' | base64 --decode`
         - [ ] `kubectl get some-command` always returns base64 encoded values for secretes and certs. Update command with `base64 --decode` to decode the values
         
   5. Get a certificate `kubectl --namespace=gocd get secret -o jsonpath='{.items[1].data.ca\.crt}' | base64 --decode`
  
