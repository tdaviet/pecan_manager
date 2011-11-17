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
    end

    describe "failure" do

      before(:each) do
        @attr = { :block_number => "" }
      end

      it "should not create a block" do
        lambda do
          post :create, :block => @attr
        end.should_not change(Block, :count)
      end

      it "should render the home page" do
        post :create, :block => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :block_number => "1" }
      end

      it "should create a block" do
        lambda do
          post :create, :block => @attr
        end.should change(Block, :count).by(1)
      end

      it "should redirect to the farm show page" do
        post :create, :block => @attr
        response.should redirect_to(farm_path)
      end

      it "should have a flash message" do
        post :create, :block => @attr
        flash[:success].should =~ /block created/i
      end
    end
  end

end
