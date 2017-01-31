require 'rails_helper'

RSpec.describe 'As a logged in user', type: :feature do
	it 'user sees welcome message' do
		user = create(:user)

		page.set_rack_session(user_id: user.id)

		visit dashboard_index_path

		expect(page).to have_content("Hello, #{user.name}")
		expect(current_path).to eq(dashboard_index_path)
	end
end