require 'chef/knife'
require 'chef/data_bag_item'

module Cloud
  class Search < ::Chef::Knife
    def initialize
      super
      late_load_deps
      config[:config_file] ||= App.knife_config_file
      configure_chef
      @q = ::Chef::Search::Query.new
      @results = { 
        :total => 0, 
        :start => config[:start] ? config[:start] : 0, 
        :nodes => [ ], 
        :clusters => [ ] 
      }
    end

    def search(search_type, search_terms)
      items = []
      @q.search(
        search_type, 
        search_terms, 
        config[:sort], 
        config[:start] ? config[:start] : 0, 
        config[:rows] ? config[:rows] : 1000) do |item|
          items << item
      end
      items
    end

    def late_load_deps
      require 'chef/shef/ext'
    end

    def get_clusters(filter="")
      nodes = []
      @q.search(
        :node, 
        "name:*#{filter}*", 
        config[:sort], 
        config[:start] ? config[:start] : 0, 
        config[:rows] ? config[:rows] : 1000) do |item|
          nodes << item
      end
      @results = Cloud::Cluster.clusters_from_nodes(nodes)
    end
  end
end