Deface::Override.new(:virtual_path => "spree/layouts/spree_application",
                     :name => "pages_in_footer",
                     :insert_bottom => "#footer-right",
                     :partial => "spree/static_content/static_content_footer")