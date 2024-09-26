kubectl delete -f config.yaml -f DemoDB.yaml
kubectl delete -f opsManager.yaml   
kubectl delete pvc --all -n mongod
kubectl delete -f lb.yaml