class AutoNag < ActiveRecord::Migration
  def self.up
    create_table "nag_emails", :force => true do |t|
      t.column "query", :text, :null => false
      t.column "from", :string,:null => false
      t.column "subject", :string,:null => false
      t.column "body", :text,:null => false
      t.column "rails_cron_id", :integer, :null => false
      t.column "created_at", :datetime, :null => false
      t.column "updated_at", :datetime, :null => false
    end
  end

  def self.down
    remove_table("nag_emails")
  end
end
