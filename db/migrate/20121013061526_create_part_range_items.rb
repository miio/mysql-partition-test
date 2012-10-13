class CreatePartRangeItems < ActiveRecord::Migration
  def change
    create_table :part_range_items do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :part_range_items, [:id]
    add_index :part_range_items, [:user_id]
    add_index :part_range_items, [:deleted_at]

    # ADD PRIMARY
    execute "ALTER TABLE part_range_items DROP PRIMARY KEY"
    execute "ALTER TABLE part_range_items add primary key(id, deleted_at)"

    remove_index :part_range_items, [:id]

    # ADD PARTITION
    execute "
ALTER TABLE part_range_items
PARTITION BY RANGE (TO_DAYS(deleted_at))
(
  PARTITION p20120101 VALUES LESS THAN (TO_DAYS('2012-01-01')) ENGINE = InnoDB,
  PARTITION p20120201 VALUES LESS THAN (TO_DAYS('2012-02-01')) ENGINE = InnoDB,
  PARTITION p20120301 VALUES LESS THAN (TO_DAYS('2012-03-01')) ENGINE = InnoDB,
  PARTITION p20120401 VALUES LESS THAN (TO_DAYS('2012-04-01')) ENGINE = InnoDB,
  PARTITION p20120501 VALUES LESS THAN (TO_DAYS('2012-05-01')) ENGINE = InnoDB,
  PARTITION p20120601 VALUES LESS THAN (TO_DAYS('2012-06-01')) ENGINE = InnoDB,
  PARTITION p20120701 VALUES LESS THAN (TO_DAYS('2012-07-01')) ENGINE = InnoDB,
  PARTITION p20120801 VALUES LESS THAN (TO_DAYS('2012-08-01')) ENGINE = InnoDB,
  PARTITION p20120901 VALUES LESS THAN (TO_DAYS('2012-09-01')) ENGINE = InnoDB,
  PARTITION p20121001 VALUES LESS THAN (TO_DAYS('2012-10-01')) ENGINE = InnoDB,
  PARTITION p20121101 VALUES LESS THAN (TO_DAYS('2012-11-01')) ENGINE = InnoDB,
  PARTITION p20121201 VALUES LESS THAN (TO_DAYS('2012-12-01')) ENGINE = InnoDB,
  PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB
);
    "
  end
end
