require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before :each do 
      @category = Category.new(name: "Snacks")
      @product = Product.new(name: "Chocolate Bar", price: 20, quantity: 3, category: @category)    
      @product.save!
    end
    it "All are successful" do
      expect(@product).to be_valid
    end
    it "Should return error saying Name can't be blank" do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to include ("Name can't be blank")
      expect(@product).to_not be_valid
    end
    it "Should return error saying Price can't be blank" do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include ("Price can't be blank")
      expect(@product).to_not be_valid
    end
    it "Should return error saying Quantity can't be blank" do
      @product.quantity = nil
      @product.valid?
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
      expect(@product).to_not be_valid
    end
    it "Should return error saying category can't be blank" do
      @product.category = nil
      @product.valid?
      expect(@product.errors.full_messages).to include ("Category can't be blank")
      expect(@product).to_not be_valid
    end
  end
end

