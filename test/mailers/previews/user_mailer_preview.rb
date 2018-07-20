class UserMailerPreview < ActionMailer::Preview

  def send_receipt
    @order = Order.find(1)
    @ordered_products = @order.line_items
    UserMailer.send_receipt(@order, @ordered_products)
  end

end