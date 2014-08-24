require 'rails_helper'

describe "Product scopes", :type => :model do

  context "with scope on_hand" do
    before do
      stock_location = create(:stock_location, backorderable_default: false)

      @product_with_stock = create(:product)
      stock_location.stock_items.where(variant_id: @product_with_stock.master.id).first.adjust_count_on_hand(10)

      @product_out_of_stock = create(:product)
      stock_location.stock_items.where(variant_id: @product_out_of_stock.master.id).first.adjust_count_on_hand(0)

      @product_backorderable = create(:product)
      stock_location.stock_items.where(variant_id: @product_backorderable.master.id).first.adjust_count_on_hand(0)
      stock_location.stock_items.where(variant_id: @product_backorderable.master.id).first.update_attribute(:backorderable, true)
    end

    it "includes a product with available stock" do
      expect(Spree::Product.on_hand).to include @product_with_stock
    end

    it "excludes a product without available stock" do
      expect(Spree::Product.on_hand).not_to include @product_out_of_stock
    end

    it "includes a product without stock that is backorderable" do
      expect(Spree::Product.on_hand).to include @product_backorderable
    end
  end
end
