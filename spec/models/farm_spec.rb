require 'spec_helper'

describe Farm do

  before(:each) do
    @company = Factory(:company)
    @attr = {
      :farm_name        => "Dixie Ranch"
    }
  end

  it "should create a new instance given valid attributes" do
    @company.farms.create!(@attr)
  end

  describe "validations" do

    it "should require a farm name" do
      no_farm_name = @company.farms.new(@attr.merge(:farm_name => ""))
      no_farm_name.should_not be_valid
    end

    it "should require a company id" do
      Farm.new(@attr).should_not be_valid
    end
  end

  describe 'company associations' do

    before(:each) do
      @farm = @company.farms.create(@attr)
    end

    it "should have a company attribute" do
      @farm.should respond_to(:company)
    end

    it "should have the right associated company" do
      @farm.company_id.should == @company.id
      @farm.company.should == @company
    end
  end
end


