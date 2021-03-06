require 'rails_helper'

RSpec.describe 'Github authenticated user', type: :feature do
	context 'as a authenticated user' do
		it 'user views github repositories' do
			user = create(:user)

			page.set_rack_session(user_id: user.id)

			visit dashboard_index_path

			expect(page).to have_content(user.name)
			expect(page).to have_link("Logout")
			expect(current_path).to eq(dashboard_index_path)

			click_on "Repositories"

			within first('.repo') do
				expect(page).to have_content('api_curious')
				expect(page).to have_content('HTML')
			end
		end
	end
end