require 'spec_helper'

include Cloud

describe Cloud::Cluster do

  it "can initialize with a hash containing a cluster name" do
    cluster = Cluster.new(:name => 'new_cluster')
    cluster.name.should == 'new_cluster'
  end

  context "#clusters_from_nodes" do
    it "creates cluster instances" do
      clusters = Cluster.clusters_from_nodes([dev_app_node_from_fixture])
      clusters.should_not be_empty
      clusters.each {|c| c.class.should == Cluster }
    end

    it "determines the cluster names from the :cluster_environment attribute" do
      clusters = Cluster.clusters_from_nodes([dev_app_node_from_fixture])
      clusters.should_not be_empty
      clusters.each {|c| c.name.should == 'dev' }
    end

    it "creates a new cluster for each cluster_environment" do
      clusters = Cluster.clusters_from_nodes(multiple_clusters_from_fixture)
      clusters.size.should == 2
      %w{ dev prod }.each do |cluster_name|
        clusters.collect {|c| c.name }.should include(cluster_name)
      end
    end

    it "creates a Node object" do
      cluster = Cluster.clusters_from_nodes(dev_cluster_from_fixture)[0]
      cluster.nodes.each {|n| n.class.should == Node }
    end
    
    it "creates the same count of nodes as it receives" do
      cluster = Cluster.clusters_from_nodes(dev_cluster_from_fixture)[0]
      cluster.nodes.size.should == 2
    end

  end

  context "#nodes" do
    it "is empty by default" do
      cluster = Cluster.new
      cluster.nodes.should be_empty
    end
  end

end