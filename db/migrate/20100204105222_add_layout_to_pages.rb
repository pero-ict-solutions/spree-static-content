class AddLayoutToPages < ActiveRecord::Migration
  def self.up
    add_column :spree_pages, :layout, :string
  end

  def self.down
    remove_column :spree_pages, :layout
  end
end
