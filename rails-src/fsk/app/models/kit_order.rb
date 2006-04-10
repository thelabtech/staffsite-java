class KitOrder < Order
  validates_presence_of :total_kits
  validates_numericality_of :total_kits
  
  protected
  def validate
    # make sure that the items in each category add up to total kits
    if total_kits > 0
      
    end
    super
  end
end
