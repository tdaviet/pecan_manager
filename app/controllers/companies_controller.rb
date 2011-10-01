class CompaniesController < ApplicationController
  def new
    @company = Company.new
    @title = "New Company Sign up"
  end

end
