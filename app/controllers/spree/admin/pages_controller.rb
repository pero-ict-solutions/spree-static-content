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
    expire_fragment "spree_static_content" + @object.slug
  end
end
