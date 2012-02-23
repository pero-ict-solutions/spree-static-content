source 'http://rubygems.org'

gem 'spree'

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