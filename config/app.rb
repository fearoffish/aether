class App < Configurable # :nodoc:
  # Settings in config/app/* take precedence over those specified here.
  config.version = Aether::Application.version
  config.name = Rails.application.class.parent.name

  # Override these in your config/app/RAILS_ENV.rb file

  # How do we identify what 'cluster' a node is in?
  # node: the node information as given by Chef
  # name: the name that is being compared against  e.g. 'production'
  config.cluster_identification = lambda {|node,name| Cloud::Node.extract_cluster_name(node) == name }

  # HTTP_BASIC_AUTH user and pass
  config.username = 'admin'
  config.password = 'changeme'

  # Chef knife.rb config file location
  config.knife_config_file = "/etc/chef/knife.rb"
end
