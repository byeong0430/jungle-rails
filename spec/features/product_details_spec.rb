require 'rails_helper'

RSpec.feature "Visitor navigates to a product description page", type: :feature, js: true do
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

  scenario "They see all product descriptions" do
  # ACT
  visit root_path
  # in the first article.product select 'Details' <a> in footer.actions
  first('article.product').first('footer.actions > a.btn.btn-default.pull-right').click
  # it takes some time to render the product detail page.
  sleep 3

  # DEBUG
  # save screenshot of home page
  page.save_screenshot('product_page.png')

  # VERIFY
  # check if there is an article with class called "product" DOM el
  expect(page).to have_css 'article.product-detail'
  end
end
