require 'spec_helper'

describe PagesController do
	
	describe "#index" do
		
		it "should render the root route" do
			get :index
			expect(response).to render_template("index")
		end

	end

	describe "#profile" do
	
		describe "without an id in params"	do
			describe "with a logged in user" do
				render_views
				before :each do	
			  		@user = User.create({
			  			:email => "test@test.com",
			  			:name => "Dr. Test McTest",
			  			:title => "Psychiatrist",
			  			:phone => Faker::PhoneNumber.phone_number,
			  			:photo_url => "male-doctor.jpg",
			  			:degree => "PhD",
			  			:address => "129 West 81st St. #5A, New York, New York, 10024",
			  			:password => "Testing123!",
			  			:password_confirmation => "Testing123!",
			  		})
			  		sign_in @user
				end
			
				it "should redirect the edit page for the user" do
					get :profile
					expect(response).to redirect_to "/users/edit"
				end

			end

			describe "without a logged in user" do
				it "should redirect to the sign_in route" do
					get :profile
					expect(response).to redirect_to "/users/sign_in"
				end
			end

		end
		describe "with an id in params" do
				render_views
			
				before :each do	
			  		@user = User.create({
			  			:email => "test@test.com",
			  			:name => "Dr. Test McTest",
			  			:title => "Psychiatrist",
			  			:degree => "PhD",
			  			:phone => Faker::PhoneNumber.phone_number,
			  			:photo_url => "male-doctor.jpg",
			  			:address => "129 West 81st St. #5A, New York, New York, 10024",
			  			:password => "Testing123!",
			  			:password_confirmation => "Testing123!",
			  		})
				end

				it "should show the profile of the appropriate doctor" do
					get :profile, :id => @user.id
					expect(response.body).to match(@user.name)
					expect(response.body).to match(@user.title)
					expect(response.body).to match(@user.degree)
					expect(response.body).to match(@user.address.split(", ").join(",<br />"))
				end
		end
	end

end
