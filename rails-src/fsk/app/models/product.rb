class Product < ActiveRecord::Base
  set_table_name	"fsk_Products"

  has_many :line_items
  belongs_to :kit_category

  validates_presence_of :name
  validates_presence_of :description
  validates_numericality_of :price
  
  validates_format_of :image_filename,
    :with => %r{.+\.(gif|jpg)$}i,
    :message => "must be a gif or jpeg file"

  def self.product_sql
    "select	p.*, SUM(l.quantity) as ordered, p.quantity as total, "+
    "       p.quantity - SUM(l.quantity) as remaining "+
    "from	fsk_lineitems l, fsk_orders o, fsk_products p "+
    "where	l.order_id = o.id "+
    "and	l.product_id = p.id "+
    "group by p.id"
  end
  
  def quantity_remaining
    sql = "select	p.quantity - SUM(l.quantity) as remaining "+
          "from	    fsk_lineitems l, fsk_orders o, fsk_products p "+
          "where    l.order_id = o.id "+
          "and	    l.product_id = p.id "+
          "and      p.id = #{id}"
    remaining = ActiveRecord::Base.connection.select_one(sql)['remaining']
    # if this result returns nil, there are no line items for this product
    if remaining.nil?
      quantity
    else
      remaining
    end
  end
  
  def too_many(item)
    sql = "select	p.quantity - SUM(l.quantity) as remaining "+
          "from	    fsk_lineitems l, fsk_orders o, fsk_products p "+
          "where    l.order_id = o.id "+
          "and	    l.product_id = p.id "+
          "and      p.id = #{id} "
    if (item.id)
          sql << "and      l.id <> #{item.id}"
    end
    remaining = ActiveRecord::Base.connection.select_one(sql)['remaining']
    return quantity < item.quantity + remaining.to_i
  end
  
  protected
  def validate
    if price && price < 0.01
      errors.add(:price, "should be positive") 
    end
  end
end
