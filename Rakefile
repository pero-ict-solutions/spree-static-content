require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rspec/core/rake_task'
require 'spree/testing_support/common_rake'

Bundler::GemHelper.install_tasks
RSpec::Core::RakeTask.new

desc "Default Task"
task :default => [ :spec ]

desc "Generates a dummy app for testing"
task :test_app do
  ENV['LIB_NAME'] = 'spree_static_content'
  Rake::Task['common:test_app'].invoke
end
