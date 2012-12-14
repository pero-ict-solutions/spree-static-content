module Spree::PagesHelper
  def render_snippet(slug)
    page = Spree::Page.find_by_slug(slug)
    raw page.body if page
  end
end