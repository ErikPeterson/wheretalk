require 'spec_helper'

describe PaymentMethod do
  it "has a unique name" do
  	payment1 = PaymentMethod.create(:name=>"Out of Pocket")
  	payment2 = PaymentMethod.new(:name=>"Out of Pocket")
  	expect(payment2.save).to eq(false)
  end
end
