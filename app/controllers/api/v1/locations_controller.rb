require_relative 'error'

class Api::V1::LocationsController < Api::V1::BaseController
	def show_by_id # ID
		loc = Location.find(params[:id])
		render(json: loc)
	end

	def show_by_distance # LAT LNG LIMIT
		rlat = (params[:lat].to_f * 100).round.to_f / 100
		rlng = (params[:lng].to_f * 100).round.to_f / 100
		addr = "at:#{rlat}:#{rlng}:#{Math.log10(params[:limit].to_f).round}"
		
		cached = $redis.smembers addr

		if cached.empty?
			locs = Location.within(
				params[:limit], 
				:origin => [ params[:lat], params[:lng] ]
			).pluck()
			
			$redis.sadd addr, locs.to_a # add locations to a set with key "at:lat:loc:limit"
			$redis.expire addr, 300		# the set will expire in 5mins (explore value)

			cached = locs
		end

		render(json: cached)
	end

	def delete_by_id # ID
		loc = Location.find(params[:id])
		loc.destroy
	end
end
