source 'http://rubygems.org'

gem 'spree', :git => "git://github.com/spree/spree.git"

group :test do
  gem 'ffaker'
end

unless ENV["CI"]
  if RUBY_VERSION < "1.9"
    gem "ruby-debug"
  else
    gem "ruby-debug19"
  end
end

gemspec