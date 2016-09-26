class UploadsController < ApplicationController
	before_action :prev_step
	def index
    @@item = params[:id]
    @image_content = Item.find_by(id: params[:id]).images    
  end

  def create    
    @item_image = Image.create(item_id: @@item, avatar: params[:file])
    if @item_image.save!
      render json: { image: @item_image, url:@item_image.avatar.url(:profile)}
    else
      puts 'Hello'
      render json: { error: 'Failed to process' }, status: 422
    end    
  end

  def delete_image
    Image.where(id: params[:image_content]).destroy_all
    redirect_to uploads_url(request.parameters.merge(id: params[:item_id]))
  end

  private

  def prev_step
  end

end