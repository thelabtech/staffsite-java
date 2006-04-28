class MinistryActivity < ActiveRecord::Base
  set_table_name			"ministry_Activity"
  set_primary_key   			"ActivityID"
  belongs_to :target_area, :foreign_key => "fk_targetAreaID"
  
end
