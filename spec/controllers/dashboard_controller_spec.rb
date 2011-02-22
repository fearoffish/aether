require 'spec_helper'

describe DashboardController, "#index" do
  include AuthHelper

  context "for a non-authenticated user" do
    before do
      get :index
    end

    it { should respond_with(:unauthorized) }
  end

  context "for an authenticated user" do
    before do
      VCR.insert_cassette('chef_blank', :record => :none)
      admin_login
      get :index
    end

    it { should assign_to(:clusters) }
    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }

    after do
      VCR.eject_cassette
    end
  end
end