Spree::Core::Engine.routes.append do

  namespace :admin do
    resources :pages
  end
  
  match '/static/*path', :to => 'static_content#show', :via => :get, :as => 'static'
  match '/*path', :to => 'static_content#show', :via => :get, :as => 'static'
end
