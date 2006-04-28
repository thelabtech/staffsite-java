class OrderMailer < ActionMailer::Base

  @@from = 'Dave Schlernitzauer <dave.schlernitzauer@uscm.org>'
  def placed(order)
    @subject    = 'FSK Order Confirmation'
    @body       = {:order => order}
    @recipients = Staff.get_staff(order.user.id).email
    @from       = @@from
    @sent_on    = Time.now
  end

  def changed(order)
    @subject    = 'FSK Order Update'
    @body       = {:order => order}
    @recipients = Staff.get_staff(order.user.id).email
    @from       = @@from
    @sent_on    = Time.now
  end

  def shipped(order)
    @products = []
    Product.find(:all).each do |product|
      @products[product.id] = order.product_quantity(product.id)
    end
    @subject    = 'FSK Order Shipped'
    @body       = {:order => order}
    @recipients = Staff.get_staff(order.user.id).email
    @from       = @@from
    @sent_on    = Time.now
  end
end
