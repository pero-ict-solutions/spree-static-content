Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree-homepager'
  s.version     = '0.70.99'
  s.summary     = 'Extention to manage the static pages for your Spree shop.'
  s.required_ruby_version = '>= 1.8.7'

  s.authors           = [%q{Peter Berkenbosch}, %q{Roman Smirnov}]
  s.email             = 'peter@pero-ict.nl'
  s.homepage          = 'http://spreecommerce.com/extensions/139-static-content'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '>= 0.70.1')
  s.add_dependency('formtastic')
  s.add_development_dependency 'rspec-rails'
end

