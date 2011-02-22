class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  private
    def authenticate
      authenticate_or_request_with_http_basic do |user_name, password|
        user_name == ENV['AETHER_USER'] && password == ENV['AETHER_PASS']
      end
    end
end
