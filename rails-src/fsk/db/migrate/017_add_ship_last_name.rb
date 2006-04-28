class AddShipLastName < ActiveRecord::Migration
  def self.up
    rename_column('fsk_orders', 'ship_name', 'ship_first_name')
    add_column('fsk_orders', 'ship_last_name', :string)
  end

  def self.down
    rename_column('fsk_orders', 'ship_first_name', 'ship_name')
    remove_column('fsk_orders', 'ship_last_name')
  end
end
