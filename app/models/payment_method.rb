class PaymentMethod < ActiveRecord::Base
	validates_uniqueness_of :name
	has_many :accepted_payments
	has_many :users, :through => :accepted_payments
end
