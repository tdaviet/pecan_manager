class CreateFarms < ActiveRecord::Migration
  def self.up
    create_table :farms do |t|
      t.string :farm_name
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :farms
  end
end
