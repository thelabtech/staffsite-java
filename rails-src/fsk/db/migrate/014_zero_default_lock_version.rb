class ZeroDefaultLockVersion < ActiveRecord::Migration
  def self.up
    change_column('fsk_allocations','lock_version', :integer, :null => false, :default => 0)
    change_column('fsk_kit_categories','lock_version', :integer, :null => false, :default => 0)
    change_column('fsk_lineitems','lock_version', :integer, :null => false, :default => 0)
    change_column('fsk_orders','lock_version', :integer, :null => false, :default => 0)
    change_column('fsk_products','lock_version', :integer, :null => false, :default => 0)
  end

  def self.down
    
  end
end