require 'rails_helper'

describe StarredReposService do 
  context '.find_repos' do
    it 'returns all starred repos for a given user' do
      VCR.use_cassette("starred_repos_service.find_repos") do
        raw_repos = StarredReposService.find_repos('Dpalazzari')

        expect(raw_repos).to be_an(Array)
        expect(raw_repos.count).to eq(4)

        raw_repo = raw_repos.first
        expect(raw_repo).to be_a(Hash)
        expect(raw_repo).to have_key(:owner)
        expect(raw_repo).to have_key(:name)
        expect(raw_repo).to have_key(:html_url)
        expect(raw_repo).to have_key(:open_issues_count)
        expect(raw_repo).to have_key(:language)
        expect(raw_repo[:name]).to be_a(String)
      end
    end
  end
end