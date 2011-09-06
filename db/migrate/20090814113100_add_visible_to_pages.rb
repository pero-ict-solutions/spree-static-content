class AddVisibleToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :visible, :boolean
    Page.update_all :visible => true 
  end
 
  def self.down
    remove_column :pages, :visible
  end
end