class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :address, :lat, :lng)
  end

  def account_update_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :current_password, :address, :lat, :lng)
  end
end
