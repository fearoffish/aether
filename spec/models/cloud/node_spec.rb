require "spec_helper"

include Cloud

describe Cloud::Node do

  context "initialized with Chef Node data" do
    it "should set the name attribute" do
      node = Node.new(dev_app_node_from_fixture)
      node.name.should == "app1"
    end

    it "should set the cluster_name attribute" do
      node = Node.new(dev_app_node_from_fixture)
      node.cluster_name.should == "dev"
    end

    it "should set the public_ips attribute" do
      node = Node.new(dev_app_node_from_fixture)
      node.public_ips.should == ["50.16.76.27"]
    end

    it "should set the private_ips attribute" do
      node = Node.new(dev_app_node_from_fixture)
      node.private_ips.should == ["10.255.207.241"]
    end

    it "should not set the instance_id attribute" do
      node = Node.new(non_ec2_node_from_fixture)
      node.instance_id.should be_nil
    end

    context "with an ec2 instance" do
      it "should set the instance_id attribute" do
        node = Node.new(dev_app_node_from_fixture)
        node.instance_id.should == "i-eb65ed87"
      end
    end
  end
end