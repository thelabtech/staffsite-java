class ReportRecord < ActiveRecord::Base

  #some ugly sql statement to count orders...
  @@sql = 
"SELECT     alloc.*," +
"  (SELECT     SUM(fsk_orders.total_kits)" +
"  FROM          fsk_orders" +
"  WHERE      alloc.ssm_id = fsk_orders.ssm_id and fsk_orders.type = 'kit' ) AS ordered_kits" +
" FROM         fsk_allocations alloc"

  def self.records_for_region(region)
    find_by_sql(@@sql + ", ministry_RegionalTeam region WHERE region_id = region.teamID and region.region = '" + region + "'")
  end
  
  def self.all_records()
    find_by_sql(@@sql)
  end
  
  
end
