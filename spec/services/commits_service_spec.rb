require 'rails_helper'

describe CommitsService do
  context '.find_commits' do
    it 'returns all commits for a repo' do
      VCR.use_cassette("commits_service.find_commits") do
        raw_commits = CommitsService.find_commits('Dpalazzari', 'api_curious')

        expect(raw_commits).to be_an(Array)
        expect(raw_commits.count).to eq(30)

        raw_commit = raw_commits.first

        expect(raw_commit).to be_a(Hash)
        expect(raw_commit).to have_key('commit')
        expect(raw_commit['commit']).to have_key('author')
        expect(raw_commit['commit']).to have_key('message')
        expect(raw_commit['commit']['author']).to have_key('name')
        expect(raw_commit['commit']['author']).to have_key('date')
        expect(raw_commit['commit']).to be_a(Hash)
      end
    end
  end
end