class KitCategory < ActiveRecord::Base
  set_table_name	"fsk_kit_categories"

  has_many :products

end
