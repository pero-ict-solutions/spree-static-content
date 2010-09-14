class AddIndexForPage < ActiveRecord::Migration
  def self.up
    add_index(:pages, :slug)
  end

  def self.down
    remove_index(:pages, :slug)
  end
end

