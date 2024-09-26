#!/bin/bash

# Namespace where MongoDB services are running
NAMESPACE="mongodb"

# Service names for the MongoDB replica set pods
SERVICES=("demo-mongodb-cluster-1-0-lb" "demo-mongodb-cluster-1-1-lb" "demo-mongodb-cluster-1-2-lb")

# Replica Set Name
REPLICA_SET_NAME="demo-mongodb-cluster-1"

# Initialize an empty array to hold the external IPs
EXTERNAL_IPS=()

# Loop through each service to get its external IP
for SERVICE in "${SERVICES[@]}"; do
    # Initialize a counter for retry attempts
    RETRY_COUNT=0

    # Loop until an external IP is found or maximum retry attempts reached
    while [[ -z "$EXTERNAL_IP" && $RETRY_COUNT -lt 5 ]]; do
        # Get the external IP using kubectl and jsonpath
        EXTERNAL_IP=$(kubectl get svc "$SERVICE" -n "$NAMESPACE" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

        # Check if an external IP was found
        if [[ -z "$EXTERNAL_IP" ]]; then
            echo "External IP for service $SERVICE not found. Retrying in 15 seconds..."
            sleep 15
            RETRY_COUNT=$((RETRY_COUNT + 1))
        fi
    done

    # Check if maximum retry attempts reached without finding an external IP
    if [[ -z "$EXTERNAL_IP" ]]; then
        echo "External IP for service $SERVICE not found after maximum retry attempts. Exiting..."
        exit 1
    fi

    # Append the IP and port to the EXTERNAL_IPS array
    EXTERNAL_IPS+=("${EXTERNAL_IP}:27017")
done

# Join the IPs into a comma-separated list
CONNECTION_STRING=$(IFS=, ; echo "${EXTERNAL_IPS[*]}")

# Output the final connection string for MongoDB Compass or application
echo "MongoDB Connection String:"
echo "mongodb://${CONNECTION_STRING}/?replicaSet=${REPLICA_SET_NAME}"