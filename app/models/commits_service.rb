class CommitsService

  def self.find_commits(username, repository)
    response = Faraday.get("https://api.github.com/repos/#{username}/#{repository}/commits?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}")
    JSON.parse(response.body)
  end

end