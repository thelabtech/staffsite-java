class TargetArea < ActiveRecord::Base
  set_table_name				"ministry_TargetArea"
  set_primary_key   			"TargetAreaID"
  
  #override the inheritance column
  self.inheritance_column = "nothing"
  
  has_many :ministry_activities, :foreign_key => "fk_targetAreaID"
end
