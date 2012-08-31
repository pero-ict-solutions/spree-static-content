# Spree Static Content

[![Build Status](https://secure.travis-ci.org/spree/spree_static_content.png?branch=master)](http://travis-ci.org/spree/spree_static_content)

Good, clean content management of pages for Spree.  You can use this to:

- Add and manage static pages such as an 'About' page.
- Show a static page instead of existing dynamic pages such as the home page,
  products pages, and taxon pages.
  
## HowTo

Using the 'Pages' option in the admin tab, you can add static pages to your Spree install. The page content can
be pulled directly from the database, be a separate layout file or rendered as a partial.

In the admin tab, use the 'New page' option to create a new static page.

The title, slug, body, and meta fields will replace their respective page elements on load. The title, slug and 
body element are all required fields.

Body text provided without a layout / partial being specified will be loaded in the spree_application layout after
it is pulled from the database.

**Layout and Partial Rendering**

To render an entire page without the spree_application layout, specify a relative path to the layout file (eg. 
spree/layouts/layout_file_name). This file will not be prefixed with an underscore as it is a layout, not a partial.

To render a partial, specify the path in the layout file name and check the 'Render layout as partial' option. The
path specified in the layout area will not have an underscore, but it will be required in the filename.

**Options**

Use the 'Show in' checkboxes to specify whether to display the page links in the header, footer or sidebar. The 
position setting alters the order in which they appear.

Finally, toggle the visibility using the 'Visible' checkbox. If it is unchecked, the page will not be available.

## Basic Installation

**For Spree 1.1.x**

1. Add the following to your Gemfile
<pre>
  gem 'spree_static_content', :git => 'git://github.com/spree/spree_static_content.git', :branch => '1-1-stable'
</pre>
2. Run `bundle install`
3. To copy and apply migrations run: `rails g spree_static_content:install`

**For Spree 1.0.x**

1. Add the following to your Gemfile
<pre>
  gem 'spree_static_content', :git => 'git://github.com/spree/spree_static_content.git', :branch => '1-0-stable'
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
