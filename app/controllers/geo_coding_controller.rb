class GeoCodingController < ApplicationController
	
	def geocode
		address = params["address"]
		results = Geocoder.search(address);
		location_object = results[0].data
		latlng = location_object["geometry"]["location"]
		formatted_address = location_object["formatted_address"]

		render :inline=>"{\"formattedAddress\": \"#{formatted_address}\", \"location\": #{latlng.to_json}}"
	end

end
