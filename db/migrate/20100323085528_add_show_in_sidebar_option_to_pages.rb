class AddShowInSidebarOptionToPages < ActiveRecord::Migration
  def up
    add_column :pages, :show_in_sidebar, :boolean, default: false, null: false
  end

  def down
    remove_column :pages, :show_in_sidebar
  end
end