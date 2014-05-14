class GeoCodingController < ApplicationController

def get_nearby

		location = params["location"]
		results = Geocoder.search(location)
		distance = params[:distance]
		specialties = params[:tags]
		return render :inline=>'{"error":"Address not locatable"}' if !results[0] || !results[0].data

		if specialties
			specialty_ids = params["tags"].map(&:to_i)
		else
			specialty_ids = []
		end

		location_object = results[0].data
		@center = location_object["geometry"]["location"]
		@formatted_address = location_object["formatted_address"];

		doctors = User.near(@formatted_address, distance)
		if doctors
			if !specialty_ids.empty?
				@doctors = doctors.reject do |el| 
					(specialty_ids & el.specialty_ids) != specialty_ids
				end
			else
				@doctors = doctors
			end
		else
			@doctors = []
		end

		render :template=> 'json/nearby_doctors', :layout => false, :content_type => 'application/json'
	end
end
