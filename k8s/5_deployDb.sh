kubectl apply -f config.yaml -f DemoDB.yaml 
kubectl apply -f lb.yaml

# get the connectionstring for external IP of the replicaset load balancer
./connectionString.sh