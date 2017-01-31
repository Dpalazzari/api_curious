require 'rails_helper'

RSpec.describe 'Github authenticated user', type: :feature do
	context 'as a authenticated user' do
		it 'user views github repositories' do
			user = create(:user)

			page.set_rack_session(user_id: user.id)

			visit dashboard_index_path

			expect(page).to have_content("Hello, #{user.name}")
			expect(page).to have_link("Logout")
			expect(current_path).to eq(dashboard_index_path)
		end
	end
end