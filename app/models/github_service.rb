class GithubService

	def self.find_repos(login)
		response = Faraday.get("https://api.github.com/users/#{login}/repos?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}")
		JSON.parse(response.body, symbolize_names: true)
	end

end