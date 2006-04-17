class AddDisplayColumn < ActiveRecord::Migration
  def self.up
    add_column :fsk_products, :availability, :string, :limit => 20, :default => 'both', :null => false
  end

  def self.down
    remove_column :fsk_products, :availability
  end
end
