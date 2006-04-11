class LineItem < ActiveRecord::Base
  set_table_name	"fsk_LineItems"
  
  belongs_to :order
  belongs_to :product
  
  def validate
    errors.add(product.name, "You tried to order more than the quantity remaining") if product.too_many(self)
    if (quantity % 100) != 0
      errors.add(product.name, "You must order products in multiples of 100.")      
    end
  end
end
