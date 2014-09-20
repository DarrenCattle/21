class Challenge < ActiveRecord::Base

	before_create :set_days_to_zero

	def set_days_to_zero
		days = 0
	end
end
