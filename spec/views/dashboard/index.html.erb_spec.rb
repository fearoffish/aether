require 'spec_helper'

describe "dashboard/index.html.erb" do
  context "with a dev cluster" do
    before do
      VCR.insert_cassette('chef_dev_cluster', :record => :new_episodes)
      assign(:clusters, Cloud::Control.get_clusters)
    end

    it "should show the cluster name" do
      render
      rendered.should contain("dev")
    end

    it "should show nodes within the cluster" do
      render
      rendered.should contain("app1")
      rendered.should contain("db1")
      rendered.should contain("workers1")
    end
  
    it "should have a link to ssh into each node" do
      render
      rendered.should have_selector("a", :href => "ssh://100.100.100.100")
      rendered.should have_selector("a", :href => "ssh://110.110.110.110")
      rendered.should have_selector("a", :href => "ssh://120.120.120.120")
    end

    after do
      VCR.eject_cassette
    end
  end
end
