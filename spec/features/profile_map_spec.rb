include Warden::Test::Helpers
Warden.test_mode!

describe "profile map", :js => true do

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
	end

  it "appears on the profile page" do
    visit "/profile/#{@user.id}"
    expect(page).to have_selector 'div#map'
  end


end