class UserMailer < ApplicationMailer

  def send_receipt(order, products)
    # create an instance variable so that it is available in send_receipt htmls
    @ordered_products = products
    @title = 'Order Confirmation: Order #' + order.id.to_s
    mail to: order.email, subject: @title
  end

end
