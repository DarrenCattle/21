class PagesController < ApplicationController
  def home
    @no_navbar  = true
    
  	if user_signed_in?

  		@current_challenge = current_user.current_challenge
  		@challenge = current_user.challenges.build

      @activities = PublicActivity::Activity.order(created_at: :desc).paginate( page: params[:page], per_page: 25 )

  	end
  end

  def faq
  end

  def contact
  end

    
end
