class FreeBlock < ActiveRecord::Base
	belongs_to :schedule

def day_name
	case day_number
	when 1
		"Monday"
	when 2
		"Tuesday"
	when 3
		"Tuesday"
	when 4
		"Tuesday"
	when 5
		"Tuesday"
	when 6
		"Tuesday"
	when 7 
		"Tuesday"
	end
end

end
