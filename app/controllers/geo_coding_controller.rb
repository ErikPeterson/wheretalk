class GeoCodingController < ApplicationController
	
	def geocode
		address = params["address"]
		results = Geocoder.search(address);
		location_object = results[0].data
		latlng = location_object["geometry"]["location"]
		formatted_address = location_object["formatted_address"]

		render :inline=>"{\"formattedAddress\": \"#{formatted_address}\", \"location\": #{latlng.to_json}}"
	end

	def get_nearby

		location = params["location"]
		results = Geocoder.search(location)

		return render :inline=>'{"error":"Address not locatable"}' if !results[0] || !results[0].data
		
		location_object = results[0].data
		@center = location_object["geometry"]["location"]
		@formatted_address = location_object["formatted_address"];
		@doctors = User.near(@formatted_address)
		render :template=> 'json/nearby_doctors', :layout => false, :content_type => 'application/json'
	end
end
