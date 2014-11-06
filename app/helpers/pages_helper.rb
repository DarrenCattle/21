module PagesHelper

	def likes_for(activity)
		Like.where(activity_id: activity.id).count
	end
end
