class PrefixTableNames < ActiveRecord::Migration
  def change
    rename_table :pages, :spree_pages
  end
end
