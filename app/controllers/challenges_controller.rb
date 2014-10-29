class ChallengesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_challenge, only: [:show, :edit, :update, :destroy]

	# GET /challenges
	# GET /challenges.json
	def index
		@challenges = Challenge.all
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
			if @challenge.update(day: @challenge.day + 1, entered?: true) 
				@challenge.create_activity :update_days, owner: current_user, challenge_day: @challenge.day, 
													 					message: params[:message]
			end
		end												 
	end

	def reset_days
		@challenge = current_user.challenges.last
		if Rails.env.development? || !@challenge.entered? 
			if @challenge.update(day: 0, entered?: true)
				@challenge.create_activity :reset_days, owner: current_user, challenge_day: 0, challenge_day: @challenge.day, 
													 					message: params[:message]
			end
		end
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
			params.require(:challenge).permit(:name, :day, :reason, :user_id)
		end
end
