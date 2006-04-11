class Allocation < ActiveRecord::Base
  set_table_name	"fsk_Allocations"
  
  belongs_to :user, :foreign_key => "ssm_id"
  belongs_to :region

  def total_kits
    (impact_allotment || 0) + 
    (forerunner_allotment || 0) +
    (regional_allotment || 0) +
    (regionally_raised || 0) +
    (locally_raised || 0)
  end
end
