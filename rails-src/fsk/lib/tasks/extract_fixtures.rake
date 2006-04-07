desc 'Create YAML test fixtures from data in an existing database.
Defaults to development database. Set RAILS_ENV to override.'

task :extract_fixtures => :environment do
  sql = "SELECT TOP 300 * FROM %s"
  skip_tables = ["schema_info","simplesecuritymanager_user"]
  ActiveRecord::Base.establish_connection
  (ActiveRecord::Base.connection.tables - skip_tables).each do |table_name|
    i = "000"
    File.open("#{RAILS_ROOT}/test/fixtures/#{table_name}.yml", 'w') do |file|
      data = ActiveRecord::Base.connection.select_all(sql % table_name)
      file.write data.inject({}) { |hash, record|
        hash["#{table_name}_#{i.succ!}"] = record
        hash
      }.to_yaml
    end
  end
=begin
  i = "000"
  File.open("#{RAILS_ROOT}/test/fixtures/simplesecuritymanager_user.yml", 'w') do |file|
    data = ActiveRecord::Base.connection.select_all("SELECT * FROM simplesecuritymanager_user WHERE userID=42655")
    file.write data.inject({}) { |hash, record|
      hash["simplesecuritymanager_user_#{i.succ!}"] = record
      hash
    }.to_yaml
  end
=end
end