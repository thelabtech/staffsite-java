require File.dirname(__FILE__) + '/../test_helper'

class NationalReportTest < Test::Unit::TestCase
  fixtures :fsk_allocations, :fsk_orders, :ministry_regionalteam

  # Replace this with your real tests.
  def test_national_report
    report = NationalReport.new
    assert report.regional_reports.size > 0
    assert report.totals["impact_allotment"] > 0
  end
end
