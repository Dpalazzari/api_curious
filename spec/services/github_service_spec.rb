require 'rails_helper'

describe GithubService do
  context '.find_repos' do
    it 'returns all repos for a given user' do
      VCR.use_cassette("github_service.find_repos") do
        raw_repos = GithubService.find_repos("Dpalazzari")

        expect(raw_repos).to be_an(Array)
        expect(raw_repos.count).to eq(22)

        raw_repo = raw_repos.first

        expect(raw_repo).to be_a(Hash)
        expect(raw_repo).to have_key(:name)
        expect(raw_repo).to have_key(:html_url)
        expect(raw_repo).to have_key(:open_issues_count)
        expect(raw_repo).to have_key(:language)
        expect(raw_repo[:name]).to be_a(String)
      end
    end
  end
end