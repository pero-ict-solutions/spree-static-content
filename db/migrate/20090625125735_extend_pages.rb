class ExtendPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.boolean :show_in_header, :default => false, :null => false
      t.boolean :show_in_footer, :default => false, :null => false
      t.string  :foreign_link
      t.integer :position, :default => 0, :null => false
    end
  end

  def self.down
    change_table :pages do |t|
      t.remove :show_in_header
      t.remove :show_in_footer
      t.remove :foreign_link
      t.remove :position
    end
  end
end
