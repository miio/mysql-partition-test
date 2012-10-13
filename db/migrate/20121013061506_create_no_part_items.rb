class CreateNoPartItems < ActiveRecord::Migration
  def change
    create_table :no_part_items do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :no_part_items, [:user_id]
    add_index :no_part_items, [:deleted_at]

  end
end
