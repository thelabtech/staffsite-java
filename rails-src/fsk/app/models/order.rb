class Order < ActiveRecord::Base
	set_table_name	"fsk_Orders"
	
	belongs_to :user, :foreign_key => "ssm_id"
	has_many :line_items
	
end
