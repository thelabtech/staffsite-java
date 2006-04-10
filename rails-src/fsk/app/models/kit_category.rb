class KitCategory < ActiveRecord::Base
  set_table_name	"fsk_kit_categories"

  has_many :products

  def product_sql
    "select	p.*, SUM(l.quantity) as ordered, p.quantity as total, "+
    "       p.quantity - SUM(l.quantity) as remaining "+
    "from	fsk_lineitems l, fsk_orders o, fsk_products p, fsk_kit_categories k "+
    "where	l.order_id = o.id "+
    "and	l.product_id = p.id "+
    "and    k.id = #{id} "+
    "and p.kit_category_id = k.id "+
    "group by p.id"
  end
end
