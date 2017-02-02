require 'rails_helper'

describe "User can view all commits for a specific repo" do
  it 'returns all commits' do
    VCR.use_cassette("finds_all_commits") do
      user = create(:user)

      page.set_rack_session

      visit find_repos_path

      fill_in :commits, with: 'api_curious'

      expect(current_path).to eq('/commits')
      expect(page).to have_selector('.commit')

      within first('.commit') do
        expect(page).to have_content('Drew Palazzari')
        expect(page).to have_content('Merge pull request #2 from Dpalazzari/api-starred-repos')
        expect(page).to have_content('2017-02-02T17:00:05Z')
      end
    end
  end
end