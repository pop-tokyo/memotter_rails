class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  wrap_parameters false

  skip_before_action :authenticate_user!
end
