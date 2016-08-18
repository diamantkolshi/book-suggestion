class Item < ActiveRecord::Base
  
  # extend FriendlyId
  # friendly_id :name, use: :slugged

  paginates_per 16
  
	has_attached_file :avatar, styles: { medium: "250x250#", thumb: "54x54#", profile: '386x244#' }, :default_url => 'no_image.jpg'
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	belongs_to :category
  belongs_to :country
  
  validates :name, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :phone, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :country, presence: true
  validates :location, presence: true

  def self.search(search)
    where("title LIKE ? OR description LIKE ?", "%#{search}%","%#{search}%") 
  end
  
end
