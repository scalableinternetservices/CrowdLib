
class Api::V1::Error
	def self.any_error id, message, pars
		{ :error => { :code => id, :message => message, :details => pars }}
	end

	def self.record_not_found pars
		any_error 1, "Record not found", pars
	end
end