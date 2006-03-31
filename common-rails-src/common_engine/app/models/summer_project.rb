class SummerProject < ActiveRecord::Base
	set_table_name				"wsn_sp_WsnProject"
	set_primary_key 			"WsnProjectID"
	has_many :applicants, :foreign_key => 'fk_isMember'
end
