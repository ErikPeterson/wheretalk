require 'spec_helper'

describe Schedule do
  before :each do
  	@user = User.create(:email => "test@test.com", :name => "Dr. Test", :address => "129 West 81st St. New York City", :title => "Psychotherapist", :degree => "PhD", :password=>"TestTest", :password_confirmation => "TestTest")
  	@schedule = Schedule.new()
  end
  it "belongs to a user" do
  	@user.schedule = @schedule
  	expect(@user.schedule).to eq(@schedule)
  end
end
