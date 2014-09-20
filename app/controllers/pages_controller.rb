class PagesController < ApplicationController
  def home
  	if user_signed_in?
  		@current_challenge = current_user.current_challenge
  	end
  end

  def faq
  end

  def contact
  end
end
