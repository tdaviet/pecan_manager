require 'spec_helper'

describe FarmsController do
  render_views

    #describe "GET 'new'" do
    #  it "should be successful" do
    #    get 'new'
    #    response.should be_success
    #  end
    #end


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
        @attr = { :farm_name => "" }
      end

      it "should not create a farm" do
        lambda do
          post :create, :farm => @attr
        end.should_not change(Farm, :count)
      end

      it "should render the home page" do
        post :create, :farm => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :farm_name => "Lorem ipsum" }
      end

      it "should create a farm" do
        lambda do
          post :create, :farm => @attr
        end.should change(Farm, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :farm => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :farm => @attr
        flash[:success].should =~ /farm created/i
      end
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
      company_id = @user.company_id
      @company = Company.find(company_id)
      @farm = Factory(:farm)#@company.farms.first
    end

    it "should have the right title" do
      get :show, :id => @farm
      response.should have_selector("title", :content => @company.name)
    end
  end
end
