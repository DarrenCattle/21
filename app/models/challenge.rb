class Challenge < ActiveRecord::Base
	include PublicActivity::Common
	# tracked except: :update, owner: ->(controller, model) { controller and controller.current_user }

	def self.reset_entered
		@challenges = self.all

		@challenges.each do |challenge|
			challenge.update_attribute(:entered?, false)
		end
	end
end
