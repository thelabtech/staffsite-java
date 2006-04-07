class ReportRecord < ActiveRecord::Base

  #some ugly sql statement to count orders...
  @@sql = 
"SELECT     alloc.*," +
"  (SELECT     SUM(fsk_FskOrder.totalKits)" +
"  FROM          fsk_FskOrder" +
"  WHERE      alloc.AllocationID = fsk_FskOrder.fk_Allocation) AS ordered_kits" +
"FROM         fsk_Allocation alloc"


  def records_for_region(region)
    find_by_sql(@@sql + " WHERE region = " + region)
  end
  
  def all_records()
    find_by_sql(@@sql)
  end
  
  
end
