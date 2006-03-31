class Product < ActiveRecord::Base
  set_table_name	"fsk_LineItems"

  has_many :line_items
  belongs_to :kit_category
 
end
