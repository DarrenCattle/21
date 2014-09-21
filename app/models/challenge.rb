class Challenge < ActiveRecord::Base

	def self.reset_entered
		@challenges = self.all

		@challenges.each do |challenge|
			challenge.update_attribute(:entered?, false)
		end
	end
end
