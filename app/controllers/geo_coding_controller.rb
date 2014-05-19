class GeoCodingController < ApplicationController

def get_nearby

		location = params["location"]
		results = Geocoder.search(location)
		distance = params["distance"]
		return render :inline=>'{"error":"Location not geo-codable"}' if !results[0] || !results[0].data

		location_object = results[0].data
		
		if params[:specialties]
			specialties = Specialty.find(params[:specialties])
		end

		if !params["paymentMethod"].empty?
			payment_method = PaymentMethod.find(params[:paymentMethod])
		end



		@center = location_object["geometry"]["location"]
		@formatted_address = location_object["formatted_address"];
		@doctors = User.near(@formatted_address, distance)

		puts @doctors

		if @doctors.empty?
			return render :inline => '{"error":"No doctors found within your search area"}' 
		end

		

		if payment_method
			@doctors = @doctors & payment_method.users
		end


		return render :inline => '{"error":"No doctors found within your search area that accept your preferred payment method."}' if @doctors.empty?

	
		if specialties
			@doctors = @doctors.reject do |doctor|
				(doctor.specialties & specialties).empty?
			end
		end

		return render :inline => '{"error":"No doctors specializing in your choices found within your search area that accept your preferred payment method."}' if @doctors.empty?



		render :template=> 'json/nearby_doctors', :layout => false, :content_type => 'application/json'
	end
end
