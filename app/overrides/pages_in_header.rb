Deface::Override.new(
  virtual_path: 'spree/shared/_main_nav_bar',
  name: 'pages_in_header',
  insert_bottom: '#main-nav-bar > ul:first-child',
  partial: 'spree/static_content/static_content_header'
)
