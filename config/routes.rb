module StaticPage
  def self.remove_spree_mount_point(path)
    regex = Regexp.new '\A' + Rails.application.routes.url_helpers.spree_path
    path.sub( regex, '').split('?')[0]
  end
end

class Spree::StaticPage
  def self.matches?(request)
    slug = StaticPage::remove_spree_mount_point(request.fullpath)
    pages = Spree::Page.arel_table
    Spree::Page.visible.by_slug(slug).exists?
  end
end

class Spree::StaticRoot
  def self.matches?(request)
    path = StaticPage::remove_spree_mount_point(request.fullpath)
    path.nil? && Spree::Page.visible.by_slug(path.to_s).first
  end
end

Spree::Core::Engine.add_routes do

  namespace :admin do
    resources :pages
  end

  constraints(Spree::StaticRoot) do
    get '/', :to => 'static_content#show'
  end

  constraints(Spree::StaticPage) do
    get '/*path', :to => 'static_content#show'
  end
end
