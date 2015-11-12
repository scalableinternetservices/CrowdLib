class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user.to_json
    render 'profile'
  end

  def save
    current_user.username = params[:username]
    current_user.first_name = params[:first_name]
    current_user.last_name = params[:last_name]
    current_user.lat = params[:lat]
    current_user.lng = params[:lng]
    current_user.address = params[:address]
    current_user.save
    render json: { user: current_user, params: params }
  end
end
