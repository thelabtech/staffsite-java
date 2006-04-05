class AddMinistryPerson < ActiveRecord::Migration
  def self.up
    create_table "ministry_person", :id => false, :force => true do |t|
      t.column "personID", :integer, :default => 0, :null => false
      t.column "accountNo", :string, :limit => 11
      t.column "lastName", :string, :limit => 50
      t.column "firstName", :string, :limit => 50
      t.column "middleName", :string, :limit => 50
      t.column "preferredName", :string, :limit => 50
      t.column "gender", :string, :limit => 1
      t.column "birthDate", :string, :limit => 25
      t.column "dateBecameChristian", :string, :limit => 35
      t.column "region", :string, :limit => 5
      t.column "workInUS", :integer, :default => 0, :null => false
      t.column "usCitizen", :integer, :default => 0, :null => false
      t.column "citizenship", :string, :limit => 50
      t.column "isStaff", :integer, :default => 0, :null => false
      t.column "title", :string, :limit => 5
      t.column "campus", :string, :limit => 128
      t.column "universityState", :string, :limit => 5
      t.column "yearInSchool", :string, :limit => 20
      t.column "graduationDate", :string, :limit => 25
      t.column "major", :string, :limit => 70
      t.column "minor", :string, :limit => 70
      t.column "greekAffiliation", :string, :limit => 50
      t.column "maritalStatus", :string, :limit => 20
      t.column "numberChildren", :string, :limit => 2
      t.column "isChild", :integer, :default => 0, :null => false
      t.column "bio", :text
      t.column "image", :string, :limit => 100
      t.column "occupation", :string, :limit => 50
      t.column "blogfeed", :string, :limit => 200
      t.column "dateCreated", :datetime
      t.column "dateChanged", :datetime
      t.column "createdBy", :string, :limit => 50
      t.column "changedBy", :string, :limit => 50
      t.column "fk_ssmUserId", :integer
      t.column "fk_StaffSiteProfileID", :integer
      t.column "fk_spouseID", :integer
      t.column "fk_childOf", :integer
    end
  end

  def self.down
    drop_table "ministry_person"
  end
end
