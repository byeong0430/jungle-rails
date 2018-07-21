class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    # make @review available in views/products/new.html.erb
    @review = Review.new

    @product = Product.find params[:id]
    # create an instance class of reviews for the given product id
    # this variable is available in views/products/show.html.erb
    @reviews = Review.where('product_id = ?', params[:id])
  end

end
