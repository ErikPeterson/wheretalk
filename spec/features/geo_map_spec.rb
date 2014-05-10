include Warden::Test::Helpers
Warden.test_mode!

describe "geolocation map", :js=>true do

  it "appears on the index page" do
    visit "/"
    expect(page).to have_selector 'div#map'
  end

  it "should initiate with geolocation API" do
    visit "/"
    simulate_location 40, 73, page
    click_on "Use My Location"
    sleep 0.2
   	expect(page).to have_selector "div#map[data-loc-lat=40]"
   	expect(page).to have_selector "div#map[data-loc-lng=73]"
  end

  it "should initiate with an address" do
  	visit "/"
  	within :css, "#location-modal" do
  		fill_in "Address", :with => "871 St. Marks Ave, Brooklyn, NY 11213"
  		click_on "Submit"
  	end
  	sleep 0.2
  	expect(page).to have_sector "div#map[data-loc-lat]"
  	expect(page).to have_sector "div#map[data-loc-lng]"
  end

  it "should have a map"do
  	visit "/"
  	expect(page).to have_selector "div.gm-style"
  end

end