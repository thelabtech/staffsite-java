class ChangeAllocationTypes < ActiveRecord::Migration
  def self.up
    change_column("fsk_allocations", "impact_allotment", :integer)
    change_column("fsk_allocations", "forerunner_allotment", :integer)
    change_column("fsk_allocations", "regional_allotment", :integer)
    change_column("fsk_allocations", "regionally_raised", :integer)
    change_column("fsk_allocations", "locally_raised", :integer)
  end

  def self.down

  end
end
