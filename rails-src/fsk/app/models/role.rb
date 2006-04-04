class Role < ActiveRecord::Base
  set_table_name "fsk_Roles"
  
  has_and_belongs_to_many :fields, :join_table => "fsk_Fields_Roles", :uniq => true
  has_many :fsk_user

end