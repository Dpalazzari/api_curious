class NewRepoController < ApplicationController

  def create    
    my_hash = JSON.generate({:name => "#{params[:new_repo]}"})
    conn = Faraday.new(:url => "https://api.github.com/user/repos?access_token=#{current_user.token}")
    conn.post do |req|
      req.body = my_hash
    end
    redirect_to find_repos_path
  end

end
