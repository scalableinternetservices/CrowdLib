require_relative 'error'

class Api::V1::LocationsController < Api::V1::BaseController
        def show_by_id # ID
                loc = Location.find(params[:id])
                render(json: loc)
        end

        def show_by_distance # LAT LNG LIMIT
                locs = Location.within(params[:limit], :origin => [ params[:lat], params[:lng] ])

                render(json: locs)
        end
end
