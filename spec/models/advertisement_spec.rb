require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) {Advertisement.create(title: "Product 1", body: "Best of the Best", price: 100) }

  describe "attributes" do
    it "gives proper attributes to model object" do
      expect(advertisement).to have_attributes(title: "Product 1", body: "Best of the Best", price: 100)
    end
  end
end
