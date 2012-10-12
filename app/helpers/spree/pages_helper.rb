module Spree::PagesHelper
  def render_snippet(slug)
    page = Spree::Page.by_slug(slug).first
    raw page.body if page
  end
end