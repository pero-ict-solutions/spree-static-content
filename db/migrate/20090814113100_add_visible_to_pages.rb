class AddVisibleToPages < ActiveRecord::Migration
  class Page < ActiveRecord::Base; end

  def up
    add_column :pages, :visible, :boolean
    if Page.table_exists?
      Page.update_all visible: true
    else
      Spree::Page.update_all visible: true
    end
  end

  def down
    remove_column :pages, :visible
  end
end
