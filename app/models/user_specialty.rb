class UserSpecialty < ActiveRecord::Base
	belongs_to :user
	belongs_to :specialty

	validates :user_notes, :length => {:maximum => 140, :too_long => "Doctor's notes are restricted to 140 characters"}
	validates :user, :presence => true
	validates :specialty, :presence => true

end
