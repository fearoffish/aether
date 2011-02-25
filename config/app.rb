class App < Configurable # :nodoc:
  # Settings in config/app/* take precedence over those specified here.
  config.version = Aether::Application.version
  config.name = Rails.application.class.parent.name

  config.cluster_identification = lambda {|node,name| node[:cluster_environment] == name }
  
  # Override these in your config/app/RAILS_ENV.rb file
  
  # HTTP_BASIC_AUTH user and pass
  config.username = 'admin'
  config.password = 'changeme'
  
  # Chef knife.rb config file location
  config.knife_config_file = "/etc/chef/knife.rb"
end
