Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :pages
  end
  constraints(Spree::StaticPage) do
    get '/(*path)', :to => 'static_content#show', :as => 'static'
  end
end
