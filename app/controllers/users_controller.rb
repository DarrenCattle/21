class UsersController < ApplicationController
	before_action :authenticate_user!

  def show
  	@user = User.friendly.find(params[:id])
  	@activities = Activity.order("created_at desc").where(owner_id: @user).paginate( page: params[:page], per_page: 25 )
  end

  def index
  	@users = User.all
  end
end
