class CreateBlocks < ActiveRecord::Migration
  def self.up
    create_table :blocks do |t|
      t.integer :farm_id
      t.integer :block_number

      t.timestamps
    end
    add_index :blocks, [:farm_id]
  end

  def self.down
    drop_table :blocks
  end
end
