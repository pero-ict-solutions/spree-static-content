class AddMetaTitleToPage < ActiveRecord::Migration
  def up
    add_column :pages, :meta_title, :string
  end

  def down
    remove_column :pages, :meta_title
  end
end
