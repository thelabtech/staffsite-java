class LineItem < ActiveRecord::Base
  set_table_name	"fsk_LineItems"
  
  belongs_to :order
  belongs_to :product
  
  def validate
    errors.add(product.name, "you tried to order more than the quantity remaining") if product.too_many(self)
  end
end
