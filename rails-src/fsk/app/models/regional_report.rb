class RegionalReport 

  
  attr_reader :region_code, :region_name, :report_records, :totals
  
  
  def initialize(region_code, all_report_records = nil)
    @totals = Hash.new
    init_region(region_code)
    if all_report_records
      @report_records = Array.new
      all_report_records.each do |report_record|
        if report_record.region == @region_code
          @report_records << report_record
        end
      end
    else
      @report_records = ReportRecord.records_for_region(@region_code) 
    end
    calculate_totals
  end  
  
  def init_region(region_code)
    @region_code = region_code
    @region_name = Region.find(:first, :conditions => ["region = ?", region_code]).name
  end
  
  def calculate_totals
    fields = ReportRecord.reported_fields
    fields.each do |field|
      @totals[field] = 0
      @report_records.each do |record|
        @totals[field] = (@totals[field] || 0) + (record.send(field) || 0).to_i
      end
    end
  end
end
