class LineItem < ActiveRecord::Base
  set_table_name	"fsk_LineItems"
  
  belongs_to :order
  belongs_to :product
  
end
