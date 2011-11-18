require 'spec_helper'

describe Block do

  before(:each) do
    #@user = test_sign_in(Factory(:user))
    #company_id = @user.company_id
    @company = Factory(:company)
    @farm = Factory(:farm)
    @attr = { :block_number => "1" }
  end

  it "should create a new instance given valid attributes" do
   @farm.blocks.create!(@attr)
  end

  it "should require a block number" do
    no_number_farm = @farm.blocks.new(@attr.merge(:block_number => ""))
    no_number_farm.should_not be_valid
  end

  describe "farm associations" do

    before(:each) do
      @block = @farm.blocks.create(@attr)
    end

    it "should have a farm attribute" do
      @block.should respond_to(:farm)
    end

    it "should have the right associated farm" do
      @block.farm_id.should == @farm.id
      @block.farm.should == @farm
    end
  end

  describe "validations" do

    it "should require a farm id" do
      Block.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @farm.blocks.build(:block_number => "  ").should_not be_valid
    end

    it "should reject duplicate block numbers for the same farm" do
      # Put a user with given email address into the database.
      @farm.blocks.create!(@attr)
      block_with_duplicate_number = @farm.blocks.new(@attr)
      block_with_duplicate_number.should_not be_valid
    end

  end
end
