class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user)
  end
end
