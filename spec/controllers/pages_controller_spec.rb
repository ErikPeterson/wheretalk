require 'spec_helper'

describe PagesController do
	
	describe "#index" do
		
		it "should render the root route" do
			get :index
			expect(response).to render_template("index")
		end

	end

	describe "#profile" do
		
		describe "with a logged in user" do
			render_views
			before :each do	
		  		@user = User.create({
		  			:email => "test@test.com",
		  			:name => "Dr. Test McTest",
		  			:title => "Psychiatrist",
		  			:degree => "PhD",
		  			:address => "129 West 81st St. #5A, New York, New York, 10024",
		  			:password => "Testing123!",
		  			:password_confirmation => "Testing123!",
		  		})
		  		sign_in @user
			end
		
			it "should render the user's profile page" do
				get :profile
				expect(response).to render_template("profile")
			end

			it "should have the user's profile information" do
				get :profile
				expect(response.body).to match(@user.name)
				expect(response.body).to match(@user.email)
				expect(response.body).to match(@user.title)
				expect(response.body).to match(@user.degree)
				expect(response.body).to match(@user.address)
			end

		end

		describe "without a logged in user" do
			it "should redirect to the sign_in route" do
				get :profile
				expect(response).to redirect_to "/users/sign_in"
			end
		end

	end

end
