module API 
    module V1
        class VenuesController < ApplicationController
            def index
                venues = Venues.all
                render :json VenueSerializer.new(venues).serialized_json
            end

            def show 
                venue = Venue.find_by(slug: params[:slug])
                render :json VenueSerializer.new(venue).serialized_json
            end
        end
    end
end