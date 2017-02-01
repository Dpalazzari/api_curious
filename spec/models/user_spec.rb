require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @info = {"login"=>"Dpalazzari",
              "id"=>"19585280",
              "avatar_url"=>"https://avatars.githubusercontent.com/u/19585280?v=3",
              "name"=>"Drew Palazzari",
              "location"=>"Denver, Colorado",
              "public_repos"=>22,
              "public_gists"=>3,
              "private_gists"=>3}
    @token = "hhg358sm0092jmjkchn"
  end

  it 'can be registered with uid' do
    result = User.from_omniauth(@info, @token)

    expect(result.uid).to be_an(String)
    expect(result.uid).to eq(@info['id'])
  end

  it 'can be registered with name' do
    result = User.from_omniauth(@info, @token)

    expect(result.name).to be_an(String)
    expect(result.name).to eq(@info['name'])
  end

  it 'can be registered with login' do
    result = User.from_omniauth(@info, @token)

    expect(result.login).to be_an(String)
    expect(result.login).to eq(@info['login'])
  end

  it 'can be registered with location' do
    result = User.from_omniauth(@info, @token)

    expect(result.location).to be_an(String)
    expect(result.location).to eq(@info['location'])
  end

  it 'can be registered with token' do
    result = User.from_omniauth(@info, @token)

    expect(result.token).to be_an(String)
    expect(result.token).to eq(@token)
  end

  it 'can be registered with avatar' do
    result = User.from_omniauth(@info, @token)

    expect(result.avatar).to be_an(String)
    expect(result.avatar).to eq(@info['avatar_url'])
  end

  it 'can be registered with public repos' do
    result = User.from_omniauth(@info, @token)

    expect(result.public_repos).to be_an(Integer)
    expect(result.public_repos).to eq(@info['public_repos'])
  end

  it 'can be registered with public gists' do
    result = User.from_omniauth(@info, @token)

    expect(result.public_gists).to be_an(Integer)
    expect(result.public_gists).to eq(@info['public_gists'])
  end

  it 'can be registered with private gists' do
    result = User.from_omniauth(@info, @token)

    expect(result.private_gists).to be_an(Integer)
    expect(result.private_gists).to eq(@info['private_gists'])
  end
end
