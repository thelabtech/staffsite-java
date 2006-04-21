class Product < ActiveRecord::Base
  set_table_name	"fsk_Products"

  has_many :line_items
  belongs_to :kit_category

  validates_presence_of :name
  validates_presence_of :description
  validates_numericality_of :price
  file_column     :image_filename, :fix_file_extensions => true
  validates_format_of :image_filename,
    :with => /.+\.(gif|jpg)$/i,
    :message => "must be a gif or jpeg file"
  
  def quantity_remaining(item = nil)
    sql = "select	(p.quantity - SUM(l.quantity)) as remaining "+
          "from	    fsk_line_items l, fsk_orders o, fsk_products p "+
          "where    l.order_id = o.id "+
          "and	    l.product_id = p.id "+
          "and      p.id = #{id} "
    if (item && item.id)
          sql << "and      l.id <> #{item.id}"
    end
    remaining = ActiveRecord::Base.connection.select_one(sql)['remaining']
    # if this result returns nil, there are no line items for this product
    if remaining.nil?
      quantity
    else
      remaining.to_i
    end
  end
  
  def too_many(item)
    return quantity_remaining(item) - item.quantity < 0
  end
  
  def <=>(product)
    self.name <=> product.name
  end
  
  def human_availability
    if quantity_remaining == 0
      return 'This product is sold out.'
    end
    case availability
    when 'both'
      'This product can be ordered individually, or as part of a kit.'
    when 'kit'
      'This product can only be ordered as part of a kit.'
    when 'individual'
      'This product cannot be ordered as part of a kit. You must order it seperately.'
    when 'neither'
      'This product is currently unavailable.'
    end
  end
  
  protected
  def validate
    if price && price < 0.01
      errors.add(:price, "should be positive") 
    end
  end
end
