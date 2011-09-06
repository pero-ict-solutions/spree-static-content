class AddShowInSidebarOptionToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :show_in_sidebar, :boolean, :default=> false, :null=>false
  end

  def self.down
    remove_column :pages, :show_in_sidebar
  end
end