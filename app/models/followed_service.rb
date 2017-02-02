class FollowedService

  def self.find_all(username)
    response = Faraday.get("https://api.github.com/users/#{username}/following??client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}")
    JSON.parse(response.body)
  end

end