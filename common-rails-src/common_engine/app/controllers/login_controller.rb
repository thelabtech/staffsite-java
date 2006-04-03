class LoginController < ApplicationController
  require 'open-uri'
  require 'rexml/document'
  require 'digest/md5'
  include REXML
  
  def boom
  	raise "boom"
  end

  def index
  	if session[:user_id]
      redirect_to(:action => 'index', :controller => 'person' )
  	else
      redirect_to(:action => 'login')
  	end
  end

  def login
    if request.get?
      session[:user_id] = nil
      @auth = User.new
  	else
      @auth = User.new(params[:auth])
      logged_in_auth = @auth.try_to_login
	  if logged_in_auth
        session[:user_id] = logged_in_auth.id
  		jumpto = session[:jumpto] || { :action => "show", :controller => "person" }
        session[:jumpto] = nil
    	redirect_to(jumpto)
  	  else
	  	flash[:notice] = "Invalid user/password combination"
  		render(:action => 'login')
      end
  	end
  end
  
  def logout
  	session[:user_id] = nil
 	redirect_to(:action => 'index', :controller => 'login')
  end

  def add_user
	if request.get?
      @auth = User.new
	else  	
      @auth = User.new(params[:auth])
	  if not @auth.unique_auth? then
	  	flash[:notice] = "That email address is already in our system. Please try to sign in."
	  	render(:layout=>false, :action => 'login')
      else  	
	    if @auth.save
          redirect_to(:action => 'index', :controller => 'person')
	  	end
	  end
    end
  end
  
  def send_password_email
    # make sure we have a (valid) email address
    email = params[:email]
    if (email && email.match('^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$'))
      # look for this email address in our user table
      get_user_hash(email)
      if @hash        
        link = url_for(:controller => 'login', :action => 'reset_password_get_user',
                       :only_path => false)
        link += '?user='+@hash.to_s
        # send the email
        email = AccountMailer.create_forgot_password(link, @auth.username)
        email.set_content_type("text/html")
        AccountMailer.deliver(email)
        render(:action => 'password_email_sent')
        return
      else
        flash[:notice] = "That email address does not correspond to a user account."
      end
    else
      flash[:notice] = "Please provide a real email address."
    end
    render(:action => 'forgot_password')
  end
  
  def reset_password_get_user
    # get the user hash from the url
    @user = params[:user]
    if (!@user || @user.strip == '')
      # we don't really know what to do if they didn't provide a user
      redirect_to(:action => 'reset_password')
    end
  end
  
  def reset_password_get_password
    #make sure we have an email address and the user_hash
    @email = params[:email]
    @user_hash = params[:user_hash]
    if (!@email || @email.strip == '')
      flash[:notice] = 'Please enter your email address';
      redirect_to(:action => 'reset_password_get_user', :user => @user_hash)
      return
    end
    if (!@user_hash || @user_hash.strip == '')
      flash[:notice] = 'Please go back and click on the link from your email again.'
      # we don't really know what to do if they didn't provide a user
      redirect_to(:action => 'reset_password')
      return
    end
    # make sure the user matches
    get_user_hash(@email)
    if (@user_hash != @hash)
      flash[:notice] = 'That email address doesn\'t match the one the email was sent to. Please try again'
      redirect_to(:action => 'reset_password_get_user', :user => @user_hash)
      return
    end
    # if we get here they have the right user/user_hash. Display the template
  end
  
  def change_password
    # make sure someone didn't hack the form
    @user_hash = params[:user_hash]
    if (params[:auth]) 
	    @email = params[:auth][:username]
	    plain_password = params[:auth][:plain_password]
	    confirm_password = params[:auth][:plain_password_confirmation]
	else
		@email = nil
	end
    if (@user_hash && @user_hash!='' && @email)
      get_user_hash(@email)
      if (!@auth)
        redirect_to(:action => 'reset_password')
        return
      end
      # check the passwords
      if (plain_password and plain_password.strip != '' and plain_password == confirm_password)
        # change the password
        @auth.update_password(plain_password)
        #@auth.save!
      else
        flash[:notice] = "Passwords don't match. Please try again."
        render(:action => "reset_password_get_password")
        return
      end
    else
      flash[:notice] = "Something din't work. Try again."
      redirect_to(:action => :reset_password_get_password, :email => @email, :user_hash => @user_hash)
    end
  end
  
  def get_user_hash(email)
    @auth = User.find(:first, :conditions => ["username = ?", email])
    if (@auth)
      @hash = Digest::MD5.hexdigest(@auth.username + @auth.userID.to_s)
    else
      @hash = nil
    end
  end
    
  def get_campuses
  	@campus_options = <<EOF
<select id="campus" name="campus" tabindex="8">
	<option value="" selected="selected">Choose Campus</option> 
EOF
		#If we have a state, populate the drop-down
  	@state = request.raw_post || request.query_string || ''
		if @state
	  	url = "http://staff.campuscrusadeforchrist.com/servlet/CRSRegister?action=campusLocate&searchtext=" + @state
	  	@f = open(url)
	  	@doc = Document.new(@f.read)
	  	@doc.each_element('//campus') do |campus|
	  		@campus_options += "\n\t<option value=\"#{campus.attributes['name']}\">#{campus.attributes['name']} (#{campus.attributes['city']})</option>"
	  	end
	  end
  	@campus_options += "\n</select>"
  end
  
  def ajax_campuses
  	get_campuses
  	render(:text => @campus_options)
  	#render(:text => @state)
  end

end
