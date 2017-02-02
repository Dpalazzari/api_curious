class FollowedController < ApplicationController

  def index
    username = current_user.login
    @followed = Followed.find_all(username)
  end

end