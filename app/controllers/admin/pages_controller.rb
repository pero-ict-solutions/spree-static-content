class Admin::PagesController < Admin::BaseController
  resource_controller
  
  update.response do |wants|
    wants.html { redirect_to collection_url }
  end
  
  update.after do
    expire_page :controller => 'static_content', :action => 'show', :path => @page.slug
    Rails.cache.delete('pag_not_exist/'+@page.slug)
  end
  
  create.response do |wants|
    wants.html { redirect_to collection_url }
  end

  create.after do
    Rails.cache.delete('pag_not_exist/'+@page.slug)
  end

end
