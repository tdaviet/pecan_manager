class CompaniesController < ApplicationController
  def new
    @company = Company.new
    @title = "New Company Sign up"
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      # handle a successful save
    else
      @title = "New Company Sign up"
      render 'new'
    end
  end
end
