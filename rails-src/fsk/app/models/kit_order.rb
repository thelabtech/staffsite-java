class KitOrder < Order
  belongs_to :allocation
  validates_presence_of :total_kits
  validates_numericality_of :total_kits
  
  
  def validate
    if (total_kits)
      if (total_kits % 100) != 0
        errors.add(:total_kits, "You must order kits in multiples of 100.")      
      end
      unless new_record?
        # make sure that totals from each category == total_kits
        sql = "select	SUM(l.quantity) as total "+
              "from	fsk_line_items l, fsk_products p, fsk_kit_categories k "+
              "where	l.product_id = p.id "+
              "and	p.kit_category_id = k.id "+
              "and	l.order_id = #{id} "+
              "group by k.id"
        ActiveRecord::Base.connection.select_all(sql).each do |category|
          if category["total"].to_i != total_kits
            errors.add(:items, "The total items from each category must be the same as the total number of kits")
            break
          end
        end
      end
    end
  end
end