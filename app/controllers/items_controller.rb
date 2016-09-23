class ItemsController < ApplicationController
  include ItemsHelper
  before_action :check_item_status, only: [:new]
  before_action :check_upload_status, only: [:uploads]
  $item_id ||= nil
  $item_status ||= nil

  def new
    @items = Item.new
  end

  def create 
    @item = Item.new(require_params)  

    if @item.save
      flash[:success] = "Kerkesa juaj eshte bere me sukses"
      $item_id = @item.id
      $item_status = "between complete"
      redirect_to items_uploads_url
    else
      flash[:danger] = @item.errors.messages
      redirect_to new_item_path    
    end
  end

  def uploads
    @image_content = Item.find_by(id: $item_id).images    
  end

  def upload_image    
    @item_image = Image.create(item_id: $item_id, avatar: params[:file])
    if @item_image.save!
      render json: { image: @item_image, url:@item_image.avatar.url(:profile)}
    else
      puts 'Hello'
      render json: { error: 'Failed to process' }, status: 422
    end    
  end

  def delete_image
    Image.where(id: params[:image_content]).destroy_all
    redirect_to items_uploads_url
  end

  def complete_register
    $item_id = nil
    $item_status = nil
    flash[:success] = "Kerkesa juaj eshte bere me sukses"
    redirect_to new_item_url
  end
  
  private 

  def require_params
    params.require(:item).permit(:name, :email, :address, :location, :phone, :country_id, :category_id, :title, :description, :avatar, :price)
  end

  def check_item_status
   if $item_status.nil?
   else
    redirect_to items_uploads_url
   end
  end

  def check_upload_status
    unless $item_status.nil?
    else
    redirect_to new_item_url
   end
  end

end












# if check_code(params[:item][:code]) == true
#       if @item.save
#         flash[:success] = "Kerkesa juaj eshte bere me sukses"
#         regeneration_code
#       else
#         flash[:danger] = @item.errors.messages      
#       end
#     else
#       flash[:error] = "Kodi nuk eshte valid (shiko prano kodin)"
#     end