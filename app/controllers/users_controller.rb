class UsersController < ApplicationController
	before_filter :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: @user)
  end
end
