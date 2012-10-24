source 'http://rubygems.org/'

# TODO remove when spree_core 1.3.0 is released.
gem 'spree_core', github: 'spree/spree'

unless ENV["CI"]
  if RUBY_VERSION < "1.9"
    gem "ruby-debug"
  else
    gem "ruby-debug19"
  end
end

gemspec
