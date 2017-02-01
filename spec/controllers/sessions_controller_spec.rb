require 'rails_helper'

describe SessionsController do
  describe 'create' do
    it 'creates a user' do
      post :create

      expect(User.count).to eq(1)
    end

    it 'creates a session' do
      expect(session[:user_id]).to be_nil
      post :create
      expect(session[:user_id]).to_not be_nil
    end
  end
end