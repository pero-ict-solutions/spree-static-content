class AddIndexForPage < ActiveRecord::Migration
  def up
    add_index :pages, :slug
  end

  def down
    remove_index :pages, :slug
  end
end
