class KsPlatformController < ApplicationController
  include KsPlatformHelper
  attr_accessor :categories, :cities

  def initialize
    @categories = Category.all
    @cities = ["Gjithë Kosovën","Prishtina", "Artanë", "Besianë", "Burim", "Dardanë", "Deçan", "Dragash", "Drenas"]
    @last_items = Item.where(country_id: 1, approve: true).last(4)
    super
  end

	def index
    @items = Item.where(country_id:1, approve: true).page params[:page]  
  end

  def show
    @item = Item.find(params[:id])
    @contact_result = nil

    if params[:code].present?
      @contact_result = check_code(params[:code], @item)
      if @contact_result == true
        regenerate_ks_code
      end
    end  
  end

  def search
    if params[:search] && params[:search] != ""
      @items = Item.where(country_id: 1, approve: true).search(params[:search], params[:location]).order("created_at DESC").page params[:page]
    end

    if params[:cat].present?
      @items = Category.find_by(name: params[:cat]).items.where(country_id: 1, approve: true).page params[:page] 
    end
  end

end
