class Region < ActiveRecord::Base
  set_table_name "ministry_regionalteam"
  set_primary_key "teamID"


  @@standard_region_codes = ["NE", "MA", "MS", "SE", "GL", "UM", "GP", "RR", "NW", "SW"]
  
  def self.standard_regions
    find(:all, :conditions => [ "region IN (?)", @@standard_region_codes])
  end
end
