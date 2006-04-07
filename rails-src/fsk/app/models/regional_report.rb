class RegionalReport 

  @region_code
  @region_name
  @report_records
  
    
  def init_records
    @report_records = ReportRecord.records_for_region(@region_code)
  end
  
  def init_records(report_records)
    report_records.each do |report_record|
      if report_record.region == @region
        @report_records << report_record
      end
    end
  end

end
