require 'spec_helper'

describe "Edit profile page" do

	include Warden::Test::Helpers
	Warden.test_mode!
	
	before(:each) do
  		@user = User.create(:email => "test@test.com", :name => "Dr. Test", :address => "129 West 81st St. New York City", :title => "Psychotherapist", :degree => "PhD", :password=>"TestTest", :password_confirmation => "TestTest")
  		@specialty1 = Specialty.create(:name => "ADHD", :description => "Test description")
  		@specialty2 = Specialty.create(:name => "PTSD", :description => "Test description 2")
  		@user.specialties << @specialty1
  		login_as(@user, :scope => :user)
  		visit "/profile"
  	end

  	after(:each) do
  		Warden.test_reset! 
  	end

  	it "should have fields for all of the user's attributes" do
  		expect(page).to have_selector("#user_email")
  		expect(page).to have_selector("#user_name")
  		expect(page).to have_selector("#user_address")
  		expect(page).to have_selector("#user_title")
  		expect(page).to have_selector("#user_degree")
  	end

  	it "should allow a user to update their profile information" do
  		new_email = "test2@test2.com"
  		new_name = "Dr. Testington"
  		new_address = "871 St Marks Ave Brooklyn NY"
  		new_title = "Psychiatrist"
  		new_degree = "PhD"

  		within :css, "#edit_user" do
  			fill_in "user[email]", :with => new_email
  			fill_in "user[name]", :with => new_name
  			fill_in "user[title]", :with => new_title
  			fill_in "user[degree]", :with => new_degree
  			fill_in "user[current_password]", :with => @user.password
  		end

  		click_on "Update"
  		sleep 0.2
  		@user.reload

  		expect(@user.email).to eq(new_email)
  		expect(@user.name).to eq(new_name)
  		expect(@user.title).to eq(new_title)
  		expect(@user.degree).to eq(new_degree)
  	end

  	it "should have a form to add specialties to the user" do
  		expect(page).to have_content("Your Specialties: ")
  		expect(page).to have_selector("input[name='user[specialty_names][]']")
  	end

  	it "should list the user's current specialties" do
  		expect(page).to have_selector("input[value='#{@specialty1.name}'][checked]")
  	end

  	it "should allow the user to remove a specialty" do
  		uncheck "#{@specialty1.name}"
  		fill_in "user[current_password]", :with => @user.password
  		click_on "Update"
  		@user.reload

  		expect(@user.specialties).to_not include(@specialty1)
  	end

  	it "should allow the user to add a specialty" do
  		check "#{@specialty2.name}"
		  fill_in "user[current_password]", :with => @user.password
  		click_on "Update"
  		@user.reload

  		expect(@user.specialties).to include(@specialty2)
  	end


end