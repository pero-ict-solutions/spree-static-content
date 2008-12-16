class Admin::PagesController < ApplicationController
  resource_controller
  layout 'admin'
  require_role :admin
  
  update.response do |wants|
    wants.html { redirect_to collection_url }
  end
  
  update.after do
    Rails.cache.delete('pages')
  end
  
  create.response do |wants|
    wants.html { redirect_to collection_url }
  end
  
  create.after do
    Rails.cache.delete('pages')
  end
  
end
