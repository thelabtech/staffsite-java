require File.dirname(__FILE__) + '/../test_helper'

class ReportRecordTest < Test::Unit::TestCase
  fixtures :fsk_allocations, :fsk_orders

  # Replace this with your real tests.
  def test_records_for_region
    report_records = ReportRecord.records_for_region("GL")
    assert report_records.size > 0
    
  end
end
