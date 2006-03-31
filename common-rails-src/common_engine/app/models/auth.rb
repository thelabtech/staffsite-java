require 'digest/md5'
require 'base64'
	
class Auth < ActiveRecord::Base

	set_table_name 			"simplesecuritymanager_user"
	set_primary_key 		"userID"

	#Connect to user
	has_one :person, :foreign_key => 'fk_ssmUserID'
	
	attr_accessor :plain_password
	attr_accessible :username, :plain_password
	
	#Set validators
	validates_presence_of :username
	validates_confirmation_of :plain_password, :message => "should match confirmation"
	
	# Hash the password from user
	def before_create
		self.password = Auth.hash_password(self.plain_password)
		self.email = self.username
	end
	
	# Clear the plain password
	def after_create
		@plain_password = nil
	end
	
	# Return the Auth with the given name and
	# plain-text password
	def self.login(username, password)
		hashed_password = hash_password(password || "")
		find(:first,
				 :conditions => ["username = ? AND password = ?",
				 								  username, hashed_password])
	end
	
	# Log in if the name and password (after hashing)
	# match the database.
	def try_to_login
		Auth.login(self.username, self.plain_password)
	end
	
	def unique_auth?
		not Auth.find(:first, :conditions => ["username = ?", self.username])
	end
	
	def update_password(new_password)
	   self.password = Auth.hash_password(new_password)
	   save!
	end
	
	private
	# Define password hash
	def self.hash_password(password)
		md5_password = Digest::MD5.digest(password)
		Base64.encode64(md5_password).chomp
	end	
end