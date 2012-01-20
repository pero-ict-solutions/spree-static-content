class Spree::Admin::PagesController < Spree::Admin::ResourceController
  update.after :expire_cache

  def new
    @page = @object
  end

  def edit
    @page = @object
  end

  private
  def expire_cache
    expire_page :controller => '/spree/static_content', :action => 'show', :path => @object.slug
  end
end
