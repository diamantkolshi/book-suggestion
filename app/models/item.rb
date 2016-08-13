class Item < ActiveRecord::Base
  
	has_attached_file :avatar, styles: { medium: "250x250#", thumb: "54x54#", profile: '386x244#' }
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	has_many :item_categories
  has_many :categories, through: :item_categories

end
