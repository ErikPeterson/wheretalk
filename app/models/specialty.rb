class Specialty < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true
	validates :description, :presence => true
end
