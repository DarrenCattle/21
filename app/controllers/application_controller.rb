class ApplicationController < ActionController::Base
	include PublicActivity::StoreController

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	# to add custom fields to devise
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
		def configure_permitted_parameters
		  devise_parameter_sanitizer.for(:sign_up) << [:name, :username, :avatar]
		  devise_parameter_sanitizer.for(:account_update) << [:name, :unsuscribe_from_reminder_email, :europe, :username, :avatar]
		end
	
	# end to add custom fields to devise

end
