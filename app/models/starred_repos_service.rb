class StarredReposService

  def self.find_repos(user)
    response = Faraday.get("https://api.github.com/users/#{user}/starred?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}")  
    JSON.parse(response.body, symbolize_names: true)
  end

end