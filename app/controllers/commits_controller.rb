class CommitsController < ApplicationController

  def index
    @commits = Commits.find_commits(current_user.login, params[:repository])
  end

end