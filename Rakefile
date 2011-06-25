# encoding: utf-8
require 'rubygems'
begin
  require 'jeweler'
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
  exit 1
end
#gem 'rdoc', '= 2.2'
require 'rdoc'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/packagetask'
require 'rake/gempackagetask'

Jeweler::Tasks.new do |s|
  s.name = "spree_static_content"
  s.summary = "Extention to manage the static pages for your Spree shop."
  s.description = s.summary
  #s.email = ""
  s.homepage = "http://github.com/spree/spree-static-content"
  s.authors = ["Peter Berkenbosch", "Roman Smirnov"]
  s.add_dependency 'spree_core', '>= 0.60.0'
  s.add_dependency 'spree_editor', '>= 0.50.0'
  s.add_dependency 'formtastic', '~> 1.2.3'
  #s.has_rdoc = false
  #s.extra_rdoc_files = [ "README.rdoc"]
  #s.rdoc_options = ["--main", "README.rdoc", "--inline-source", "--line-numbers"]
  #s.test_files = Dir['test/**/*.{yml,rb}']
end
Jeweler::GemcutterTasks.new


require 'spec/rake/spectask'
# require 'spec/translator'

extension_root = File.expand_path(File.dirname(__FILE__))

task :default => :spec
task :stats => "spec:statsetup"

desc "Run all specs in spec directory"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts = ['--options', "\"#{extension_root}/spec/spec.opts\""]
  t.spec_files = FileList['spec/**/*_spec.rb']
end

namespace :spec do
  desc "Run all specs in spec directory with RCov"
  Spec::Rake::SpecTask.new(:rcov) do |t|
    t.spec_opts = ['--options', "\"#{extension_root}/spec/spec.opts\""]
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.rcov = true
    t.rcov_opts = ['--exclude', 'spec', '--rails']
  end
  
  desc "Print Specdoc for all specs"
  Spec::Rake::SpecTask.new(:doc) do |t|
    t.spec_opts = ["--format", "specdoc", "--dry-run"]
    t.spec_files = FileList['spec/**/*_spec.rb']
  end

  [:models, :controllers, :views, :helpers].each do |sub|
    desc "Run the specs under spec/#{sub}"
    Spec::Rake::SpecTask.new(sub) do |t|
      t.spec_opts = ['--options', "\"#{extension_root}/spec/spec.opts\""]
      t.spec_files = FileList["spec/#{sub}/**/*_spec.rb"]
    end
  end
  
  # Hopefully no one has written their extensions in pre-0.9 style
  # desc "Translate specs from pre-0.9 to 0.9 style"
  # task :translate do
  #   translator = ::Spec::Translator.new
  #   dir = RAILS_ROOT + '/spec'
  #   translator.translate(dir, dir)
  # end

  # Setup specs for stats
  task :statsetup do
    require 'code_statistics'
    ::STATS_DIRECTORIES << %w(Model\ specs spec/models)
    ::STATS_DIRECTORIES << %w(View\ specs spec/views)
    ::STATS_DIRECTORIES << %w(Controller\ specs spec/controllers)
    ::STATS_DIRECTORIES << %w(Helper\ specs spec/views)
    ::CodeStatistics::TEST_TYPES << "Model specs"
    ::CodeStatistics::TEST_TYPES << "View specs"
    ::CodeStatistics::TEST_TYPES << "Controller specs"
    ::CodeStatistics::TEST_TYPES << "Helper specs"
    ::STATS_DIRECTORIES.delete_if {|a| a[0] =~ /test/}
  end
end

desc 'Generate documentation for the static_content extension.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'StaticContentExtension'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# For extensions that are in transition
desc 'Test the static_content extension.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

# Load any custom rakefiles for extension
Dir[File.dirname(__FILE__) + '/tasks/*.rake'].sort.each { |f| require f }
