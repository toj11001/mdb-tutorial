NAMESPACE=mongodb

echo "Getting pods..."
kubectl get pods

echo "Getting PVCs..."
kubectl get pvc

echo "Getting stateful sets..."
kubectl get sts

echo "Getting services..."
kubectl get svc


export URL=http://$(kubectl -n "${NAMESPACE}" get svc ops-manager-svc-ext -o jsonpath='{.status.loadBalancer.ingress[0].ip}:{.spec.ports[0].port}')
echo "\nOps Manager URL: $URL"