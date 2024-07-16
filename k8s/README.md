# MongoDB Kubernetes Operator

## Instructions on how to setup a Kubernetes Cluster on GKE with MongoDB Ops Manager 


GCP CLI
- List clusters: `gcloud container clusters list`
- Deploy K8S on GKE: `./deployK8s.sh`
- Deploy MongoDB Operator: `deployMdbOperator.sh`
- Deploy Ops Manger on K8S: `kubectl apply -f cluster.yaml`
- Set context to namespace mongodb: `kubectl config set-context --current --namespace=mongodb`
- 


