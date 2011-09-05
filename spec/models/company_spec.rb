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
      company_with_duplicate_name = User.new(@attr)
      company_with_duplicate_name.should_not be_valid
    end

  end
end
