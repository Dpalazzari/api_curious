require 'rails_helper'

describe "USer can view all their followers" do
  it 'shows all the followed users' do
    VCR.use_cassette("views_all_followed") do
      user = create(:user)

      page.set_rack_session(user_id: user.id)

      visit dashboard_index_path

      click_on 'Followed Github Users'

      expect(current_path).to eq('/followed')
      expect(page).to have_selector('.followed')

      within first('.followed') do
        expect(page).to have_content('Sh1pley')
        expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/12022194?v=3']")
        expect(page).to have_link("View Github Profile") #link to followed_users github account
      end
    end
  end
end