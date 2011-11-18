require 'spec_helper'

describe BlocksController do
  render_views

  describe "access control" do

    it "should deny unsigned-in access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny unsigned-in access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
      company_id = @user.company_id
      @company = Company.find(company_id)
      @farm = Factory(:farm) #@company.farms.first
    end

    describe "failure" do

      before(:each) do
        @attr = { :block_number => "",
                  :farm_id => @farm }
      end

      it "should not create a block" do
        lambda do
          post :create, :block => @attr
        end.should_not change(Block, :count)
      end

      it "should render the farms page" do
        post :create, :block => @attr
        response.should render_template('farms/show')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :block_number => "1",
                  :farm_id => @farm }
      end

      it "should create a block" do
        lambda do
          post :create, :block => @attr
        end.should change(Block, :count).by(1)
      end

      it "should redirect to the farm show page" do
        post :create, :block => @attr
        response.should redirect_to(farm_path(@farm))
      end

      it "should have a flash message" do
        post :create, :block => @attr
        flash[:success].should =~ /block created/i
      end
    end
  end

end
