class AddLayoutToPages < ActiveRecord::Migration
  def up
    add_column :pages, :layout, :string
  end

  def down
    remove_column :pages, :layout
  end
end