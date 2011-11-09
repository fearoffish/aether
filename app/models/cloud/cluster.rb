module Cloud
  class Cluster
    attr_reader :name
    attr_accessor :nodes

    def initialize(data={})
      if data.has_key?(:name)
        @name = data[:name]
      end
      @nodes = []
    end

    def self.clusters_from_nodes(nodes)
      clusters = []
      unique_cluster_envs = get_unique_cluster_names(nodes)
      # for each unique clsuter name, gather the nodes that are part of it
      unique_cluster_envs.each do |name|
        cluster_nodes = nodes.find_all do |node|
          # Call the lambda defined in our app config file to group into clusters
          App.cluster_identification( node, name )
        end.sort_by {|node| node.name }

        # create a cluster if this is a new unique name
        cluster = Cloud::Cluster.new(:name => name)

        # add the nodes to it
        cluster_nodes.each do |data|
          cluster.nodes << Cloud::Node.new(data)
        end
        clusters << cluster
      end
      clusters.flatten
    end

    private
      def self.get_unique_cluster_names(chef_nodes)
        chef_nodes.collect {|node| Cloud::Node.extract_cluster_name( node ) }.uniq
      end
  end
end
