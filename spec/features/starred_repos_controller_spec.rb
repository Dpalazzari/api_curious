require 'rails_helper'

describe "StarredReposController", type: :feature do
  describe 'user finds their starred repos via controller' do
    it 'finds all starred repos' do
      VCR.use_cassette("starred_repos_controller_index") do
        user = create(:user)

        page.set_rack_session(user_id: user.id)

        visit dashboard_index_path

        click_on "Starred Repos"

        expect(current_path).to eq(starred_repos_path)
      end
    end
  end
end