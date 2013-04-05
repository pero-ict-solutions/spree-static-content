class AddDefaultTrueToVisibleForPage < ActiveRecord::Migration
  def up
    change_column :pages, :visible, :boolean, default: true
  end

  def down
  end
end
