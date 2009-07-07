# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class StaticContentExtension < Spree::Extension
  version "0.1"
  description "Static content extention for managing static content."
  url "http://github.com/PeterBerkenbosch/spree-static-content"

  # Please use static_content/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    
    Admin::ConfigurationsController.class_eval do
      before_filter :add_static_pages_links, :only => :index
      
      def add_static_pages_links
        @extension_links << {
          :link => admin_pages_path,
          :link_text => t('ext_static_content_static_pages'),
          :description => t('ext_static_content_static_pages_desc')
        }
      end
    end
    
    ContentController.class_eval do
      def show
        @page = Page.find_by_slug(params[:path])
        render :file => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404 unless @page 
      end
    end
  end
end