module AuthHelper
  # do admin login
  def admin_login
    user = 'admin'
    pass = 'changeme'
    request.env['HTTP_AUTHORIZATION'] = 
      ActionController::HttpAuthentication::Basic.encode_credentials(user,pass)
  end  
end