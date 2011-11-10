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

  describe "farm associations" do

    before(:each) do
      @company = Company.create(@attr)
      @fm1 =     Factory(:farm, :company => @company)
    end

    it "should have a farms attribute" do
      @company.should respond_to(:farms)
    end

    describe "status feed" do

      it "should have a feed" do
        @company.should respond_to(:feed)
      end

      it "should include the company's farms" do
        @company.feed.include?(@fm1).should be_true
        #@company.feed.include?(@fm2).should be_true
      end

      it "should not include a different company's farms" do
        mp3 = Factory(:farm,
                      :company => Factory(:company, :name => Factory.next(:name)))
        @company.feed.include?(mp3).should be_false
      end
    end
  end

end
