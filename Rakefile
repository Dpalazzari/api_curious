# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'


namespace :vcr do
  task :delete_cassettes => :environment do
    cassettes = (Dir['spec/fixtures/vcr_cassettes/*.yml'].map { |d| File.expand_path(d) } )
    cassettes.each { |v| File.delete(v) }
  end
end
Rails.application.load_tasks
