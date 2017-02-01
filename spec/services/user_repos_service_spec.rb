require 'rails_helper'

describe UserReposService do
  context '.new' do
    xit 'returns all repos for signed in user' do
      VCR.use_cassette("user_repos_service.new") do
        {:id=>80458660,
         :name=>"api_curious",
         :html_url=>"https://github.com/Dpalazzari/api_curious",
         :language=>"Ruby",
         :open_issues=>1}
      end
    end
  end
end