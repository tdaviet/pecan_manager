class UsersController < ApplicationController
   #before_filter :authenticate

  def show
    @user = User.find(params[:id])
    @title = @user.email
  end

  def new
    @user = User.new #@company.users.build
    @title = "Sign up"
  end

  def create

  end

end
