class AddMetaFieldsToPages < ActiveRecord::Migration
  def up
    add_column :pages, :meta_keywords, :string
    add_column :pages, :meta_description, :string
  end

  def down
  end
end
