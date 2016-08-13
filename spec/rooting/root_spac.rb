require 'rails_helper'

RSpec.describe "routing to profiles", :type => :routing do

  it "root path" do
    expect(:get => "/").to route_to(
      :controller => "homepages",
      :action => "index"
    )
  end

  it  "items index path" do 
    expect(:get => "items/index").to route_to(
      :controller => "items",
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
  end
  it "item show path" do
    expect(:get => "items/show").to route_to(
      :controller => "items",
      :action => "show"
    )
  end

end