AWS OpsWorks MongoDB Replicaset
===============================

Chef Recipe for a MongoDB Replicaset running in AWS OpsWorks

Detailed instructions http://netinlet.com/blog/2014/01/18/setting-up-a-mongodb-replicaset-with-aws-opsworks/

## Custom JSON

```
{
  "mongodb" : {
    "config": {
      "auth": true,
      "replSet": "mongo-rs"
    },
    "cluster_name": "mongo-cluster",
    "auto_configure": {
      "replicaset": true
    },
    "key_file_content": "foo",
    "admin": {
      "username": "baradmin",
      "password": "bar"
    },
    "users": [
      {
        "username": "bazuser",
        "password": "baz"
      }
    ]
  }
}
```

After creating the first machine, log via **ssh** to **mongo**, create your users and trigger a **rs.initiate()**.

## Adding secondary nodes

Provision your new nodes, then log into the primary mongo and add the other machine as a replica:

```
rs.add("second-machine.example.org")
```

