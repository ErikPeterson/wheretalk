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

		end
	end
end
