# Install helm (OOTB)
  * helm install --name gocd-app --namespace gocd incubator/gocd
   1. Get the go-server ip using 
       `$ ip=$(kubectl get ingress gocd-app-gocd-server -o jsonpath="{.status.loadBalancer.ingress[0].ip}")` (put --namespace)
   2. Get a GoCD internal URL for plugin settings
       `$ echo "https://$(kubectl --namespace gocd get service gocd-app-gocd-server  -o jsonpath='{.spec.clusterIP}'):8154/go"`
   3. Get Cluster url `kubectl cluster-info`
   4. Get token `kubectl --namespace=gocd get secret -o jsonpath='{.items[1].data.token}'`
   5. Get a certificate `kubectl --namespace=gocd get secret -o jsonpath='{.items[1].data.ca\.crt}'`
  
