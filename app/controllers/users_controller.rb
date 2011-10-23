class UsersController < ApplicationController
   #before_filter :authenticate

  def show
    @user = User.find(params[:id])
    @title = @user.email
  end

  def new
    @user = @company.users.build(params[:user]) #@company.users.new #User.new #
    @title = "Sign up"
  end

  def create
    @user = User.new(params[:user])#@company.users.build(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "You are signed in."
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end
end
