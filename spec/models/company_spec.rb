# == Schema Information
#
# Table name: companies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe "Company" do

  before(:each) do
    @attr = {
       :name => "John Doe Farms"
      }
  end
  
  it "should create a new instance given valid attributes" do
    Company.create!(@attr)
  end

  describe "attributes" do

    before(:each) do
      @company = Company.new(@attr)
    end

    it "should include 'name'" do
      @company.should respond_to(:name)
    end

    it "should have a users attribute" do
      @company.should respond_to(:users)
    end
  end

  describe "validations" do


    it "should require a name" do
      no_name_company = Company.new(@attr.merge(:name => ""))
      no_name_company.should_not be_valid
    end

    it "should not allow long names" do
      long_name_company = Company.new(@attr.merge(:name => "a" * 51))
      long_name_company.should_not be_valid
    end

    it "should reject duplicate names" do
      Company.create!(@attr)
      company_with_duplicate_name = Company.new(@attr)
      company_with_duplicate_name.should_not be_valid
    end

    describe "user validations" do
       before(:each) do
         @user = Factory(:user)
       end
      #it "should require an email" do
      #   no_email_user = Company.new(@user.merge(:users_atttributes => {:email => ""}))
      #   no_email_user.should_not be_valid
      #end
    end
  end


end
