class AddRenderAsPartialForLayoutForSpreePages < ActiveRecord::Migration
  def up
    unless column_exists? :spree_pages, :render_layout_as_partial
      add_column :spree_pages, :render_layout_as_partial, :boolean, default: false
    end
  end

  def down
    if column_exists? :spree_pages, :render_layout_as_partial
      remove_column :spree_pages, :render_layout_as_partial
    end
  end
end
