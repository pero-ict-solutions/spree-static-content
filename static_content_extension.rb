# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class StaticContentExtension < Spree::Extension
  version "0.1"
  description "Static content extension for managing static content."
  url "http://github.com/PeterBerkenbosch/spree-static-content"

  def activate

    Spree::BaseController.class_eval do
      # ProductsHelper needed for seo_url method used when generating
      # taxonomies partial in content/show.html.erb.
      helper :products
      # Use before_filter instead of prepend_before_filter to ensure that
      # ApplicationController filters that the view may require are run.
      before_filter :render_page_if_exists

      # Checks if page is not beeing overriden by static one that starts with /
      #
      # Using request.path allows us to override dynamic pages including
      # the home page, product and taxon pages.
      def render_page_if_exists
        # If we don't know if page exists we assume it's and we query DB.
        # But we realy don't want to query DB on each page we're sure doesn't exist!
        return if Rails.cache.fetch('page_not_exist/'+request.path)

        if @page = Page.visible.find_by_slug(request.path)
          if @page.layout && !@page.layout.empty?
            render :template => 'static_content/show', :layout => @page.layout
          else
            render :template => 'static_content/show'
          end
        else
          Rails.cache.write('page_not_exist/'+request.path, true)
          return(nil)
        end
      end

      # Returns page.title for use in the <title> element.
      def title_with_page_title_check
        return @page.title if @page && !@page.title.blank?
        title_without_page_title_check
      end
      alias_method_chain :title, :page_title_check
    end

    if not defined?(Spree::ThemeSupport)
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
    end
  end
end