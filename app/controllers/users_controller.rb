class UsersController < ApplicationController
	before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@activities = Activity.order("created_at desc").where(owner_id: @user).paginate( page: params[:page], per_page: 25 )
  end
end
