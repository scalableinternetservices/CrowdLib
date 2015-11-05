
class Api::V1::Error
	def self.any_error id, message, pars
		{ :error => { :code => id, :message => message, :details => pars }}
	end

	def self.record_not_found pars
		any_error 1, "Record not found", pars
	end

	def self.username_already_in_use pars
		any_error 2, "Username already in use", pars
	end

	def self.token_not_correct pars 
		any_error 3, "Token not correct", pars
	end

	def self.user_does_not_exist pars 
		any_error 4, "User does not exist", pars
	end

	def self.could_not_authenticate pars 
		any_error 5, "Could not authenticate", pars
	end
end