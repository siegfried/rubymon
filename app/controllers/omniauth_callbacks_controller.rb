class OmniauthCallbacksController < ApplicationController
  def facebook
    @user = User.find_or_create_from_auth_hash(auth_hash)
    sign_in_and_redirect @user, :event => :authentication
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
