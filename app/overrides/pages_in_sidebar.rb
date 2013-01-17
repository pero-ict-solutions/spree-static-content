Deface::Override.new(:virtual_path => "spree/home/index",
                     :name => "pages_in_sidebar",
                     :insert_bottom => "[data-hook='homepage_sidebar_navigation']",
                     :partial => "spree/static_content/static_content_sidebar",
                     :disabled => false)
