class Spree::StaticPage
  def self.matches?(request)
    return false if request.path =~ /(^\/+(admin|account|cart|checkout|content|login|pg\/|orders|products|s\/|session|signup|shipments|states|t\/|tax_categories|user)+)/
    !Spree::Page.visible.find_by_slug(request.path).nil?
  end
end

Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :pages
  end

  constraints(Spree::StaticPage) do
    match '/(*path)', :to => 'static_content#show', :via => :get, :as => 'static'
  end
end
