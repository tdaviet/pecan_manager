class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :farm_id
      t.integer :block_number

      t.timestamps
    end
  end
end
