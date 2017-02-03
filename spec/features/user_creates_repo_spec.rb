require 'rails_helper'

describe "User creates a new repo" do
  it 'creates the new repo' do
    VCR.use_cassette("creates_new_repo") do
      user = create(:user)

      page.set_rack_session(user_id: user.id)

      visit find_repos_path

      fill_in :new_repo, with: 'test_repo'

      click_on "Create Repo"

      expect(current_path).to eq(find_repos_path)
    end
  end
end