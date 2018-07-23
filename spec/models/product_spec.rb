require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should validate the presence of name field' do
      category = Category.new(name: 'Clothing')
      product = Product.new(name:'name', description:'description', image:'image', price_cents:20, quantity:20)

      expect(@product.key?(:name)).to be true
    end


  end
end
