./2_deployMdbOperator.sh

kubectl apply -f opsManager.yaml

kubectl config set-context --current --namespace=mongodb

./4_getStatus.sh