class Image < ActiveRecord::Base

	belongs_to :item

	has_attached_file :avatar, styles: { medium: "750x400>", thumb: "354x354#", profile: '360x252#'}, :default_url => 'no_image.jpg'
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end