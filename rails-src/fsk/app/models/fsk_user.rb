class FskUser < ActiveRecord::Base
	set_table_name "fsk_Users"
	belongs_to :user, :foreign_key => :ssm_id
		
	# delegate all the ssm_user methods so we only have to use FskUser in the code
	def method_missing(method)
		user[method]
	end
	def emailVerified=(value)
	   user.emailVerified = value
	end
end
