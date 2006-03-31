class Applicant < ActiveRecord::Base
    set_table_name				"wsn_sp_WsnApplication"
	set_primary_key 			"WsnApplicationID"
	
	belongs_to :summer_project, :foreign_key => "fk_isMember"
	
	attr_accessible :fk_PersonID
end