class AddMetaTitleToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :meta_title, :string
  end

  def self.down
    remove_column :pages, :meta_title, :string
  end
end
