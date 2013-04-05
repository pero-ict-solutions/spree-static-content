require 'bundler'

Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/testing_support/common_rake'

RSpec::Core::RakeTask.new

task default: [:spec]

namespace :test_app do
  desc 'Rebuild test database'
  task :rebuild_db do
    system('cd spec/test_app && rake db:drop db:migrate RAILS_ENV=test')
  end
end

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_static_content'
  Rake::Task['common:test_app'].invoke
end
