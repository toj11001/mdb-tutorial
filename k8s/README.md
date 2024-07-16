# MongoDB Kubernetes Operator

## Instructions on how to setup a Kubernetes Cluster on GKE with MongoDB Ops Manager 

MongoDB Blog resources for OpsManager on K8S: https://www.mongodb.com/developer/products/connectors/deploying-across-multiple-kubernetes-clusters/

GCP CLI
- List clusters: `gcloud container clusters list`
- Deploy K8S on GKE: `./deployK8s.sh`
- Deploy MongoDB Operator: `deployMdbOperator.sh`
- Deploy Ops Manger on K8S: `kubectl apply -f cluster.yaml`
- Set context to namespace mongodb: `kubectl config set-context --current --namespace=mongodb`
- Run `/.getStatus.sh`
- Update Ops Manager K8S manifest to contain the external URL: `kubectl -n mongodb patch om ops-manager --type=merge -p "{\"spec\":{\"configuration\":{\"mms.centralUrl\":\"${URL}\"}}}"`
- Log into OpsManager: Configure the ApiKey and whitelist your IP Address


