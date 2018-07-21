class ReviewsController < ApplicationController

  def create
    @result = review_params
    # check if user's logged in
    if @result[:user_id].nil?
      # redirect with a error code
      @err_code = 1
      redirect_to product_path(@result[:product_id], err_code: @err_code)
    else
      # save review
      @review = Review.new(@result).save
      redirect_to product_path(@result[:product_id])
    end
  end

  private
  def review_params
    # receive form values and add product_id and user_id
    @result = params.require(:review).permit(:rating, :description)
    @result[:product_id] = params.require(:product_id)
    @result[:user_id] = session[:user_id]
    @result
  end
end
