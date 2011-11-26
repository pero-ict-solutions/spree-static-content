# Spree Static Content

Good, clean content management of pages for Spree.  You can use this to:

- Add and manage static pages such as an 'About' page.
- Show a static page instead of existing dynamic pages such as the home page,
  products pages, and taxon pages.
  
## HowTo

See the wiki for some more documentation on how you can use this extension.

- use spree_editor.
- override dynamic pages.
- ...

## Basic Installation

1. Add the following to your Gemfile
<pre>
  gem 'spree_static_content', :git => 'http://github.com/spree/spree_static_content'
</pre>
2. Run `bundle install`
3. To copy and apply migrations run: `rails g spree_static_content:install`

## Development

1. fork the repo here: https://github.com/spree/spree_static_content
2. inside your fork run `bundle install`
3. make sure the tests can run on your system run : `bundle exec rake test_app && bundle exec rspec spec`

You can also run `bundle exec rake test_app` and then to run the specs run `bundle exec rake`

### Fix bugs or add functionality

1. create a feature branch
<pre>
  git checkout -b my-feature-branch
</pre>
2. Apply your changes and add specs.
3. Push the feature branch to your fork:
<pre>
  git push -u origin my-feature-branch
</pre>
4. Send a pull request from your feature branch in the forked repository on github.