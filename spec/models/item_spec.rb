require "rails_helper"


describe Item do
  context "associations" do
    it { should have_many(:item_categories) }
    it { should have_many(:categories).through(:item_categories) }
  end

  context "validations" do
    it { should validate_presence_of(:firstname) }
    it { should validate_presence_of(:lastname) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:price) }
  end
end
