require 'rails_helper'

describe Authentication do
  context '.github_sign_in' do
    it 'authenticates a user' do
      VCR.use_cassette("authentication.github_sign_in") do
        user = Authentication.github_sign_in("6bfb13b942de0a310896")

        expect(user).to be_a(User)
      end
    end
  end
end