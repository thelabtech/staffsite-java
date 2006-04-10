module ActiveRecord
  class Schema
    private_class_method :new    
    # Eval the given block. All methods available to the current connection
    # adapter are available within the block, so you can easily use the
    # database definition DSL to build up your schema (#create_table,
    # #add_index, etc.).
    def self.define(info={}, &block)
      @schema = SchemaDefinition.new(info)
      
      instance_eval(&block)
    end
    def self.create_table(name, options = {})
      @table = TableDefinition.new(name, options)
      
      yield @table
      
      @schema.add_table(@table.dup)
    end
    def self.add_index(table_name, column_names, options) 
      index = IndexDefinition.new(table_name, column_names, options[:name], options[:unique])
      @schema.add_index(index.dup)
    end
    
    def self.schema
      @schema
    end
    
    def self.migrate(old_schema, new_schema)
      migration = ActiveRecord::Migration.new(new_schema.version+1)
      #first table pass: look for tables in old_schema that aren't in new_schema
      old_schema.tables.each do |name,table|
        unless new_schema.includes_table?(table)
          migration.remove_table_up(table) 
          old_schema.remove_table(table)
        end
      end
      
      #second table pass: look for tables in new_schema that aren't in old_schema
      new_schema.tables.each do |name,table|
        unless old_schema.includes_table?(table)
          migration.add_table_up(table)
          new_schema.remove_table(table)
        end
      end
      #third table pass: compare each table that's left, and look for columns that are different
      old_tables = old_schema.tables
      new_schema.tables.sort.each do |table_name, table|
        next if table == old_tables[table_name] # if both tables are identical, move on
        new_columns, old_columns = table.columns.dup, old_tables[table_name].columns.dup
        # get rid of the identical columns
        new_columns -= old_columns
        old_columns -= table.columns
        #this is where it gets messy
        new_columns.each_with_index do |column,i|
          if match = column.name_match(old_columns)       #same name, different options
            migration.change_column_up(table_name, match, column)
            old_columns.delete_at(i)
          else 
            if match = column.close_match(old_columns)   # different name, similar options
              migration.rename_column_up(table_name, match.name, column.name)
              # if it wasn't an exact match, call change_column too.
              if (match.limit != column.limit or match.default != column.default or match.null != column.null)
                migration.change_column_up(table_name, match, column) 
              end
              old_columns.delete_at(i)
            else
              migration.add_column_up(table_name, column)   # new column
            end
          end
        end
        # whatever is left in old_columns needs to be removed
        old_columns.each do |column|
          migration.remove_column_up(table_name, column)
        end
      end
      
      # look for indexes in old that are not in new
      old_schema.indexes.each do |index|
        unless new_schema.includes_index?(index)
          migration.remove_index_up(index) 
          old_schema.remove_index(index)
        end
      end
      # look for indexes in new that are not in old.
      new_schema.indexes.each do |index|
        unless old_schema.includes_index?(index)
          migration.add_index_up(index)
          new_schema.remove_index(index)
        end
      end
      
      #create the migration file
      new_schema.version = migration.create_file
    end
  end


  class ColumnDefinition < Struct.new(:name, :type, :limit, :default, :null)
    def name_match(columns)
      columns.detect {|col| col.name == name}
    end
    
    def close_match(columns)
      # we want to be generous with our matching here.
      # first try to match a column of the same type
      match = columns.detect {|col| col.type == type} 
      # if that didn't work, consider the first column a match. 
      # renaming a column that was supposed to be dropped and re-added will do
      # less dammage than dropping a column that was supposed to be renamed.
      if !match and columns.size
        columns[0]
      end
    end
  end
  
  class TableDefinition
    attr_accessor :name, :columns, :options
    def initialize(name, options)
      @name = name
      @columns = []
      @options = options
    end
     
    def column(name, type, options = {})
      column = ColumnDefinition.new(name, type, options[:limit], options[:default], options[:null])
      @columns << column unless @columns.include?(column)
      self
    end
  end
  
  class IndexDefinition < Struct.new(:table_name, :column_names, :name, :unique)
  end
  
  class SchemaDefinition
    attr_accessor :tables, :table, :version, :indexes
    def initialize(info)
      @version = info[:version]
      @tables = {}
      @indexes = []
    end
    
    def add_table(table)
      @tables[table.name] = table
    end
    
    def remove_table(table)
      @tables.delete(table.name)
    end
    
    def includes_table?(table)
      @tables[table.name]
    end
    
    def add_index(index)
      @indexes << index
    end
    
    def remove_index(index)
      @indexes.delete(index.name)
    end
      
    def includes_index?(index)
      @indexes.detect {|i| i.table_name == index.table_name and i.name = index.name}
    end
    
    def table_count
      @tables.size
    end
  end
  class Utility
    def Utility.replace(filename, search, replace)
      new_filename = filename+'_new_'
      File.open(filename, "r") do |file|
        File.open(new_filename, "w") do |out|
      	while line = file.gets
      	  out.puts line.gsub(search, replace)
      	end
        end
      end
      #move the new file to where the old one was
      File.delete(filename)
      File.rename(new_filename, filename)
    end  
  end
  class Migration
    def initialize(version)
      @version = version
      @up = String.new
      @down = String.new
    end
    
    def add_table_up(table)
      @up << add_table(table)
      @down << drop_table(table.name)
    end
    
    def remove_table_up(table)
      @up << drop_table(table.name)
      @down << add_table(table)
    end
    
    def add_index_up(index)
      @up << add_index(index)
      @down << remove_index(index)
    end
    
    def remove_index_up(index)
      @up << remove_index(index)
      @down << add_index(index)
    end
    
    def change_column_up(table_name, old_column, new_column)
      @up << change_column(table_name, new_column)
      @down << change_column(table_name, old_column)
    end
    
    def rename_column_up(table_name, old_name, new_name)
      @up << rename_column(table_name, old_name, new_name)
      @down << rename_column(table_name, new_name, old_name)
    end
    
    def add_column_up(table_name, column)
      @up << add_column(table_name, column)
      @down << remove_column(table_name, column.name)
    end
    
    def remove_column_up(table_name, column)
      @up << remove_column(table_name, column.name)
      @down << add_column(table_name, column)
    end
    
    def column(column)
      col = " #{column.name.inspect}, #{column.type.inspect}"
      col << ", :limit => #{column.limit}" if !column.limit.nil?
      col << ", :default => #{column.default.inspect}" if !column.default.nil?
      col << ", :null => false" if !column.null
      col << "\n"
    end
    
    def add_table(table)
      tbl = StringIO.new
      tbl.print "    create_table #{table.name.inspect}"
      tbl.print %Q(, :primary_key => "#{table.options[:primary_key]}") if table.options[:primary_key]
      tbl.print ", :id => true " if table.options[:id]
      tbl.print ", :force => true " if table.options[:force]
      tbl.puts " do |t|"
      table.columns.each do |column|
        tbl.print "      t.column" + column(column)
      end
      tbl.puts "    end"
      tbl.puts
      tbl.rewind
      tbl.read
    end
    
    def drop_table(table_name)
      %Q|    drop_table("#{table_name}")\n|
    end
    
    def add_column(table_name, column)
      %Q|    add_column("#{table_name}",| + column(column)
    end
    
    def change_column(table_name, column)
      %Q|    change_column("#{table_name}",| + column(column)
    end
    
    def rename_column(table_name, old_name, new_name)
      %Q|    rename_column("#{table_name}", "#{old_name}", "#{new_name}")\n|
    end
    
    def remove_column(table_name, column_name)
      %Q|    remove_column("#{table_name}", "#{column_name}")\n|
    end
    
    def add_index(index)
      out = "    add_index #{index.table_name.inspect}, #{index.column_names.inspect}, :name => #{index.name.inspect}"
      out << ", :unique => true" if index.unique
      out << "\n"
    end
    
    def remove_index(index)
      %Q|    remove_index(#{index.table_name.inspect}, #{index.name.inspect})\n|
    end
    
    def create_file
      if @up.empty?
        puts "There are no changes to your db structure that we currently handle"
        return @version - 1
      end
      # increment the schema_info version in the db
      schema_info_table_name = ActiveRecord::Base.table_name_prefix + "schema_info" + ActiveRecord::Base.table_name_suffix
      #ActiveRecord::Base.connection.update("UPDATE #{schema_info_table_name} SET version = #{@version}")
      filename = "db/migrate/#{pad(@version.to_s)}_version#{@version}.rb"
      File.open(filename, "w") do |file|
        header(file)
        up(file)
        down(file)
        trailer(file)
      end
      return @version
    end
    
    def header(file)
      file.puts "class Version#{@version} < ActiveRecord::Migration\n"
    end
    def up(file)
      file.puts "  def self.up\n"
      file.puts @up
      file.puts "  end\n"
    end
    def down(file)
      file.puts "  def self.down"
      file.puts @down
      file.puts "  end\n"
    end
    def trailer(file)
      file.puts "end"
    end
    
    def pad(string)
      while string.length < 3
        string = "0"+string
      end
      return string
    end
end
end

