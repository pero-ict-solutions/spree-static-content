class Spree::StaticContentController < Spree::BaseController

  helper "spree/products"
  layout :determine_layout

  def show
    path = case params[:path]
    when Array
      '/' + params[:path].join("/")
    when String
      '/' + params[:path]
    when nil
      request.path
    end

    unless @page = Spree::Page.visible.by_slug(path).first
      render_404
    end
  end

  private

  def determine_layout
    return @page.layout if @page and @page.layout.present? and not @page.render_layout_as_partial?
    Spree::Config.layout
  end

  def accurate_title
    @page ? (@page.meta_title.present? ? @page.meta_title : @page.title) : nil
  end

end
