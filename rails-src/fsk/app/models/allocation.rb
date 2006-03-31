class Allocation < ActiveRecord::Base
  set_table_name	"fsk_Allocations"
  
  belongs_to :user, :foreign_key => "ssm_id"
  
end
