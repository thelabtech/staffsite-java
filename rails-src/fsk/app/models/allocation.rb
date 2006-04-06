class Allocation < ActiveRecord::Base
  set_table_name	"fsk_Allocations"
  
  belongs_to :user, :foreign_key => "ssm_id"

  def total_kits
    (impactAllotment || 0) + 
    (forerunnerAllotment || 0) +
    (regionalAllotment || 0) +
    (regionallyRaised || 0) +
    (locallyRaised || 0)
  end
end
