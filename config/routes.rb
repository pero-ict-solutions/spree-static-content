class Spree::StaticPage
  def self.matches?(request)
    path = request.fullpath
    count = Spree::Page.visible.where(:slug => path.gsub("//","/")).count
    0 < count
  end
end

class Spree::StaticRoot
  def self.matches?(request)
    path = request.fullpath.gsub("//","/")
    (path == '/') && Spree::Page.visible.find_by_slug(path)
  end
end

Spree::Core::Engine.routes.prepend do

  namespace :admin do
    resources :pages
  end
  
  constraints(Spree::StaticRoot) do
    match '/', :to => 'static_content#show', :via => :get, :as => 'static'
  end
  
  constraints(Spree::StaticPage) do
    match '/*path', :to => 'static_content#show', :via => :get, :as => 'static'
  end
end
