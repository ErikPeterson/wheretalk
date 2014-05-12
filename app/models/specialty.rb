class Specialty < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true
	validates :description, :presence => true

	has_many :user_specialties
	has_many :users, :through => :user_specialties
end
