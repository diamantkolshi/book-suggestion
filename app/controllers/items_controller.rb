class ItemsController < ApplicationController
  
  def index
    if params[:search] && params[:search] != ""
      @items = Item.search(params[:search]).order("created_at DESC").page params[:page]
    else
      @items = Item.where(approve: true).page params[:page]
    end
  end

  def new
  	@items = Item.new
  end

  def create
    @item = Item.new(require_params)
    if @item.save
    	flash[:success] = "Kerkesa juaj eshte bere me sukses"
    else
      flash[:danger] = @item.errors.messages      
 	 	end
    redirect_to new_item_path
  end

  def show
  end

  private 

  def require_params
    params.require(:item).permit(:firstname, :lastname, :email, :address, :phone, :category, :title, :description, :avatar, :price)
  end
end
