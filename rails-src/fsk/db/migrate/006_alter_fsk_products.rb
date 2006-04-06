class AlterFskProducts < ActiveRecord::Migration
  def self.up
    change_column("fsk_products", "name", :string, :limit => 50, :null => false, :default => '')
    change_column("fsk_products", "description", :string, :limit => 4000, :null => false, :default => '')
    change_column("fsk_products", "quantity", :integer, :null => false, :default => 0)
    rename_column("fsk_products", "kitCategory_id", "kit_category_id")
  end

  def self.down
    rename_column("fsk_products", "kit_category_id", "kitCategory_id")
  end
end
