class Followed

  attr_reader :user, :avatar, :url

  def initialize(attributes={})
    @user   = attributes['login']
    @avatar = attributes['avatar_url']
    @url    = attributes['html_url']
  end

  def self.find_all(username)
    FollowedService.find_all(username).map do |fol|
      new(fol)
    end
  end

end