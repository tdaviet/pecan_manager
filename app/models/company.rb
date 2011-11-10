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

  attr_accessible :name, :users_attributes, :farms_attributes#, :users#, :user_id#, :email#, :user_password#, :user_password_confirmation#, :company_id#, :user#, :user_attributes

  has_many :users
  has_many :farms, :dependent => :destroy

  accepts_nested_attributes_for :users,
                                :allow_destroy => true

  validates :name,  :presence => true,
                    :length   => { :maximum => 50 },
                    :uniqueness => { :case_sensitive => false }

  def feed
    Farm.where("company_id = ?", id)
  end

  #def user
  #   @user
  #end

  #def user_attributes=(user_attributes)
  #  user_attributes.each do |attributes|
  #    users.build(attributes)
  #  end
  #end
end
