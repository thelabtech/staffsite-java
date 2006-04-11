require File.dirname(__FILE__) + '/../test_helper'

class RegionalReportTest < Test::Unit::TestCase
  fixtures :fsk_allocations, :fsk_orders, :ministry_RegionalTeam, :staffsite_staffsiteprofile, :simplesecuritymanager_user, :ministry_staff

  # Replace this with your real tests.
  def test_regional_report
    report = RegionalReport.new("GL")
    assert (not report.nil?)
    assert report.report_records.size > 0
  end
end
