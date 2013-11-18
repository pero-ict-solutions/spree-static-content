class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :spree_pages do |t|
      t.string :title
      t.text :body
      t.string :slug

      t.timestamps
    end
  end

  def self.down
    drop_table :spree_pages
  end
end
