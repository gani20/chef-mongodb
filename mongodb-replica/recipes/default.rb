node.override['mongodb']['default_init_name'] = 'mongod'
node.override['mongodb']['config']['dbpath'] = '/mnt/mongo-data/'
node.override['mongodb']['config']['sslMode'] = 'requireSSL'
node.override['mongodb']['config']['sslPEMKeyFile'] = '/etc/ssl/mongodb/concat.pem'

include_recipe "mongodb::mongodb_org_repo"
include_recipe "mongodb::replicaset"
