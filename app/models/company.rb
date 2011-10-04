# == Schema Information
#
# Table name: companies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Company < ActiveRecord::Base

  attr_accessible :name

  has_many :users
  #accepts_nested_attributes_for :users

  validates :name,  :presence => true,
                    :length   => { :maximum => 50 },
                    :uniqueness => { :case_sensitive => false }

  def user_attributes=(user_attributes)
    user_attributes.each do |attributes|
      users.build(attributes)
    end
  end
end
