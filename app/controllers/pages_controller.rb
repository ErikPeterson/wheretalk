class PagesController < ApplicationController
	
	def index
		@specialties = Specialty.order(:name)
	end

	def profile
		return redirect_to "/users/edit" if current_user && !params[:id]
		return redirect_to "/users/sign_in" if !current_user && !params[:id]
		@doctor = User.find(params[:id]);
	end

end
