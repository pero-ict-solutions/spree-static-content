Deface::Override.new(:virtual_path => "spree/layouts/spree_application",
                     :name => "pages_in_header",
                     :insert_bottom => "#main-nav-bar",
                     :partial => "spree/static_content/static_content_header")