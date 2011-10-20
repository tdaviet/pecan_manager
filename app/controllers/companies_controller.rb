class CompaniesController < ApplicationController
  def new
    @company = Company.new
    @title = "New Company Sign up"
  end

  def show
    @company = Company.find(params[:id])
    @title = @company.name
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      #sign_in @user
      flash[:success] = "new company created"
      redirect_to @company
    else
      @title = "New Company Sign up"
      render 'new'
    end
  end
end
