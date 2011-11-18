class Block < ActiveRecord::Base
  attr_accessible :block_number

  belongs_to :farm

  validates :block_number,  :presence => true
  validates :farm_id,       :presence => true
  validates_uniqueness_of   :block_number, :scope => :farm_id

end
