require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do
    # create a working example. Then, break it in each validation test
    def open_asset(file_name)
      File.open(Rails.root.join('db', 'seed_assets', file_name))
    end
    @category = Category.find(2)
    @product = @category.products.new(
      name: 'name',
      description: 'desc',
      image: open_asset('apparel1.jpg'),
      price_cents: 1.01,
      quantity: 1
    )
  end

  describe 'Validations' do
    # validation tests/examples here
    context 'given an empty name field' do
      it 'should not be valid' do
        @product[:name] = nil
        @product.save
        expect(@product.errors[:name]).to include("can't be blank")
      end
    end

    it 'should not be valid without a valid price field' do
      @product[:price_cents] = nil
      @product.save
      expect(@product.errors[:price_cents]).to include("is not a number")
    end

    it 'should not be valid without a valid quantity field' do
      @product[:quantity] = nil
      @product.save
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it 'should not be valid without a valid category field' do
      @product[:category_id] = nil
      @product.save
      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end
