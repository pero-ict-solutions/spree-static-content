Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :pages
  end
  
  match '/*path', :to => 'static_content#show', :via => :get, :as => 'static'
end