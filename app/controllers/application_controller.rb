class ApplicationController < ActionController::API
  before_action :authorized?

  private

  def authorized?
    response = AuthService.check_token(request.authorization)
    if response.status >= 400
      render json: { errors: "User not authorized."}
    end
  end
  # check user is valid and logged in
  # make api call to micro_auth using service
  # pass supplied bearer token to micro_auth service
  # refresh token with every check, to prevent time out
  # create errors if user does not exist or isn't logged in 
  # proceed normally if user is valid
end
