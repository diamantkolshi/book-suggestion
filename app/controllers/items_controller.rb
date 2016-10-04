class ItemsController < ApplicationController
  include ItemsHelper
  before_action :check_item_status, only: [:new]
  before_action :check_upload_status, only: [:uploads]
  $item_id ||= nil
  $item_status ||= nil
  $form_status ||= nil
  $code_status ||= nil

  def new
    @items = Item.new
  end

  def create 
    @item = Item.new(require_params.merge!({status: "give"})) if $form_status == "give"
    @item = Item.new(require_params.merge!({status: "sale"})) if $form_status == "sale"
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
    $form_status = nil
    $code_status = nil
    flash[:success] = "Kerkesa juaj eshte bere me sukses"
    redirect_to items_choose_form_path
  end

  def choose_form
  end

  def give_books
    $form_status = "give"
    redirect_to new_item_path
  end

  def sell_books
    $form_status = "sale"
    unless $code_status == true
      if check_code(params[:code]) == true
        $code_status = true
        redirect_to new_item_path   
      else
        redirect_to items_choose_form_path
        flash[:error] = "Kodi nuk eshte valid"
      end   
    else
      redirect_to new_item_path 
    end 
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