class SearchController < ApplicationController

	def index
    @repos = GithubRepo.find_repos(params[:q])
	end

end