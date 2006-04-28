class Product < ActiveRecord::Base
  set_table_name	"fsk_Products"

  has_many :line_items
  has_many :product_text
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
          sql << "and      l.id <> #{item.id} "
    end
    sql << "GROUP BY p.quantity "
    # if this result returns nil, there are no line items for this product
    result = ActiveRecord::Base.connection.select_one(sql)
    if result.nil?
      quantity
    else
      result['remaining'].to_i
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
  
  def description
    # glue together description
    desc = ''
    product_text.each do |t|
      desc += t.description
    end
    return desc
  end
  
  def description=(value)
    # clear out old description text
    ProductText.destroy_all(["product_id = ?", id])
    # break up the new description
    length = value.length
    piece_count = (length/254).ceil
    (0..piece_count).each do |i|
      product_text << ProductText.new(:description => value[(254*i)..(254*(i+1))])
    end
  end
  
  protected
  def validate
    if price && price < 0
      errors.add(:price, "should be positive") 
    end
  end
end
