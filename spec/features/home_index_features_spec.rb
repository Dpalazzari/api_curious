require 'rails_helper'

RSpec.describe 'Home index page', type: :feature do
  let!(:user) { create(:user) }

  it 'gives user option to log in' do
    visit root_path

    expect(current_path).to eq('/')
    expect(page).to have_link("Login thru Github")
  end
end