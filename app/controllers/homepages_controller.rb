class HomepagesController < ApplicationController
	before_filter :country_access
  
  def index
  end

  private

  def country_access
  	# 31.171.152.0
  	ip_request = Socket::getaddrinfo(Socket.gethostname,"echo",Socket::AF_INET)[0][3]
  	ip_country = Geocoder.search(ip_request).first.country
  		
  	if ip_country == "Albania"
  		redirect_to al_platform_index_path
  	elsif ip_country == " "
  		redirect_to ks_platform_index_path
  	else
  	end
	end
end
