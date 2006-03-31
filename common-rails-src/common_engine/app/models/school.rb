class School < ActiveRecord::Base
  set_table_name				"ministry_TargetArea"
  set_primary_key   			"TargetAreaID"
  
  #override the inheritance column
  self.inheritance_column = "nothing"
end
