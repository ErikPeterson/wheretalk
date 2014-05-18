class GeoCodingController < ApplicationController

def get_nearby

		location = params["location"]
		results = Geocoder.search(location)
		distance = params[:distance]
		specialties = params[:tags]
		payment_methods = params[:paymentMethods]

		return render :inline=>'{"error":"Address not locatable"}' if !results[0] || !results[0].data

		if specialties
			specialty_ids = specialties.map(&:to_i)
		else
			specialty_ids = []
		end

		if payment_methods
			payment_method_ids = payment_methods.map(&:to_i)
		else
			payment_method_ids = []
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
			end
			if !payment_method_ids.empty?
				@doctors = @doctors.reject do |el|
					(payment_method_ids & el.payment_method_ids) != payment_method_ids
				end
			end
		else
			@doctors = []
		end

		render :template=> 'json/nearby_doctors', :layout => false, :content_type => 'application/json'
	end
end
