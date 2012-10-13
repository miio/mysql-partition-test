class CreatePartTwoItems < ActiveRecord::Migration
  def change
    create_table :part_two_items do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.boolean :is_deleted
      t.timestamps
    end

    add_index :part_two_items, [:id]
    add_index :part_two_items, [:user_id]
    add_index :part_two_items, [:is_deleted]

    # ADD PRIMARY
    execute "ALTER TABLE part_two_items DROP PRIMARY KEY"
    execute "ALTER TABLE part_two_items add primary key(id, is_deleted)"

    remove_index :part_two_items, [:id]

    # ADD PARTITION
    execute "
ALTER TABLE part_two_items
PARTITION BY LIST(is_deleted) (
PARTITION pTrue VALUES IN (1),
PARTITION pFalse VALUES IN (0)
);
    "
  end
end
