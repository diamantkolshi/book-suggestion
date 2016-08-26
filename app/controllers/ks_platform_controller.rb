class KsPlatformController < ApplicationController
  include KsPlatformHelper

	def index
    if params[:search] && params[:search] != ""
      @items = Item.where(country_id: 1, approve: true).search(params[:search]).order("created_at DESC").page params[:page]
    else
      @items = Item.where(country_id:1, approve: true).page params[:page]
    end
    
    if params[:cat].present?
      @items = Category.find_by(name: params[:cat]).items.where(country_id: 1).page params[:page] 
    end

    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
    @contact_result = nil

    if params[:code].present?
      @contact_result = check_code(params[:code], @item)
      if @contact_result == true
        regenerate_ks_code
      end
    end  
  end

end
