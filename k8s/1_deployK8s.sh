# Calculate the date 7 days from now
EXPIRE_ON=$(date -v+7d +%Y-%m-%d)

# Create the GKE cluster with the calculated expire-on date
gcloud container clusters create mongodb-ops-manager-cluster \
    --region europe-west3 \
    --num-nodes 1 \
    --machine-type e2-highmem-2 \
    --enable-autoscaling --total-min-nodes 3 --total-max-nodes 6 \
    --labels owner=tobias_joschko,purpose=demo,expire-on=$EXPIRE_ON

echo "fetching kubeconfig for mongodb-ops-manager-cluster"
gcloud container clusters get-credentials mongodb-ops-manager-cluster --region europe-west3