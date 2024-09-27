# MongoDB Kubernetes Operator

## Instructions on how to setup a Kubernetes Cluster on GKE with MongoDB Ops Manager 

MongoDB Blog resources for OpsManager on K8S: https://www.mongodb.com/developer/products/connectors/deploying-across-multiple-kubernetes-clusters/

GCP CLI
- List clusters: `gcloud container clusters list`
- Deploy K8S on GKE: `./1_deployK8s.sh`
- Deploy MongoDB Operator: `2_deployMdbOperator.sh`
- Deploy Ops Manger on K8S: `kubectl apply -f opsManager.yaml`
- Set context to namespace mongodb: `kubectl config set-context --current --namespace=mongodb`
- Run `./4_getStatus.sh`
- Update Ops Manager K8S manifest to contain the external URL: `kubectl -n mongodb patch om ops-manager --type=merge -p "{\"spec\":{\"configuration\":{\"mms.centralUrl\":\"${URL}\"}}}"`
- Log into OpsManager: Configure the ApiKey and whitelist your IP Address
    - Go to your Org -> `Access Manager` --> `API Keys` -> Click `Create API Key` (Permision `Org Owner`)
- Deploy the MongoDB Cluster
    - `5_deployDB.sh`
- Cleaning Up:
    - Tear Down MongoDB: `kubectl delete -f config.yaml -f DemoDB.yaml` 
    - Tear Down Ops Manager: `kubectl delete -f opsManager.yaml`
    - Delete all pvcs: `kubectl delete pvc --all -n mongodb`
    - Delete load balancers: `kubectl delete -f lb.yaml`


