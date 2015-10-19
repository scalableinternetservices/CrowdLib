
require_relative 'error'

class Api::V1::BaseController < ApplicationController
	around_filter :catch_not_found	

private
	
	def catch_not_found
		yield
	rescue ActiveRecord::RecordNotFound
		render(json: Api::V1::Error::record_not_found(params))
	end
end

