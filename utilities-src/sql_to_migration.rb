#!c:/ruby/bin/ruby
# == Synopsis
# Convert MySQL sql into migration syntax.
#
# == Usage
#    
#    ruby sql_to_migration.rb input_file next_migration_number
#

require 'optparse'
require 'rdoc/usage'
def pad(string)
  while string.length < 3
    string = "0"+string
  end
  return string
end
def camelize(lower_case_and_underscored_word, first_letter_in_uppercase = true)
  if first_letter_in_uppercase
    lower_case_and_underscored_word.to_s.gsub(/\/(.?)/) { "::" + $1.upcase }.gsub(/(^|_)(.)/) { $2.upcase }
  else
    lower_case_and_underscored_word.first + camelize(lower_case_and_underscored_word)[1..-1]
  end
end
opts = OptionParser.new
opts.on("-h", "--help") { RDoc::usage }
opts.parse(ARGV) rescue RDoc::usage('usage')
if ARGV.size < 2
  puts "\nError: You must provide an input file, and what you'd like the migration number to be.\n"
  RDoc::usage
end
s = "    "
filename = ARGV[0]
migration_num = ARGV[1].to_s
filename =~ /(.*)\./
migration_name = $1
up, down = '',''
File.open(filename, "r") do |file|
  while line = file.gets
    if line =~ /ALTER TABLE `.*`\.`(.*?)` .*/
      $table = $1
    end
    case line
    when /CHANGE COLUMN `(.*)` `(.*)`/
      up += "#{s}rename_column(\"#$table\", \"#$1\", \"#$2\")\n"
      down += "#{s}rename_column(\"#$table\", \"#$2\", \"#$1\")\n"
    when /DROP COLUMN `(.*)`/
      up += "#{s}remove_column(\"#$table\", \"#$1\")\n"
    when /MODIFY COLUMN `(.*)` (VARCHAR\(\d+\)|INTEGER)\s?(NOT NULL)?\s+(DEFAULT ['\w]+)?/
      up += "#{s}change_column(\"#$table\", \"#$1\""
      type = $2
      up += ", :null => false" if $3 == "NOT NULL"
      default = /DEFAULT (['\w]+)/
      if $4 =~ default
        up += ", :default => #$1"
      end
      case type
      when "INTEGER"
        up += ", :integer"
      when /VARCHAR\((\d+)\)/
        up += ", :string, :limit => #$1"   
      end
      up += ")\n"
      #t.column "api", :string, :limit => 50, :default => "", :null => false
    end
  end
  # create the output file
  out_filename = "db/migrate/#{pad(migration_num)}_#{migration_name}.rb"
  out = File.new(out_filename,"w")
  out.puts "class #{camelize(migration_name)} < ActiveRecord::Migration\n"
  out.puts "  def self.up\n"
  out.puts up
  out.puts "  end\n"
  out.puts "\n"
  out.puts "  def self.down\n"
  out.puts down
  out.puts "  end\n"
  out.puts "end"
  out.close
  #turn this on for debug
  File.open(out_filename,"r") do |file|
    #file.each {|line| puts line}
  end
end