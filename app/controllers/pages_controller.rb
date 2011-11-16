class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @farm_new = Farm.new
      company_id = current_user.company_id
      @company = Company.find(company_id)
      @feed_items = @company.feed.paginate(:page => params[:page])
    end
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
end
