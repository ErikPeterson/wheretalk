require 'spec_helper'

describe User do
  describe "::create" do
  	describe "validations" do
	  	before :each do
	  		@user = User.new().tap{|u|
	  			u.email = "test@test.com"
	  			u.name = "Dr. Test McTest"
	  			u.title = "Psychiatrist"
	  			u.degree = "PhD"
	  			u.address = "129 West 81st St. #5A, New York, New York, 10024"
	  			u.password = "Testing123!"
	  			u.password_confirmation = "Testing123!"
	  		}
	  	end
	  	it "will save with valid values for all attributes" do
	  		expect(@user.save).to equal(true)
	  	end
	  	it "cannot have a blank email" do
	  		@user.email = ""
	  		expect(@user.save).to equal(false)
	  	end
	  	it "must have a valid email" do
	  		@user.email = "Mr. Bogus"
	  		expect(@user.save).to equal(false)
	  	end
	  	it "cannot have a blank name" do
	  		@user.name = ""
	  		expect(@user.save).to equal(false)
	  	end
	  	it "cannot have a blank address" do
	  		@user.address = ""
	  		expect(@user.save).to equal(false)
	  	end
	  	it "cannot have a blank degree" do
	  		@user.degree = ""
	  		expect(@user.save).to equal(false)
	  	end
	  	it "cannot have a blank title" do
	  		@user.title = ""
	  		expect(@user.save).to equal(false)
	  	end
	  	it "converts address to latitude and longitude" do
	  		@user.save
	  		expect(@user.latitude).to_not be_nil
	  		expect(@user.longitude).to_not be_nil
	  	end
	end
  end
end
