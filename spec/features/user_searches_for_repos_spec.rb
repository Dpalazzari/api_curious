require 'rails_helper'

describe "User can view all their repos" do
	it "valid repos" do

		visit root_path

		fill_in :q, with: 'Dpalazzari'

		click_on "Find Repos"

		expect(current_path).to eq('/search')

		expect(page).to have_selector('.repo')

		within first('.repo') do
			expect(page).to have_content('api_curious')
			expect(page).to have_content('https://github.com/Dpalazzari/api_curious')
			expect(page).to have_content(1) #open issues
			expect(page).to have_content('Ruby')
		end
	end
end