class LikesController < ApplicationController
	before_action :authenticate_user!

  def create
  	@activity = Activity.find(params[:id])
  	current_user.like!(@activity)
  end

  def destroy
  	@activity = Activity.find(params[:id])
  	current_user.unlike!(@activity)
  end
end
