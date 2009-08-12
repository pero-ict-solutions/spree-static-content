= Static Content

Good, clean content management of pages for Spree.  You can use this to:

- Add and manage static pages such as an 'About' page.
- Show a static page instead of existing dynamic pages such as the home page,
  products pages, and taxon pages.
  
To override a dynamic page, use the path of that dynamic page as the slug when
you create your page in the Spree Administration area, including the
leading slash.  For example:

- to override the home page, use a path of '/' (without quotes).
- to override a product page, use its path, e.g. '/products/apache-baseball-jersey' (without quotes). 

The dynamic page can be made available again if you delete the static page or change its slug.

Create your own copy of the app/views/content/show.html.erb template in your site
extension to change the layout of the static pages.

INSTALLATION:
Suggest you load this extension before all other extensions as it 
specifies a filter in Spree::BaseController that may not get inherited by its
controller subclasses if other extensions modify these controller subclasses
first.  

To load this extension first, add this to your environment.rb inside the
"Spree::Initializer.run do |config|" block:

config.extensions = [:static_content, :all]

