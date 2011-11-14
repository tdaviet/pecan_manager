class FarmsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

  def create
    company_id = current_user.company_id
    @company = Company.find(company_id)
    @farm = @company.farms.build(params[:farm])
    #@feed_items = ""
    if @farm.save
      flash[:success] = "farm created"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def show
    company_id = current_user.company_id
    @company = Company.find(company_id)
    @title = @company.name
  end

  def destroy

  end
end
