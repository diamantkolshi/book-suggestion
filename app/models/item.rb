class Item < ActiveRecord::Base
  
  # extend FriendlyId
  # friendly_id :name, use: :slugged

  paginates_per 16
  
	has_attached_file :avatar, styles: { medium: "250x250#", thumb: "54x54#", profile: '386x244#' }, :default_url => 'no_image.jpg'
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	belongs_to :category
  belongs_to :country
  has_many :images
  
  validates :name, presence: true
  validates :title, presence: true
  validates :title, uniqueness: { :message => 'Titulli eshte i njejte (provo nje titull tjeter)'}
  validates :description, presence: true
  validates :phone, presence: { :message => 'Numri i telefonit eshte i njejte'}
  validates :price, presence: true
  validates :category, presence: true
  validates :country, presence: true
  validates :location, presence: true

  def self.search(search, location)
    
    if location == "Gjithë Kosovën" || location == "Gjithë Shqiperinë"
      where("title LIKE ? OR description LIKE ?", "%#{search}%","%#{search}%") 
    else
      where("AND title LIKE ? OR description LIKE ?","%#{search}%","%#{search}%")
      where(location: location)
    end
  end
  
end
