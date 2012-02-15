Deface::Override.new(:virtual_path => "spree/layouts/spree_application",
                     :name => "pages_in_sidebar",
                     :insert_bottom => "#sidebar",
                     :partial => "spree/static_content/static_content_sidebar")