class Person < ActiveRecord::Base
	
	set_table_name			"ministry_Person"
	set_primary_key 		"personID"
	
	belongs_to :user, :foreign_key => "fk_ssmUserId"  #Link it to SSM

	has_many :personal_links
	has_many :pictures
	has_and_belongs_to_many :friends, :uniq => true, :join_table => "am_friends_people"
	has_and_belongs_to_many :groups, :uniq => true, :join_table => "am_groups_people"
	
    has_many :personal_messages
    has_many :group_messages
    has_many :sent_personal_messages
					 
	attr_accessible :firstName, :lastName, :middleName, :preferredName,
					:fk_ssmUserId, :personID,
					:universityState, :campus, :region,
					:greekAffiliation, 
					:major, :minor, :occupation,
					:yearInSchool, :graduationDate,
					:maritalStatus, :numberChildren,
					:birthDate, :dateBecameChristian,
					:bio, :blogfeed,
					:home_city, :home_state, :home_zip,
					:image
	attr_accessor	:school
	attr_reader		:nickname
		
	file_column     :image, :fix_file_extensions => true, 
					:magick => { :size => '400x400!', :crop => '1:1',
		                :versions => {
			                :mini   => {:crop => '1:1', :size => "50x50!"},
			                :thumb  => {:crop => '1:1', :size => "100x100!"},
			                :medium => {:crop => '1:1', :size => "200x200!"}
	                	}
	                }
	                
  validates_file_format_of :image, :in => ["image/jpeg", "image/gif"]    
  # validates_filesize_of :image, :in => 0..2.megabytes
  
      
  def validate_blogfeed
    errors.add(:blogfeed, "is invalid") if invalid_feed?
  end
  
  def empty_feed?
    if blogfeed
      blogfeed.strip.empty?
    else
      true
    end
  end
  
  def invalid_feed?
    unless empty_feed?
      FeedTools::Feed.open(blogfeed)
    end   
  rescue FeedTools::FeedAccessError
    flash[:notice] = "Invalid feed" if @my_entry
  rescue
    if @my_entry and not empty_feed? then
      flash[:notice] = "Not well formed XML"
    end
  end
  
								
  def informal_name
  	pref_name = read_attribute("preferredName")
  	if pref_name and not pref_name.strip.empty? then
  	  pref_name
  	else
  	  read_attribute("firstName")
  	end
  end
								
  def informal_name=(name)		
  	write_attribute("preferredName", name)
  end
	
  def initialize
  	if @person.preferredName then
	    if (@person.preferredName > "") then
	   	  @nickname = @person.preferredName
	    else
	   	  @nickname = @person.firstName
	    end
	  else
		  @nickname = @person.firstName
	  end
  end
end