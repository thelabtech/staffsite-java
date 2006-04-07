class ChangeRegionType < ActiveRecord::Migration
  def self.up
    change_column("fsk_allocations", "region_id", :integer)
  end

  def self.down

  end
end
