class SessionsController < ApplicationController

	def create
		response 	 = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV["client_id"]}&client_secret=#{ENV["client_secret"]}&code=#{params[:code]}")
		token 		 = response.body.split(/\W+/)[1]
		user_data  = Faraday.get("https://api.github.com/user?access_token=#{token}")
		user_info  = JSON.parse(user_data.body)
		user 			 = User.from_omniauth(user_info)
		user.token = token
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