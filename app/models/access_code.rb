class AccessCode < ActiveRecord::Base

	validates :al_code, presence: true
  validates :ks_code, presence: true

  def self.al_code_generate
  	al_code = rand(36**6).to_s(36)
  end

  def self.ks_code_generate
  	ks_code = rand(36**6).to_s(36)
  end

end
