require 'rails_helper'

describe "User can view all their followers" do
  it 'shows all the followed users' do
    VCR.use_cassette("views_all_followed") do
      user = create(:user)

      page.set_rack_session(user_id: user.id)

      visit dashboard_index_path

      click_on 'Followed Github Users'

      expect(current_path).to eq('/followed')
      expect(page).to have_selector('.followed')

      within first('.followed') do
        expect(page).to have_content('case-eee')
        expect(page).to have_link("View Github Profile")
      end
    end
  end
end