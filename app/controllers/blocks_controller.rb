class BlocksController < ApplicationController
  before_filter :authenticate

  def new
    @block = Block.new
    @block.farm_id = params[:farm_id]
  end

  def create
    @block.farm_id = params[:farm_id]
    @farm = Farm.find(params[:block][:farm_id])
    company_id = current_user.company_id
    @company = Company.find(company_id)
    #@block.farm_id = params[:farm_id]

    @block_new = @farm.blocks.build(params[:block])

    if @block_new.save
      flash[:success] = "farm created"
      redirect_to root_path
    else
      render 'farm/show'
    end
  end

  def destroy
  end
end
