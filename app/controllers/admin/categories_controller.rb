# frozen_string_literal: true

class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def index
    # get all categories from categories table
    @categories = Category.order(id: :desc).all
  end

  def create
    # execute 'category_params' private function
    @category = Category.new(category_params)

    if @category.save
      redirect_to %i[admin categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def new
    # initiate a 'Category' class
    @category = Category.new
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
