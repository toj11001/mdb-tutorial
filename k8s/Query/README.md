# Demo Data for the Performance advisor

- Update `IP=` and execute `loadData.sh` to import data into your MongoDB cluster
- Connect to your cluster with `mongosh` and execute the javascript query inside `execQueery.js`. After a few minutes the performance advisor shoudl give you advise to create a compound index to improve the query performance
