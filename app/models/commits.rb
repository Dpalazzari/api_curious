class Commits

  attr_reader :author, :message, :date

  def initialize(attributes={})
    @author = attributes['commit']['author']['name']
    @message = attributes['commit']['message']
    @date = attributes['commit']['author']['date']
  end

  def self.find_commits(username, repository)
    CommitsService.find_commits(username, repository).map do |commit|
      new(commit)
    end
  end

end