class ReportRecord < ActiveRecord::Base

  #this isn't really used, but active record requires it
  set_table_name "fsk_orders"
  
  def leader_name
    
  end
  
  def total_kits
    (impact_allotment.to_i || 0) + 
    (forerunner_allotment.to_i || 0) +
    (regional_allotment.to_i || 0) +
    (regionally_raised.to_i || 0) +
    (locally_raised.to_i || 0)
  end
 
  def kits_not_yet_ordered
    return total_kits - (kit_orders_pending || 0)
  end
  
  @@reported_fields = ["impact_allotment", "forerunner_allotment", "regional_allotment", "regionally_raised", "locally_raised", "total_kits", "kit_orders_pending", "kits_not_yet_ordered"]
  cattr_reader :reported_fields
  
  
  @@all_records_sql = 
"SELECT     staffPerson.firstName, staffPerson.lastName, alloc.*, " +
"  (SELECT     SUM(fsk_orders.total_kits) " +
"  FROM          fsk_orders " +
"  WHERE      alloc.ssm_id = fsk_orders.ssm_id and fsk_orders.type = 'kit' ) AS kit_orders_pending " +
"FROM         fsk_allocations alloc, simplesecuritymanager_user ssm, staffsite_staffsiteprofile profile, ministry_staff staffPerson " +
"Where  alloc.ssm_id = ssm.userId and ssm.username = profile.username and profile.accountNo = staffPerson.accountNo"

  @@regional_records_sql = 
"SELECT     staffPerson.firstName, staffPerson.lastName, alloc.*, " +
"  (SELECT     SUM(fsk_orders.total_kits) " +
"  FROM          fsk_orders " +
"  WHERE      alloc.ssm_id = fsk_orders.ssm_id and fsk_orders.type = 'kit' ) AS kit_orders_pending " +
"FROM         fsk_allocations alloc, simplesecuritymanager_user ssm, staffsite_staffsiteprofile profile, ministry_staff staffPerson, ministry_RegionalTeam region " +
"Where  alloc.ssm_id = ssm.userId and ssm.username = profile.username and profile.accountNo = staffPerson.accountNo and alloc.region_id = region.teamID and region.region = "

  def self.records_for_region(region)
    find_by_sql(@@regional_records_sql + "'#{region}'")
  end
  
  def self.all_records()
    find_by_sql(@@all_records_sql)
  end
  
  
end
