# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime

class User < ActiveRecord::Base
  attr_accessor :user_password
  attr_accessible :name, :email, :user_password, :user_password_confirmation

  belongs_to :company

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }

  #Automatically create the virtual attribute 'password_confirmation'.
  validates :user_password, :presence     => true,
                            :confirmation => true,
                            :length       => { :within => 6..40 }

  validates :company_id,  :presence => true

  before_save :encrypt_password

    # Return true if the user's password matches the submitted password.
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end


  private

    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(user_password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{user_password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
