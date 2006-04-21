class Staff < ActiveRecord::Base
  set_table_name "ministry_staff"
  
  def self.get_staff(ssm_id)
    if ssm_id.nil? then raise "nil ssm_id!" end
    ssm_user = User.find(:first, :conditions => ["userID = ?", ssm_id])
    username = ssm_user.username
    profile = StaffsiteProfile.find(:first, :conditions => ["userName = ?", username])
    account_no = profile.accountNo
    staff = Staff.find(:first, :conditions => ["accountNo = ?", account_no])
  end
end
