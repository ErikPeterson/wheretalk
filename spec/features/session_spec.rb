require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "login" do

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
	end

  it "has a link on the header" do
    visit "/"
    within :css, "header" do
      click_on "Sign In"
    end
    expect(page).to have_selector '#new_user'
  end

  it "lives at /users/sign_in" do
    visit "/users/sign_in"
    expect(page).to have_selector '#new_user'
  end

  it "redirects to profile on successful login" do
    visit "/users/sign_in"
    within :css, "#new_user" do
      fill_in "user_email", :with=> @user.email
      fill_in "user_password", :with=> @user.password
      click_on "Sign in"
    end
    expect(page).to have_content @user.name
  end

end