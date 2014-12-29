class AddDefaultTrueToVisibleForPage < ActiveRecord::Migration
  def self.up
    change_column :spree_pages, :visible, :boolean, default: true
  end

  def self.down
  end
end
