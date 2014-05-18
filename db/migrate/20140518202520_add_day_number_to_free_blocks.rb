class AddDayNumberToFreeBlocks < ActiveRecord::Migration
  def change
    add_column :free_blocks, :day_number, :integer
  end
end
