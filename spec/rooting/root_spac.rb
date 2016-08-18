require 'rails_helper'

RSpec.describe "routing to profiles", :type => :routing do

  it "root path" do
    expect(:get => "/").to route_to(
      :controller => "homepages",
      :action => "index"
    )
  end

  it "item new path" do
    expect(:get => "items/new").to route_to(
      :controller => "items",
      :action => "new"
    )
  end

  it "item create path" do 
    expect(:get => "items/create").to route_to(
      :controller => "items",
      :action => "create"
    )
  

  it "ks_platform index path" do 
    expect(:get => "ks_platform/index").to route_to(
      :controller => "ks_platform",
      :action => "index"
    )
  end

  it "ks_platform index path" do 
    expect(:get => "ks_platform/show").to route_to(
      :controller => "ks_platform",
      :action => "show"
    )
  end

  it "al_platform index path" do 
    expect(:get => "al_platform/index").to route_to(
      :controller => "al_platform",
      :action => "index"
    )
  end

   it "al_platform show path" do 
    expect(:get => "al_platform/show").to route_to(
      :controller => "al_platform",
      :action => "show"
    )
  end



end