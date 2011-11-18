class BlocksController < ApplicationController
  before_filter :authenticate

  def new
    @block = Block.new
    @block.farm_id = params[:farm_id]
  end

  def create

    @farm = Farm.find(params[:block][:farm_id])
    #@block.farm_id = params[:farm_id]
    company_id = current_user.company_id
    @company = Company.find(company_id)
    #@block.farm_id = params[:farm_id]

    @block_new = @farm.blocks.build(params[:block])

    if @block_new.save
      flash[:success] = "block created"
      redirect_to farm_path(@farm.id)
    else
      render 'farms/show'
    end
  end

  def destroy
  end
end
