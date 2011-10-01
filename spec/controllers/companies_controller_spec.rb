require 'spec_helper'

describe CompaniesController do
  render_views

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
  end
end
