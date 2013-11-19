class AddMetaTitleToPage < ActiveRecord::Migration
  def self.up
    add_column :spree_pages, :meta_title, :string
  end

  def self.down
    remove_column :spree_pages, :meta_title
  end
end
