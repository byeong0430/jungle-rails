require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    context 'given an empty name field' do
      it 'should not be valid' do
        @product = Product.create
        expect(@product.errors[:name]).to include("can't be blank")
      end
    end

    context 'given a valid name field' do
      it "should not have 'Name can't be blank' in the error array " do
        @product = Product.create(name: 'name')
        expect(@product.errors[:name]).to_not include("can't be blank")
      end
    end

    it 'should not be valid without a valid price field' do
      @product = Product.create

      expect(@product.errors[:price]).to include("can't be blank")
    end
    it "should not have 'Price can't be blank' in the error array " do
      @product = Product.create(price: 20)

      expect(@product.errors[:price]).to_not include("can't be blank")
    end

    it 'should not be valid without a valid quantity field' do
      @product = Product.create

      expect(@product.errors[:quantity]).to include("can't be blank")
    end
    it "should not have 'Quantity can't be blank' in the error array " do
      @product = Product.create(quantity: 20)

      expect(@product.errors[:quantity]).to_not include("can't be blank")
    end

    it 'should not be valid without a valid category field' do
      @product = Product.create

      expect(@product.errors[:category]).to include("can't be blank")
    end
    it "should not have 'Category can't be blank' in the error array " do
      @category = Category.find(2)
      @product = @category.products.create
      expect(@product.errors[:category]).to_not include("can't be blank")
    end

  end
end
