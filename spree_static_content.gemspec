version = File.read(File.expand_path("../VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_static_content'
  s.version     = version
  s.summary     = 'Extention to manage the static pages for your Spree shop.'
  s.required_ruby_version = '>= 1.9.3'

  s.authors            = [%q{Peter Berkenbosch}, %q{Roman Smirnov}]
  s.email             = 'peter@pero-ict.nl'
  s.homepage          = 'http://spreecommerce.com/extensions/139-static-content'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.1.0'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.7'
  s.add_development_dependency 'sqlite3'
end
