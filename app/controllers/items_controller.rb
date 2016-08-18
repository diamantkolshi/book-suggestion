class ItemsController < ApplicationController

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
  
  private 

  def require_params
    params.require(:item).permit(:name, :email, :address, :location, :phone, :country_id, :category_id, :title, :description, :avatar, :price)
  end
end