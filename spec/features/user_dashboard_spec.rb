require 'rails_helper'

RSpec.describe 'Login path', type: :feature do
	context 'as a logged in user' do
		it 'user sees welcome message' do
			user = create(:user)

			page.set_rack_session(user_id: user.id)

			visit dashboard_index_path

			expect(page).to have_content("Hello, #{user.name}")
			expect(page).to have_link("Logout")
			expect(current_path).to eq(dashboard_index_path)
		end

		it 'user decides to logout' do
			user = create(:user)

			page.set_rack_session(user_id: user.id)

			visit dashboard_index_path

			click_on 'Logout'

			expect(page).to_not have_content(user.name)
			expect(page).to have_link("Login thru Github")
			expect(current_path).to eq(root_path)
		end
	end

	context 'as a visitor' do
		it 'visitor sees the login button' do
			visit root_path

			expect(page).to have_content("Login thru Github")
		end
	end
end