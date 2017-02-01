require 'rails_helper'

describe "FinderController", type: :feature do
  describe 'index' do
    it 'finds the user repos' do
      VCR.use_cassette("finders_controller_index") do
        user = create(:user)
        
        page.set_rack_session(user_id: user.id)

        visit dashboard_index_path
        
        click_on "Repositories"

        expect(current_path).to eq(find_repos_path)
      end
    end
  end
end