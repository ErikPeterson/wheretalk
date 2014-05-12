require 'spec_helper'

describe UserSpecialty do
  before(:each) do
  	@specialty = Specialty.create(:name=>"Test", :description=>"Test test")
  	@user = User.create(:email => "test@test.com", :name => "Dr. Test", :address => "129 West 81st St. New York City", :title => "Psychotherapist", :degree => "PhD")
  	@user_specialty = UserSpecialty.new( :user_id=>@user.id, :specialty_id => @specialty.id, :user_notes => "I'm really, really, really good at this stuff.")
  end

  it "is a join model between users and specialties" do
  	@user_specialty.save()
  	expect(@user_specialty.user).to eq(@user)
  	expect(@user_specialty.specialty).to eq(@specialty)
  	expect(@user.specialties).to include(@specialty)
  	expect(@specialty.users).to include(@user)
  end

  it "will not save without a user" do
  	@user_specialty.user = nil
  	expect(@user_specialty.save).to eq(false)
  end

  it "will not save without a specialty" do
  	@user_specialty.specialty = nil
  	expect(@user_specialty.save).to eq(false)
  end

  it "can have an optional note from the user" do
  	@user_specialty.save
  	expect(@user_specialty.user_notes).to equal("I'm really, really, really good at this stuff.")
  end

  it "cannot hold more than 140 characters of notes" do
  	user_notes = ""
  	141.times { user_notes << "a"}
  	@user_specialty.user_notes = user_notes
  	expect(@user_specialty.save).to eq(false)
  end

end
