gcloud container clusters create mongodb-ops-manager-cluster \
    --zone europe-central2-a \
    --num-nodes 1 \
    --machine-type e2-standard-2 \
    --enable-autoscaling --total-min-nodes 2 --total-max-nodes 6 \
    --labels owner=tobias_joschko,purpose=demo,expire-on=2024-07-19

echo "fetching kubeconfig for mongodb-ops-manager-cluster"
gcloud container clusters get-credentials mongodb-ops-manager-cluster --region europe-central2