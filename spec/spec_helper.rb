# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'vcr'

VCR.config do |c|
  c.cassette_library_dir     = 'spec/fixtures/cassette_library'
  c.stub_with                :fakeweb
  c.ignore_localhost         = false
  c.default_cassette_options = { :record => :none }
end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
end

def load_fixture(name)
  YAML::load( File.open( File.join(File.dirname(__FILE__), "fixtures/#{name}.yml") ) )
end

def dev_cluster_from_fixture
  load_fixture("dev_cluster")
end

def multiple_clusters_from_fixture
  load_fixture("multiple_clusters")
end

def dev_app_node_from_fixture
  load_fixture "dev_app_node"
end

def dev_db_node_from_fixture
  load_fixture "dev_db_node"
end

def dev_worker_node_from_fixture
  load_fixture  "dev_worker_node"
end

def non_ec2_node_from_fixture
  load_fixture  "non_ec2_node"
end