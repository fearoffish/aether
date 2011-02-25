current_dir    = File.dirname(__FILE__)

log_level                :info
log_location             STDOUT
node_name                'test'
client_key               "#{current_dir}/fake-chef-server-user-key.pem"
validation_key           "#{current_dir}/fake-chef-validator.pem"
validation_client_name   "fake-chef-validator"
chef_server_url          "https://api.opscode.com/organizations/test"
cache_type               'BasicFile'

knife[:aws_access_key_id] = "fake_key"
knife[:aws_secret_access_key] = "fake_secret"