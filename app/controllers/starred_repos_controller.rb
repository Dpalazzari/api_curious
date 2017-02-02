class StarredReposController < ApplicationController

  def index
    @starred_repos = StarredRepos.find_repos(current_user.login)
  end

end