class PagesController < ApplicationController
  def home
  	if user_signed_in?
  		@current_challenge = current_user.current_challenge
  		@challenge = current_user.challenges.build
      @posts = Challenge.all
  	end
  end

  def faq
  end

  def contact
  end
end
