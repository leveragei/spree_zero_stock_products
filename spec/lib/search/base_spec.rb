require 'rails_helper'

describe Spree::Core::Search::Base do

  let!(:stock_location)       { create(:stock_location, backorderable_default: false) }
  let!(:product_with_stock)   { create(:product) }
  let!(:product_out_of_stock) { create(:product) }

  before(:each) do
    stock_location.stock_items.where(variant_id: product_with_stock.master.id).first.update_column('count_on_hand', 10)
    stock_location.stock_items.where(variant_id: product_out_of_stock.master.id).first.update_column('count_on_hand', 0)
  end

  context "with show_zero_stock_products = FALSE" do
    it "includes" do
      Spree::Config.show_zero_stock_products = false
      results  = find_products

      expect(results).to include product_with_stock
      expect(results).not_to include product_out_of_stock
    end
  end

  context "with show_zero_stock_products = TRUE" do
    it "returns all products regardless of stock status" do
      Spree::Config.show_zero_stock_products = true
      results  = find_products

      expect(results).to include product_with_stock
      expect(results).to include product_out_of_stock
    end
  end
end
