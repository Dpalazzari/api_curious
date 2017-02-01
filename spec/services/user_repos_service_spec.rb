require 'rails_helper'

describe UserReposService do
  context '.find_repos' do
    it 'returns all repos for signed in user' do
      VCR.use_cassette("user_repos_service.new") do
        raw_repos = UserReposService.find_repos("Dpalazzari")

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