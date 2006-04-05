class AddUsers < ActiveRecord::Migration
  def self.up
    rename_column("simplesecuritymanager_user", "email", "email_deprecated")
    change_column("simplesecuritymanager_user", "lastFailure", :datetime, :null => true)
    execute "INSERT INTO simplesecuritymanager_user (userID, globallyUniqueID, username, password, "+
                                                    "passwordQuestion, passwordAnswer, lastFailure, lastFailureCnt, "+
                                                    "lastLogin, createdOn, emailVerified) "+
                                            "VALUES (42655,'F167605D-94A4-7121-2A58-8D0F2CA6E026','josh.starcher@uscm.org', "+
                                            "        'DomB6DfPieMK1vx6Tt6Vpw==', 'why?', '42', NULL, 0, '2006-04-04', "+
                                            "       '2004-04-09', 1)"
    execute "INSERT INTO simplesecuritymanager_user (userID, globallyUniqueID, username, password, "+
                                                    "passwordQuestion, passwordAnswer, lastFailure, lastFailureCnt, "+
                                                    "lastLogin, createdOn, emailVerified) "+
                                            "VALUES (58616, 'F167605D-94A4-7121-2A58-8D0F2CA6E026','matthew.drees@uscm.org', "+
                                            "        'P+vaORoZmwI2wP29FLvcyw==', 'stupid?', 'yes', NULL, 0, '2006-04-05', "+
                                            "       '2005-05-09', 1)"
  end

  def self.down
    rename_column("simplesecuritymanager_user", "email_deprecated", "email")
  end
end
