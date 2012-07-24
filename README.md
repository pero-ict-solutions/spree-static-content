# Spree Static Content

[![Build Status](https://secure.travis-ci.org/spree/spree_static_content.png?branch=master)](http://travis-ci.org/spree/spree_static_content)

Good, clean content management of pages for Spree.  You can use this to:

- Add and manage static pages such as an 'About' page.
- Show a static page instead of existing dynamic pages such as the home page,
  products pages, and taxon pages.
  
## HowTo

The title, slug, body, and meta fields are fairly self-explanatory. They will replace their respective page 
elements on load.

A title, slug and body element are all required.

If you would like to render an entire page without the spree_application layout, specify a relative path to the
layout file (eg. spree/layouts/layout_file_name). If you do not want this layout file to render without the full
spree application layout, check the render layout as partial option. Remember to prefix your layout file with an
underscore.

Use the show in checkboxes to specify where the page links will be shown. Use the position setting to change the
order in which they appear.

Finally, you can toggle the visibility using the visible checkbox.

## Basic Installation

**For Spree 1.0.x**

1. Add the following to your Gemfile
<pre>
  gem 'spree_static_content', :git => 'git@github.com:spree/spree_static_content.git', :branch => '1-0-stable'
</pre>
2. Run `bundle install`
3. To copy and apply migrations run: `rails g spree_static_content:install`

**For Spree 1.1.x**

1. Add the following to your Gemfile
<pre>
  gem 'spree_static_content', :git => 'git@github.com:spree/spree_static_content.git', :branch => 'master'
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
