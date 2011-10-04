require 'spec_helper'

describe "Companies" do

  describe "signup company" do

    describe "failure" do

      it "should not make a new company" do
        lambda do
          visit signup_path
          fill_in "company_name",     :with => ""
          click_button
          response.should render_template('companies/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(Company, :count)
      end
    end

    describe "success" do

      it "should make a new company" do
        lambda do
          visit signup_path
          fill_in "company_name",     :with => "John Doe Farms"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "new company")
          response.should render_template('companies/show')
        end.should change(Company, :count).by(1)
      end
    end
  end
end