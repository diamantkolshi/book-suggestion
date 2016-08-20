class AlPlatformController < ApplicationController

	def index
    if params[:search] && params[:search] != ""
      @items = Item.where(country_id: 2, approve: true).search(params[:search]).order("created_at DESC").page params[:page]
    else
      @items = Item.where(country_id: 2, approve: true).page params[:page]
    end
  end

  def show
   	 @item = Item.find(params[:id])
  end

  def al_code_request_result
  end

end
