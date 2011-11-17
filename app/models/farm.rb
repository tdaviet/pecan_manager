class Farm < ActiveRecord::Base

  attr_accessible :farm_name

  belongs_to :company
  has_many :blocks, :dependent => :destroy

  validates :farm_name,  :presence   => true
  validates :company_id, :presence   => true

end
