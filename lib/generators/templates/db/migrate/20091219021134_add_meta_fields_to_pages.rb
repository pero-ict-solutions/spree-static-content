class AddMetaFieldsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :meta_keywords, :string
    add_column :pages, :meta_description, :string
  end

  def self.down
  end
end
