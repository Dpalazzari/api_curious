class FinderController < ApplicationController

	def index
		@repos = UserRepos.find_repos(current_user.login)
	end

end