require 'spec_helper'

describe "geolocation map", :js=>true do

  it "appears on the index page" do
    visit "/"
    expect(page).to have_selector 'div#map'
  end

  it "should initiate with geolocation API" do
    visit "/"
    within :css, "#location-form" do
       click_on "geo-init"
    end
    sleep 0.2
   	expect(page).to have_selector "div#map[data-loc-lat='40.714224']"
   	expect(page).to have_selector "div#map[data-loc-long='-73.961452']"
  end

  it "should initiate with an address" do
  	visit "/"
  	within :css, "#location-form" do
  		fill_in "address", :with => "871 St. Marks Ave, Brooklyn, NY 11213"
  		click_on "submit"
  	end
  	sleep 0.2
  	expect(page).to have_selector "div#map[data-loc-lat]"
  	expect(page).to have_selector "div#map[data-loc-long]"
  end

  it "should have a map"do
  	visit "/"
  	expect(page).to have_selector "div.gm-style"
  end

end