class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  wrap_parameters false

  skip_before_action :authenticate_user!

  private
  def sign_up_params
    params.permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.permit(:username, :email)
  end
end
