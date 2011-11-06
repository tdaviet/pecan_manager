require 'spec_helper'

describe CompaniesController do
  render_views

  describe "GET 'show'" do

    before(:each) do
      @company = Factory(:company)
    end

    it "should be successful" do
      get :show, :id => @company
      response.should be_success
    end

    it "should find the right company" do
      get :show, :id => @company
      assigns(:company).should == @company
    end

    it "should have the right title" do
      get :show, :id => @company
      response.should have_selector("title", :content => @company.name)
    end

    it "should have the company's name" do
      get :show,  :id => @company
      response.should have_selector("h1", :content => @company.name)
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector('title', :content => "New Company Sign up")
    end
  end

  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @attr = { :name => ""}
      end

      it "should not create a company" do
        lambda do
          post :create, :company => @attr
        end.should_not change(Company, :count)
      end

      it "should have the right title" do
        post :create, :company => @attr
        response.should have_selector("title", :content => "New Company Sign up")
      end

      it "should render the 'new' page" do
        post :create, :company => @attr
        response.should render_template('new')
      end


    end

    describe "success" do

      before(:each) do
        @attr = { :name => "John Doe Farms"}
        @user = Factory(:user)
      end

      it "should create a company" do
        lambda do
          post :create, :company => @attr
        end.should change(Company, :count).by(1)
      end

      it "should redirect to the company show page" do
        post :create, :company => @attr
        response.should redirect_to(company_path(assigns(:company)))
      end

      it "should have a  welcome message" do
        post :create, :company =>@attr
        flash[:success].should =~ /new company created/i
      end

      #it "should sign the user in" do
      #  post :create, :session => @attr
      #  controller.current_user.should == @user
      #  controller.should be_signed_in
      #end
      #
      #it "should redirect to the user show page" do
      #  post :create, :session => @attr
      #  response.should redirect_to(user_path(@user))
      #end

    end
  end
end
