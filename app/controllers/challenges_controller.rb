class ChallengesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_challenge, only: [:show, :edit, :update, :destroy]
	before_action :verify_access_to_challenge, only: [:edit, :destroy]

	# GET /challenges
	# GET /challenges.json
	def index
		@challenges = current_user.challenges
	end

	# GET /challenges/1
	# GET /challenges/1.json
	def show
	end

	# GET /challenges/new
	def new
		@challenge = current_user.challenges.build
	end

	# GET /challenges/1/edit
	def edit
	end

	# POST /challenges
	# POST /challenges.json
	def create
		@challenge = current_user.challenges.build(challenge_params)

		respond_to do |format|
			if @challenge.save
				@challenge.create_activity :create, owner: current_user, challenge_day: 0
				format.html { redirect_to root_path }
			else
				format.html { render :new }
			end
		end
	end

	# PATCH/PUT /challenges/1
	# PATCH/PUT /challenges/1.json
	def update
		respond_to do |format|
			if @challenge.update(challenge_params)
				# @challenge.create_activity :update, owner: current_user, challenge_day: @challenge.day

				format.html { redirect_to root_path }
			else
				format.html { render :edit }
			end
		end
	end

	def update_days
		@challenge = current_user.challenges.last	
		if Rails.env.development? || !@challenge.entered? 
			if @challenge.update(day: @challenge.day + 1, entered: true)
				if @challenge.day == 21
					@challenge.create_activity :reached_day_21, owner: current_user, challenge_day: @challenge.day, message: params[:message]
				else
					@challenge.create_activity :update_days, owner: current_user, challenge_day: @challenge.day, message: params[:message]
				end
			end
		end												 
	end

	def reset_days
		@challenge = current_user.challenges.last
		if Rails.env.development? || !@challenge.entered? 
			if @challenge.update(day: 0, entered: true)
				@challenge.create_activity :reset_days, owner: current_user, challenge_day: @challenge.day, message: params[:message]
			end
		end
	end

	def reset_entered
		@challenge = current_user.challenges.last
		@challenge.update_attribute(:entered, false)
		# TODO(Max): Undo changing day count
		redirect_to root_path
	end

	# DELETE /challenges/1
	# DELETE /challenges/1.json
	def destroy
		if @challenge.destroy
			@challenge.create_activity :destroy, owner: current_user, challenge_day: @challenge.day, message: params[:message]
			respond_to do |format|
				format.html { redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' }
			end
		else
			respond_to do |format|
				format.html { redirect_to challenges_url, error: 'A problem occurred. Please try again.' }
			end
		end

	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_challenge
			@challenge = Challenge.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def challenge_params
			params.require(:challenge).permit(:name, :day, :reason, :user_id, :entered)
		end

		def verify_access_to_challenge
			if current_user.id != @challenge.user_id
		      flash[:alert] = "You don't have access to edit that challenge."
		      redirect_to root_path
		      return
	    	end
		end
end
