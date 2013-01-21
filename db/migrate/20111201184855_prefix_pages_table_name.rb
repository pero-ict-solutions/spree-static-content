class PrefixPagesTableName < ActiveRecord::Migration
  def change
    if table_exists?(:pages)
      rename_table :pages, :spree_pages
    end
  end
end
