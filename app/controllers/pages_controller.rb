class PagesController < ApplicationController
  def home
    @no_navbar  = true
    
  	if user_signed_in?

  		@current_challenge = current_user.current_challenge
  		@challenge = current_user.challenges.build

      @activities = Activity.order(created_at: :desc).paginate( page: params[:page], per_page: 15 )

      commentable = @activities.last

      puts "****** I'm here *********"
      comment = commentable.comments.create
      comment.title = "First comment."
      comment.comment = "This is the first comment."
      comment.save!
      puts "****** I'm there *********"
      puts "****** #{comment.reload.inspect} *********"

      @comments = commentable.comments.recent.limit(10).all
  	end
  end

  def faq
  end

  def contact
  end

    
end