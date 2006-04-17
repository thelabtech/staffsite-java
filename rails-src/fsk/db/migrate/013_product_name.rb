class ProductName < ActiveRecord::Migration
  def self.up
    change_column('fsk_products','name', :string, :limit => 200, :null => false)
  end

  def self.down
    change_column('fsk_products','name', :string, :limit => 50, :null => false)
  end
end
