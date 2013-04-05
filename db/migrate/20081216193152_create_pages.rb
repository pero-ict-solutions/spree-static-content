class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.string :title
      t.text   :body
      t.string :slug

      t.timestamps
    end
  end

  def down
    drop_table :pages
  end
end
