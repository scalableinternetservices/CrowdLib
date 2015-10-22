
require_relative 'error'

class Api::V1::UsersController < Api::V1::BaseController 
	def count
		render(json: { :users => { :count => User.count }})
	end

	def show_by_id
		user = User.find(params[:id])
		render(json: user)
	end

	def show_by_username
		user = User.find_by_username(params[:name])

		render(json: user) unless user.nil?
		render(json: Api::V1::Error::record_not_found(params)) if user.nil?
	end

	def index
		users = User.all
		render(json: { :users => users })
	end

end