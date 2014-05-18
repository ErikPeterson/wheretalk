require 'spec_helper'

describe FreeBlock do
  
  before :each do
  	@user = User.create(:email => "test@test.com", :name => "Dr. Test", :address => "129 West 81st St. New York City", :title => "Psychotherapist", :degree => "PhD", :password=>"TestTest", :password_confirmation => "TestTest")
  	@schedule = @user.create_schedule
  	@freeblock = FreeBlock.new(:start_time => "8:30 am", :end_time => "9:30 am")
  end

  it "belongs to a schedule" do
  	@schedule.free_blocks << @freeblock
  	expect(@schedule.free_blocks).to include(@freeblock)
  end

end
