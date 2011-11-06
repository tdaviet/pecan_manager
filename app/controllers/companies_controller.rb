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
    #@user = User.new(params[:user])

    #session[:user_attributes] = @user.attributes
    if @company.save
      #sign_in @user
      #@user[:sessions] = "sign_in"
      #sign_in @user
      #user = User.authenticate(params[:user][:email], params[:user][:password])
      #sign_in user
      #sign_in @session
      #redirect_to signin_path and return
      #@user = User.new(params[:company_users_attributes_0_email][:email], params[:company_users_attributes_0_password][:password])
      #@user = User.find(:one, :params => { :company_id => @company} )#(params[:company][:id])
      #sign_in @user
      flash[:success] = "new company created"
      redirect_to @company
    else
      @title = "New Company Sign up"
      render 'new'
    end
  end
end
