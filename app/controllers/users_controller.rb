class UsersController < ApplicationController

	skip_before_filter :verify_authenticity_token

	def index
		@users = User.paginate(:page => params[:page], :per_page => 15)

	end

	def profile
		if current_user
			@user = current_user
		else
			redirect_to new_user_session_path, notice: 'Please login to view your profile.'
		end
	end

	def edit
		if current_user
		  @user=current_user
		else
     	  redirect_to new_user_session_path, notice: 'You are not logged in.'
    	end
    end

	private
	def user_params
      params.require(:user).permit(:username, :email, :first_name, :last_name, :address, :lat, :lng)
	end

end

