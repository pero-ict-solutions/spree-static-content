class ExtendPages < ActiveRecord::Migration
  class Page < ActiveRecord::Base
  end

  def self.up
    change_table :pages do |t|
      t.boolean :show_in_header, :default => false, :null => false
      t.boolean :show_in_footer, :default => false, :null => false
      t.string  :foreign_link
      t.integer :position, :default => 1, :null => false
      if Page.table_exists?
        Page.all(:order => "updated_at ASC").each_with_index{|page,x| page.update_attribute(:position, x+1)}
      else
        Spree::Page.all(:order => "updated_at ASC").each_with_index{|page,x| page.update_attribute(:position, x+1)}
      end

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
