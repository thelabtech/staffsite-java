require File.dirname(__FILE__) + '/../test_helper'

class ReportRecordTest < Test::Unit::TestCase
  fixtures :fsk_allocations, :fsk_orders, :ministry_RegionalTeam, :staffsite_staffsiteprofile, :simplesecuritymanager_user, :ministry_staff

  # Replace this with your real tests.
  def test_records_for_region
    report_records = ReportRecord.records_for_region("GL")
    assert report_records.size > 0
  end
  
  def test_all_records
    report_records = ReportRecord.all_records
    assert report_records.size > 0
  end
end
