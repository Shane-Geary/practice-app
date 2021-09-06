module API 
    module V1
        class VenuesController < ApplicationController
            def index
                venues = Venues.all
                render :json VenueSerializer.new(venues, options).serialized_json
            end

            def show 
                venue = Venue.find_by(slug: params[:slug])
                render :json VenueSerializer.new(venue, options).serialized_json
            end

            def create 
                venue = Venue.new(venue_params)

                if venue.save
                    render :json VenueSerializer.new(venue).serialized_json
                else 
                    render :json { error: venue.error.message }, status: 422
                end
            end

            def update 
                venue = Venue.find_by(slug: params[:slug])

                if venue.update(venue_params)
                    render :json VenueSerializer.new(venue, options).serialized_json
                else 
                    render :json {error: venue.error.message}, status: 422
                end
            end

            def destroy  
                venue = Venue.find_by(slug: params[:slug])

                if venue.destroy 
                    head: no_content
                else 
                    render :json {error: venue.error.message}, status: 422
                end
            end

            Private

            def venue_params
                params.require(:venue).permit(:name, :image_url)
            end

            def options
                @options ||= { include %i[reviews] }
            end
        end
    end
end