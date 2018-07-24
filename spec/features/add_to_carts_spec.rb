require 'rails_helper'

RSpec.feature "Visitor adds a product to the cart", type: :feature, js: true do
  # TEMPORARY SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      # create a product under Apparel category
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can add a product to the cart by clicking on `Add` button" do
  # ACT
  visit root_path
  # click on the "Add" button of of the first product
  first('article.product').first('footer.actions > a[data-method="put"]').click
  sleep 5

  # DEBUG
  # save screenshot of home page
  page.save_screenshot('product_select.png')

  # VERIFY
  # get the innerHTML of the cart on your nav
  cart_size = page.find(:xpath, '//a[@href="/cart"]').text
  # check if cart_size is "My Cart (1)"
  expect(cart_size).to eq('My Cart (1)')
  end
end
