class Item < ActiveRecord::Base

  paginates_per 16
  
	has_attached_file :avatar, styles: { medium: "250x250#", thumb: "54x54#", profile: '386x244#' }
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	has_many :item_categories
  has_many :categories, through: :item_categories

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :phone, presence: true
  validates :price, presence: true

  def self.search(search)
    where("title LIKE ? OR description LIKE ?", "%#{search}%","%#{search}%") 
  end
  
end
