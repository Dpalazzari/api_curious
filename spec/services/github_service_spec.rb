require 'rails_helper'

describe GithubService do
  context '.find_repos' do
    it 'returns all repos for a given user' do
      VCR.use_cassette("github_service.find_repos") do
        raw_repos = GithubService.find_repos("Dpalazzari")

        binding.pry
        expect(raw_repos).to be_an(Array)
        expect(raw_repos.count).to eq(22)
      end
    end
  end
end