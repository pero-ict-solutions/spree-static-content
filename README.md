# Spree Static Content

[![Build Status](https://api.travis-ci.org/spree/spree_static_content.png?branch=master)](https://travis-ci.org/spree/spree_static_content)
[![Code Climate](https://codeclimate.com/github/spree/spree_static_content.png)](https://codeclimate.com/github/spree/spree_static_content)

Good, clean content management of pages for Spree. You can use this to:

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
`spree/layouts/layout_file_name`). This file will not be prefixed with an underscore as it is a layout, not a partial.

To render a partial, specify the path in the layout file name and check the 'Render layout as partial' option. The
path specified in the layout area will not have an underscore, but it will be required in the filename.

Also note the availability of the render_snippet helper which finds a page by its slug and renders the raw page
body anywhere in your view.

**Options**

Use the 'Show in' checkboxes to specify whether to display the page links in the header, footer or sidebar. The
position setting alters the order in which they appear.

Finally, toggle the visibility using the 'Visible' checkbox. If it is unchecked, the page will not be available.

## Basic Installation

Add to your `Gemfile`:

```ruby
gem 'spree_static_content', github: 'spree/spree_static_content', branch: 'master'
```

Run:

    bundle install
    rails g spree_static_content:install

That's all!

**NOTE: Check [Versionfile][1] for corresponding gem `branch` for your Spree version.**

## Contributing

In the spirit of [free software][2], **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using prerelease versions
* by reporting [bugs][3]
* by suggesting new features
* by writing translations
* by writing or editing documentation
* by writing specifications
* by writing code (*no patch is too small*: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by resolving [issues][3]
* by reviewing patches

Starting point:

* Fork the repo
* Clone your repo
* Run `bundle install`
* Run `bundle exec rake test_app` to create the test application in `spec/test_app`
* Make your changes
* Ensure specs pass by running `bundle exec rspec spec`
* Submit your pull request

Copyright (c) 2014 [Peter Berkenbosch][4] and [contributors][5], released under the [New BSD License][6]

[1]: https://github.com/spree/spree_static_content/blob/master/Versionfile
[2]: http://www.fsf.org/licensing/essays/free-sw.html
[3]: https://github.com/spree/spree_static_content/issues
[4]: https://github.com/peterberkenbosch
[5]: https://github.com/spree/spree_static_content/graphs/contributors
[6]: https://github.com/spree/spree_static_content/blob/master/LICENSE.md
