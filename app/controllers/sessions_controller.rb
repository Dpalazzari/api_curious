class SessionsController < ApplicationController

	def create
		user 	 = Authentication.github_sign_in(params[:code])
		if user.save
			session[:user_id] = user.id
			redirect_to dashboard_index_path
		else
			redirect_to root_path
		end
	end

	def destroy
		reset_session

		redirect_to root_path
	end
	
end