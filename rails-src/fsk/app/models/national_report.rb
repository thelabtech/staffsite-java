class NationalReport 

  attr_reader :regional_reports, :totals
  
  
  def initialize()
    report_records = ReportRecord.all_records()
    @regional_reports = Array.new
    for region in Region.standard_regions
      @regional_reports << RegionalReport.new(region.region, report_records)
    end
    calculate_totals
  end
  
  def calculate_totals
    @totals = Hash.new
    @regional_reports.each do |report|
      fields = ReportRecord.reported_fields
      fields.each do |field|
        @totals[field] = (@totals[field] || 0) + (report.totals[field] || 0).to_i
      end
    end
  end
  
end
