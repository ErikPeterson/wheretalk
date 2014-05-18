class CreateFreeBlocks < ActiveRecord::Migration
  def change
    create_table :free_blocks do |t|
      t.integer :schedule_id
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
