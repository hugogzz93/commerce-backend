class ApplicationController < ActionController::API
 # This is our new function that comes before Devise's one
  # before_action :authenticate_user_from_token!
  # This is Devise's authentication
  # before_action :authenticate_user!

  private
  
  # For this example, we are simply using token authentication
  # via parameters. However, anyone could use Rails's token
  # authentication features to get the token from a header.

  # def authenticate_user_from_token!
  #   debugger
  #   user_token = request.headers['auth_token']
  #   user       = user_token && User.find_by_authentication_token(user_token.to_s)
  #
  #   if user
  #     # Notice we are passing store false, so the user is not
  #     # actually stored in the session and a token is needed
  #     # for every request. If you want the token to work as a
  #     # sign in token, you can simply remove store: false.
  #     sign_in user, store: false
  #   end
  # end

  def authenticate_user_from_token!
    user_token = request.headers['HTTP_AUTH_TOKEN']
    user       = user_token && User.find_by_authentication_token(user_token.to_s)
    if user
      sign_in user, store: false
    end
  end
end
