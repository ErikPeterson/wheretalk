require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "profile map" do

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
		});
	end

  it "appears on the profile page" do
    visit "/profile/#{@user.id}"
    expect(page).to have_selector 'div#map'
  end

  it "should have data on lat and long of doctor" do
    visit "/profile/#{@user.id}"
    expect(page).to have_selector "div#map[data-lat='#{@user.latitude}']"
    expect(page).to have_selector "div#map[data-long='#{@user.longitude}']"
  end

  it "should have a map", :js=>true do
  	visit "/profile/#{@user.id}"
  	expect(page).to have_selector "div.gm-style"
  end
end