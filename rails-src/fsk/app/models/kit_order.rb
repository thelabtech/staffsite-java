class KitOrder < Order
  validates_presence_of :total_kits
  validates_numericality_of :total_kits
  
  protected
  def validate
    if (total_kits % 100) != 0
      errors.add(:total_kits, "You must order kits in multiples of 100.")      
    end
    super
  end
end
