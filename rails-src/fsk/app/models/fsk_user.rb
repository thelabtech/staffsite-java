class FskUser < ActiveRecord::Base
  set_table_name "fsk_Users"
  belongs_to :user, :foreign_key => :ssm_id
  belongs_to :role, :foreign_key => :role_id
  
  # delegate all the ssm_user methods so we only have to use FskUser in the code
  def method_missing(method)
    user[method]
  end
  def emailVerified=(value)
    user.emailVerified = value
  end
  
  def can_modify_allocation?(allocation)
    return true if role.name == "local" and allocation.user.id == user.id
    return true if role.name == "national" or role.name == "regional"
    # if they aren't one of these, we don't know them
    return false
  end
  
  def can_modify_field?(field)
    field_names = role.fields.map {|field_obj| field_obj.name }
    field_names.include?(field)
  end
  
end
