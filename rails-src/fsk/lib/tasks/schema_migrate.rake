desc "Create a migration file that contains all the changes to your db since the last schema dump."
task :schema_migrate => :environment do
  raise "Your schema format must be set to :ruby to use this task" if ActiveRecord::Base.schema_format != :ruby
  current_filename = ENV['SCHEMA'] || "db/schema.rb"
  # make sure the schema file exists
  raise "You don't have a schema to migrate. Run `rake db_schema_dump` first." if !File.exist?(current_filename)
  old_filename = current_filename+'.old'
  File.rename(current_filename, old_filename) # move the old file out of the way
  Rake::Task["db:schema:dump"].invoke     # get updated schema from db
  require 'lib/schema_rake.rb'
  # load the two schema files
  load(current_filename)
  new_schema = ActiveRecord::Schema.schema
  load(old_filename)
  old_schema = ActiveRecord::Schema.schema
  # create the migration
  ActiveRecord::Schema.migrate(old_schema, new_schema)
  # Clean up our files
  File.delete(old_filename)
end