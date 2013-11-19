Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :pages
  end
  constraints(Spree::StaticPage) do
    match '/(*path)', :to => 'static_content#show', :via => :get, :as => 'static'
  end
end
