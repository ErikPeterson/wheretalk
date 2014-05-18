class Schedule < ActiveRecord::Base
	belongs_to :user
	has_many :free_blocks

	validate :user
end
