Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'pages_admin_sidebar_menu',
  insert_bottom: '.sidebar-menu',
  partial: 'spree/admin/shared/pages_sidebar_menu',
  disabled: false
)
