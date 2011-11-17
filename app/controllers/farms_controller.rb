class FarmsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

  def create
    company_id = current_user.company_id
    @company = Company.find(company_id)
    @farm_new = @company.farms.build(params[:farm])
    #@feed_items = ""
    if @farm_new.save
      flash[:success] = "farm created"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def show
    @farm = Farm.find(params[:id])
    company_id = current_user.company_id
    @company = Company.find(company_id)
    @blocks = @farm.blocks#.paginate(:page => params[:page])
    @block_new = @farm.blocks
    @title = @company.name
  end

  def destroy
     redirect_to root_path
  end
end
