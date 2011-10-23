require 'spec_helper'

describe UsersController do
  render_views

    describe "GET 'show'" do

      before(:each) do
        @user = Factory(:user)
      end

      it "should be successful" do
        get :show, :id => @user
        response.should be_success
      end

      it "should find the right user" do
        get :show, :id => @user
        assigns(:user).should == @user
      end
      
      it "should have the right title" do
        get :show, :id => @user
        response.should have_selector("title", :content => @user.email)
      end

      it "should include the user's name" do
        get :show, :id => @user
        response.should have_selector("h1", :content => @user.name)
      end

#      it "should have a profile image" do
#        get :show, :id => @user
#        response.should have_selector("h1>img", :class => "gravatar")
#      end
    end
  
  #describe "GET 'new'" do
  #
  #  it "should be successful" do
  #    get 'new'
  #    response.should be_success
  #  end
  #
  #  it "should have the right title" do
  #    get 'new'
  #    response.should have_selector("title", :content => "Sign up")
  #  end
  #end

  describe "POST 'create'" do

     before(:each) do
       @company = Factory(:company)
     end

        describe "success" do

          before(:each) do
            @attr = { :email                 => "mhartl@example.com",
                      :password              => "foobar",
                      :password_confirmation => "foobar",

            }
          end

            it "should sign the user in" do
              post :create, :user => @attr
              controller.should be_signed_in
            end

          #currently no test to see if a user is created
        #it "should create a user" do
        #  lambda do
        #    post :create, :user => @attr
        #  end.should change(User, :count).by(1)
        #end
    end
  end

  describe "GET 'edit'" do

    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
    end

    it "should be successful" do
      get :edit, :id => @user
      response.should be_success
    end

    it "should have the right title" do
      get :edit, :id => @user
      response.should have_selector("title", :content => "Edit user")
    end
  end
end
