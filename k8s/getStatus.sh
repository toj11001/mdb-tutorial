NAMESPACE=mongodb

echo "Getting pods..."
kubectl get pods

echo "Getting PVCs..."
kubectl get pvc

echo "Getting stateful sets..."
kubectl get sts

# Check if ops-manager stateful sets are running
while true; do
    if [[ $(kubectl get sts ops-manager -o jsonpath='{.status.readyReplicas}') -eq 1 ]]; then
        echo "ops-manager is running."
        break
    else
        kubectl get sts ops-manager
        echo "ops-manager is not running. Retrying in 10 seconds..."
        sleep 10
    fi
done

echo "Getting services..."
kubectl get svc


export URL=http://$(kubectl -n "${NAMESPACE}" get svc ops-manager-svc-ext -o jsonpath='{.status.loadBalancer.ingress[0].ip}:{.spec.ports[0].port}')
echo "\nOps Manager URL: $URL"