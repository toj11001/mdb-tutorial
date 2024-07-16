# check logs of the operator for IP Access issues
POD=$(kubectl -n mongodb get po|grep operator|awk '{ print $1 }')
kubectl -n mongodb logs -f po/$POD|grep IP_ADDRESS_NOT_ON_ACCESS_LIST