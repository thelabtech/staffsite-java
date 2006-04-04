class Field < ActiveRecord::Base
  set_table_name "fsk_Fields"
  
  has_and_belongs_to_many :roles, :join_table => "fsk_Fields_Roles", :uniq => true
	
end
