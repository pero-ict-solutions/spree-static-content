# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class StaticContentExtension < Spree::Extension
  version "0.1"
  description "Static content extension for managing static content."
  url "http://github.com/PeterBerkenbosch/spree-static-content"

  def activate
    
    # add Pages tab
    Admin::BaseController.class_eval do
      before_filter :add_static_pages_tab

      def add_static_pages_tab
        # @extension_tabs << [ :pages, {
         #                        :link => admin_pages_path,
         #                        :link_text => t('ext_static_content_static_pages'),
         #                        :description => t('ext_static_content_static_pages_desc')
         #                      } ]
          @extension_tabs <<  [ :pages ]
      end
    end
    
    # Admin::ConfigurationsController.class_eval do
    #   before_filter :add_static_pages_links, :only => :index
    #   
    #   def add_static_pages_links
    #     @extension_links << {
    #       :link => admin_pages_path,
    #       :link_text => t('ext_static_content_static_pages'),
    #       :description => t('ext_static_content_static_pages_desc')
    #     }
    #   end
    # end

    Spree::BaseController.class_eval do
      
      # ProductsHelper needed for seo_url method used when generating
      # taxonomies partial in content/show.html.erb.
      helper :products
      # Use before_filter instead of prepend_before_filter to ensure that 
      # ApplicationController filters that the view may require are run.
      before_filter :render_page_if_exists
      
      def render_page_if_exists
        # Using request.path allows us to override dynamic pages including
        # the home page, product and taxon pages. params[:path] is only good
        # for requests that get as far as content_controller. params[:path]
        # query left in for backwards compatibility for slugs that don't start
        # with a slash.
        @page = Page.visible.find_by_slug(params[:path]) if params[:path]
        @page = Page.visible.find_by_slug(request.path) unless @page
        render :template => 'content/show' if @page
      end
      
      # Returns page.title for use in the <title> element. 
      def title_with_page_title_check
        return @page.title if @page && !@page.title.blank?
        title_without_page_title_check
      end
      alias_method_chain :title, :page_title_check
    end
    
  end
end