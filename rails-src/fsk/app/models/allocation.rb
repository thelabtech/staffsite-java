class Allocation < ActiveRecord::Base
  set_table_name	"fsk_Allocations"
  
  belongs_to :user, :foreign_key => "ssm_id"
  belongs_to :region

 
  validates_numericality_of :impact_allotment
  validates_numericality_of :forerunner_allotment
  validates_numericality_of :regional_allotment
  validates_numericality_of :regionally_raised
  validates_numericality_of :locally_raised
 
  def after_initialize
    remove_nulls
  end
  
  def remove_nulls
    self.impact_allotment ||= 0
    self.forerunner_allotment ||= 0
    self.regional_allotment ||= 0
    self.regionally_raised ||= 0
    self.locally_raised ||= 0
  end

  def total_kits
    (impact_allotment || 0) + 
    (forerunner_allotment || 0) +
    (regional_allotment || 0) +
    (regionally_raised || 0) +
    (locally_raised || 0)
  end
  
  def before_validation
    remove_nulls
  end
  
  protected
  def validate
    message = "must be multiples of 100."
    if (impact_allotment % 100 != 0)
      errors.add(:impact_allotment, message)
    end
    if (forerunner_allotment % 100) != 0
      errors.add(:forerunner_allotment, message)
    end
    if (regional_allotment % 100) != 0
      errors.add(:regional_allotment, message)
    end
    if (regionally_raised % 100) != 0
      errors.add(:regionally_raised, message)
    end
    if (locally_raised % 100) != 0
      errors.add(:locally_raised, message)
    end
    super
  end
end
