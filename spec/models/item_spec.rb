require "rails_helper"


describe Item do
  context "associations" do
    it { should belong_to(:category) }
    it { should belong_to(:country) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:country) }    
  end
end
