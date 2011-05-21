class Admin::PagesController < Admin::ResourceController
  update.after :expire_cache
  
  private
  def expire_cache
    expire_page :controller => '/static_content', :action => 'show', :path => @page.slug
  end
end
