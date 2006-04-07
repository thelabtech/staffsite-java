class RemoveRegionNotNullConstraints < ActiveRecord::Migration
  def self.up
    change_column("ministry_regionalteam", "oldPrimaryKey", :string, :limit => 64)
    change_column("ministry_regionalteam", "name", :string, :limit => 100)
    change_column("ministry_regionalteam", "note", :string, :limit => 255)
    change_column("ministry_regionalteam", "region", :string, :limit => 2)
    change_column("ministry_regionalteam", "address1", :string, :limit => 35)
    change_column("ministry_regionalteam", "address2", :string, :limit => 35)
    change_column("ministry_regionalteam", "city", :string, :limit => 30)
    change_column("ministry_regionalteam", "state", :string, :limit => 6)
    change_column("ministry_regionalteam", "zip", :string, :limit => 10)
    change_column("ministry_regionalteam", "country", :string, :limit => 64)
    change_column("ministry_regionalteam", "phone", :string, :limit => 24)
    change_column("ministry_regionalteam", "fax", :string, :limit => 24)
    change_column("ministry_regionalteam", "email", :string, :limit => 50)
    change_column("ministry_regionalteam", "url", :string, :limit => 255)
    change_column("ministry_regionalteam", "isActive", :string, :limit => 1)
    change_column("ministry_regionalteam", "no", :string, :limit => 80)
    change_column("ministry_regionalteam", "abbrv", :string, :limit => 80)
    change_column("ministry_regionalteam", "hrd", :string, :limit => 50)
  end

  def self.down

  end
end
