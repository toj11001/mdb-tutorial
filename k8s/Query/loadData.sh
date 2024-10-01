IP=34.89.171.254
mgeneratejs CustomerSingleView.json -n 1000000 | mongoimport --uri "mongodb://$IP/test" --collection customers --numInsertionWorkers=10