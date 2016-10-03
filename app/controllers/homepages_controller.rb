class HomepagesController < ApplicationController
	before_filter :country_access
  
  def index
  end

  private

  def country_access
  	# 31.171.152.0

    ip_address = Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }.ip_address
  	ip_country = Geocoder.search(ip_address).first.country
  		
  	if ip_country == "Albania"
  		redirect_to al_platform_index_path
  	elsif ip_country == ""
  		redirect_to ks_platform_index_path
  	else
  	end
	end
end
