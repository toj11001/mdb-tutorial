# How to create a sharded cluster

- Mofify the config `/etc/mongos_1.conf`
- Activate `mongos`: `mongos --config /etc/mongos_1.conf`
- add shard: `sh.addShard("m103-shard1/localhost:27000")`
- check status: `sh.status()`
- 