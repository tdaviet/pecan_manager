class CompaniesController < ApplicationController
  def new
    @company = Company.new
    @title = "New Company Sign up"
    1.times { @company.users.build }
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      flash[:success] = "new company created"
     redirect_to @company
    else
      @title = "New Company Sign up"
      render 'new'
    end
  end
end
