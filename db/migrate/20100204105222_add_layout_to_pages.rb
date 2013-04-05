class AddLayoutToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :layout, :string
  end

  def self.down
    remove_column :pages, :layout
  end
end