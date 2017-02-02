require 'rails_helper'

describe "User can view all commits for a specific repo" do
  it 'returns all commits' do
    VCR.use_cassette("finds_all_commits") do
      user = create(:user)

      page.set_rack_session(user_id: user.id)

      visit find_repos_path

      fill_in :repository, with: 'rails_engine'

      click_on 'Find commits'

      expect(current_path).to eq('/commits')
      expect(page).to have_selector('.commit')

      within first('.commit') do
        expect(page).to have_content('Mike Schutte')
        expect(page).to have_content("Merge pull request #55 from tmikeschu/dp/customer-favorite-merchant Dp/customer favorite merchant")
        expect(page).to have_content('2017-01-26T16:00:11Z')
      end
    end
  end
end