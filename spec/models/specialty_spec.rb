require 'spec_helper'

describe Specialty do
  before(:each) do
  	@specialty = Specialty.new()
  end

  it "is instantiated with a name and a description" do
  	@specialty.name = "Test Specialty"
  	@specialty.description = "Description of the test specialty."
  	expect(@specialty.save).to equal(true)
  end

  it "will not instantiate without a name" do
  	@specialty.description = "Description of the test specialty."
  	expect(@specialty.save).to equal(false)
  end

  it "will not instantiate without a description" do
  	@specialty.name = "Test Specialty"
  	expect(@specialty.save).to equal(false)
  end

  it "will not save without a unique name" do
  	@specialty.name = "Test Specialty"
  	@specialty.description = "Description of the test specialty."
  	@specialty.save
  	specialty2 = Specialty.new(:name => "Test Specialty", :description => "Test description 2.0");
  	expect(specialty2.save).to equal(false)
  end

  

end
