class ChangeBlockNumberToText < ActiveRecord::Migration
  def up
    change_column(:blocks, :block_number, :string)
  end

  def down
    change_column(:blocks, :block_number, :integer)
  end
end
