class RenameVersionColumns < ActiveRecord::Migration
  def self.up
    rename_column('fsk_allocations','version','lock_version')
    rename_column('fsk_kit_categories','version','lock_version')
    rename_column('fsk_lineitems','version','lock_version')
    rename_column('fsk_orders','version','lock_version')
    rename_column('fsk_products','version','lock_version')
  end

  def self.down
    rename_column('fsk_allocations','lock_version','version')
    rename_column('fsk_kit_categories','lock_version','version')
    rename_column('fsk_lineitems','lock_version','version')
    rename_column('fsk_orders','lock_version','version')
    rename_column('fsk_products','lock_version','version')
  end
end
