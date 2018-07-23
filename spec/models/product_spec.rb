require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should not be valid without a valid name field' do
      @product = Product.create

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "should not have 'Name can't be blank' in the error array " do
      @product = Product.create(name: 'name')

      expect(@product.errors.full_messages).to_not include("Name can't be blank")
    end

    it 'should not be valid without a valid price field' do
      @product = Product.create

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "should not have 'Price can't be blank' in the error array " do
      @product = Product.create(price: 20)

      expect(@product.errors.full_messages).to_not include("Price can't be blank")
    end

    it 'should not be valid without a valid quantity field' do
      @product = Product.create

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "should not have 'Quantity can't be blank' in the error array " do
      @product = Product.create(quantity: 20)

      expect(@product.errors.full_messages).to_not include("Quantity can't be blank")
    end

    it 'should not be valid without a valid category field' do
      @product = Product.create

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it "should not have 'Category can't be blank' in the error array " do
      @product = Product.create(category_id: 1)

      expect(@product.errors.full_messages).to_not include("CATEGORY can't be blank")
    end
    
  end
end
