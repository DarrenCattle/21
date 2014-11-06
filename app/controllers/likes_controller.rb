class LikesController < ApplicationController
	before_action :authenticate_user!

  def create
  	@activity = Activity.find(params[:like][:activity_id])
  	current_user.like!(@activity)
  end

  # This doesn't quite work
  def destroy
  	@activity = Activity.find(params[:like][:activity_id])
  	current_user.unlike!(@activity)
  end
end
