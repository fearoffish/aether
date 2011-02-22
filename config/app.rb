class App < Configurable # :nodoc:
  # Settings in config/app/* take precedence over those specified here.
  config.version = Aether::Application.version
  config.name = Rails.application.class.parent.name

  config.cluster_identification = lambda {|node,name| node[:cluster_environment] == name }
end
