class NewRepoController < ApplicationController

  def create
    # binding.pry
    # message = Faraday.post("https://api.github.com/user/repos?access_token=#{current_user.token}&name=hello")
    
    my_hash = JSON.generate({:name => "#{params[:new_repo]}"})

    conn = Faraday.new(:url => "https://api.github.com/user/repos?access_token=#{current_user.token}")

    conn.post do |req|
      req.body = my_hash
    end

    redirect_to find_repos_path
  end

end


# {
#   "name": "Hello-World",
#   "description": "This is your first repository",
#   "private": false
# }