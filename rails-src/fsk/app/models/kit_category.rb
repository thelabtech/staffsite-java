class KitCategory < ActiveRecord::Base
  set_table_name	"fsk_KitCategories"

  has_many :products

end
