class CompaniesController < ApplicationController
  def new
    @company = Company.new
    @title = "New Company Sign up"
  end

  def show
    @company = Company.find(params[:id])
    @farms = @company.farms#.paginate(:page => params[:page])
    @title = @company.name
  end

  def create
    @company = Company.new(params[:company])

    if @company.save
      flash[:success] = "new company created"
      #@company_id = Company.find(@company)
      #@user = User.find(@company.id)
      #sign_in @user
      redirect_to signin_path #@company
    else
      @title = "New Company Sign up"
      render 'new'
    end
  end
end
