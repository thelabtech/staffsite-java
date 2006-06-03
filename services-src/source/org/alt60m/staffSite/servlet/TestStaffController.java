package org.alt60m.staffSite.servlet;

import java.util.*;
import javax.servlet.http.*;
import javax.servlet.*;
import org.alt60m.servlet.*;
import org.alt60m.ministry.servlet.StaffInfo;
import org.alt60m.ministry.model.dbio.*;

import org.apache.log4j.*;
import org.alt60m.util.*;
import org.alt60m.staffSite.bean.dbio.*;
import org.alt60m.staffSite.profiles.dbio.*;
import org.alt60m.staffSite.model.dbio.*;

/**
 * Staff Controller
 *		5/14/01 - Refactored to Controller2 by MDP
 *
 * @author Mat Weiss
 *
 */
public class TestStaffController extends Controller {

	final String MAPPING_FOLDER = "/WEB-INF/mapping";
	final String VIEWS_FILE = "/WEB-INF/staffDBIOviews.xml";
	final String USERS_FILE = "/WEB-INF/staffusers.xml";
	final String Log4JConfig_FILE = "/WEB-INF/classes/Log4JConfig.xml";

	final String MAIL_HOST = "mail";
	final String MAIL_DOMAIN = "uscm.org";
	final String MAIL_SUFFIX = "@uscm.org";

	final String PREF_NAME_CACHED_EMAIL_PASSWORD = "cachedEmailPassword";
	final String PREF_NAME_CACHED_PS_PASSWORD = "cachedPSPassword";
	final String PREF_NAME_CACHED_PS_USERNAME = "cachedPSUsername";
	final String PREF_NAME_ENABLE_EMAIL_SSO = "enableEmailSSO";
	final String PREF_NAME_ENABLE_PS_SSO = "enablePSSSO";

	final String PREF_ENABLE_SSO_YES = "Yes";
	final String PREF_ENABLE_SSO_NO = "No";
	final String PREF_ENABLE_SSO_KEEP_ASKING = "Ask";

	final String DEFAULT_ACTION = "authenticate";

	final String EMAIL_ATTEMPTS_SESSION_CNT = "email_attempts_session_ctr";
	final int	 MAX_EMAIL_ATTEMPTS = 3;

	ProfileManager _profileManager;
	UserPreferences _preferences;
	EncryptedPreferences _encryptedPreferences;

	private Hashtable usersRoles = new Hashtable();

	public void init(ServletConfig config) throws ServletException {

		super.init(config);
		try{
			setLog4JConfigFile(getServletContext().getRealPath(Log4JConfig_FILE));
			log.debug("StaffController: Starting Init");

            String servicesConfigPath = getServletContext().getRealPath(MAPPING_FOLDER);
			if (servicesConfigPath!=null && servicesConfigPath.length()>0) {
				log.debug("The ServicesConfigPath used is: " + servicesConfigPath);
				org.alt60m.servlet.ObjectMapping.setConfigPath(servicesConfigPath);
			} else {
				log.debug("No ServicesConfigPath was specified.");
			}

			_profileManager = new ProfileManager();
			_preferences = new UserPreferences();
			_encryptedPreferences = new EncryptedPreferences();

			setViewsFile(getServletContext().getRealPath(VIEWS_FILE));
			setDefaultAction(DEFAULT_ACTION);

			initUsers(false);

			log.debug("init() completed.  Ready for action.");
		} catch (Exception e) {
			log.fatal("init() failed", e);
		}
	}

	private void initUsers(boolean verbose) {
		usersRoles = UsersProcessor.parse(getServletContext().getRealPath(USERS_FILE));

		if (verbose) {
			for (Enumeration e = usersRoles.keys(); e.hasMoreElements();) {
				String k = (String) e.nextElement();
				log.debug(k + " " + usersRoles.get(k));
			}
			log.debug("finished loading users.");
		}
	}

	/**
	 * Action: Reload
	 *
	 */
	public void reload(ActionContext ctx) {
		HttpServletRequest req = ctx.getRequest();
		Enumeration headerNames = req.getHeaderNames();

		while(headerNames.hasMoreElements()) {
			String key = (String) headerNames.nextElement();
			System.out.println(key+ "=" + req.getHeader(key));
		}

		try {
//		initViews(true);
			initUsers(true);
        } catch (Exception e) {
			e.printStackTrace();
        }
	}
	/**
	 * Action: enterSite
	 *
	 */
	public void enterSite(ActionContext ctx) {
		// ??
	}

	protected void actionInvoked(String action, ActionContext ctx) {
		ServletLogging sl = (ServletLogging) getServletContext().getAttribute("StaffSiteServletLogging");
		if (sl==null) {
			sl = new ServletLogging();
			getServletContext().setAttribute("StaffSiteServletLogging", sl);
		}

		Hashtable profile = ctx.getProfile();
		if (profile != null) {
			sl.addEvent("StaffController", (String)profile.get("UserName"), action);
		}
	}

	public void showUsage(ActionContext ctx) {
		try {
			ServletLogging sl = (ServletLogging) getServletContext().getAttribute("StaffSiteServletLogging");
			ActionResults results = new ActionResults();

			if (sl!=null) {

				if (ctx.getInputString("includeseconds", false) != null) {
					results.addCollection("usage",
						sl.getSummary( Long.parseLong(ctx.getInputString("includeseconds")) )
					);
				} else {
					results.addCollection("usage", sl.getSummary());
				}
				ctx.setReturnValue(results);
			}

			ctx.goToView("usageReport");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Action: logIn
	 *
	 */
	public void logIn(ActionContext ctx) {
		log(ctx.getRequest().getRequestURI()+" ** " +ctx.getRequest().getQueryString());
		ctx.goToView("login");
	}

	/**
	 * Action: authenticate
	 *
	 */
	public void authenticate(ActionContext ctx) {

		String userName = new String();
		String password = new String();

		try {

			//userName = ctx.getInputString("UserName", true).toLowerCase() + MAIL_SUFFIX;
			//password = ctx.getInputString("Password", true);
			userName = "testing.login@uscm.org";
			password = "12345";

			// Authenticate based on credentials
			log.debug("username: "+userName);
			log.debug("password: "+password);
			String profileId = _profileManager.authenticate(userName, password);

			// Load profile
			Hashtable profileHash = ObjectHashUtil.obj2hash(new StaffSiteProfile(profileId));
			Staff staff = new Staff((String)profileHash.get("AccountNo"));
			if (staff!=null) {
				String region = staff.getRegion();
				if (region!=null) {
					profileHash.put("region",region);
				} else {
					profileHash.put("region", "");
				}
			} else {
				profileHash.put("region", "");
			}
			
			log.debug("Profile: " + profileHash);

			ctx.setSessionValue("loggedIn", profileId);
			ctx.setSessionValue("profile", profileHash);
			ctx.setSessionValue("userName", userName);

			//profile information in here.........................
			ctx.setSessionValue("zipCode", getPreference(profileId, "ZIPCODE", "NO"));
			ctx.setSessionValue("boxStyle", getPreference(profileId, "BOXSTYLE", "rounded"));
			ctx.setSessionValue("homePageArticlesToDisplay", getPreference(profileId, "HOMEPAGEARTICLESTODISPLAY", "3"));
			ctx.setSessionValue("campusOnly", getPreference(profileId, "OCCASIONSCAMPUSONLY", "true"));
			ctx.setSessionValue("weatherType", getPreference(profileId, "WEATHERTYPE", "today"));
			//ctx.setSessionValue("regionalNews", getPreference(profileId, "REGIONALNEWS", "Yes"));

			ctx.setSessionValue("accountNo", profileHash.get("AccountNo"));

			// -----------------------------------
			boolean isHR = false;

			try {
				boolean isStaff = ((Boolean) profileHash.get("IsStaff")).booleanValue();
				String accountNo = (String) profileHash.get("AccountNo");

				if(isStaff) {
					StaffInfo si = new StaffInfo();
					isHR = si.isHumanResources(accountNo);
				}
			} catch (Exception e) {
				isHR = false;
				log.error("Couldn't determine if HR.  Setting to false.", e);
			}

			ctx.setSessionValue("isHR", String.valueOf(isHR));
			// -----------------------------------


			//set cookie stuff in here.........................
			Cookie mainCookie = new Cookie("UserName",userName);

			int maxage = 60*60*24*30;  // one month
			mainCookie.setMaxAge(maxage);

			String requestedURL = (String) ctx.getSessionValue("onLogInGoto");
			ctx.getSession().removeAttribute("onLogInGoto");
			log("!!!!"+requestedURL);

			ctx.getResponse().addCookie(mainCookie);
			boolean changePassword = ((Boolean)profileHash.get("ChangePassword")).booleanValue();
			if(changePassword){
				Hashtable tub = new Hashtable();
				tub.put("firstLogin","true");
				tub.put("userName",userName);
				tub.put("ErrorMsg","");
				tub.put("ResultMsg","");
				ctx.setSessionValue("passwordChange",tub);
				ctx.goToView("userChangePassword");
			} else if(requestedURL!=null) {
				log("Going to : " + requestedURL);
				ctx.goToURL(requestedURL);
			} else {
				ctx.goToView("testhome");
			}

		} catch (ProfileNotFoundException pnfe) {
			// set a message needed for more help
			log.debug("Profile not found: " + userName);
            ctx.setSessionValue("ErrorCode", "noprofile");
			ctx.goToView("loginError");
		} catch (MultipleProfilesFoundException mpfe) {
			log.error("Multiple accounts found: " + userName);
            ctx.setSessionValue("ErrorCode", "multipleprofiles");
			ctx.goToView("loginError");
		} catch (NotAuthorizedException nae) {
			log.debug("Not authorized: " + userName);
			ctx.setSessionValue("ErrorCode", "notauthorized");
			ctx.goToView("loginError");
		} catch (ProfileManagementException pme) {
			pme.printStackTrace();
			log.error("Couldn't authenticate: " + userName + " do to service problems.", pme);
			ctx.setSessionValue("ErrorCode", "unknown");
			ctx.goToView("loginError");
		} catch (Exception e) {
			e.printStackTrace();
			log.error("Unknown login error", e);
			ctx.setSessionValue("ErrorCode", "unknown");
			ctx.goToView("loginError");
		}

	}

	/**
	 * Action: showOccasions
	 *
	 */
	public void showOccasions(ActionContext ctx) {
		ctx.goToView("occasions");
	}

	/**
	 * Action: showCustomize
	 *
	 */
	public void showCustomize(ActionContext ctx) {
		ctx.goToView("customize");
	}

	/**
	 * Action: Customize
	 *
	 */
	public void Customize(ActionContext ctx) {
//		String accountNo = (String) ctx.getProfile().get("AccountNo");
		//String zipCode = ctx.getInputString("zipCode");
		//String weatherType = ctx.getInputString("weatherType");
		String homePageArticlesToDisplay = ctx.getInputString("homePageArticlesToDisplay");
		String campusOnly = ctx.getInputString("campusOnly");
		String boxStyle = ctx.getInputString("boxStyle");
		String regionalNews = ctx.getInputString("regionalNews");
		log("The value for regional news is .................................."+regionalNews);

		try {
			//setPreference(ctx.getProfileID(), "ZIPCODE", "Zip Code", zipCode);
			//ctx.setSessionValue("zipCode", zipCode);
			//setPreference(ctx.getProfileID(), "WEATHERTYPE", "Weather Type to Display for Home Page", weatherType);
			//ctx.setSessionValue("weatherType", weatherType);
			setPreference(ctx.getProfileID(), "HOMEPAGEARTICLESTODISPLAY", "Number of LX Articles to Display on Home Page", homePageArticlesToDisplay);
			ctx.setSessionValue("homePageArticlesToDisplay", homePageArticlesToDisplay);
			setPreference(ctx.getProfileID(), "OCCASIONSCAMPUSONLY", "Display Campus People Only for Birthdays, Anniv., ...", campusOnly);
			ctx.setSessionValue("campusOnly", campusOnly);
			setPreference(ctx.getProfileID(), "BOXSTYLE", "How themed box beans should be displayed", boxStyle);
			ctx.setSessionValue("boxStyle", boxStyle);
			//setPreference(ctx.getProfileID(), "REGIONALNEWS", "Whether or not to display regional articles", regionalNews);
			//ctx.setSessionValue("regionalNews", regionalNews);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		ctx.goToView("home");
	}

	/**
	 * Action: AddUser
	 *
	 */
	public void AddUser(ActionContext ctx) {
		//administration of users accounts in system
		Hashtable tub = new Hashtable();
		String Option = ctx.getInputString("Option");
		String ErrorMsg = "";
		String ResultMsg = "";

		if (Option==null){
			Option = "None";
			ErrorMsg = ErrorMsg + "Nothing Happened.<br>";
			//Add, View, Create, Update, Delete
		}

		//////  CREATE NEW USER ACCOUNT  //////////////
		else if (Option.equals("Create")){
			// ERROR CHECKING ------------------------------------------------------------
			if (ctx.getInputString("FirstName")==null){
				ErrorMsg = ErrorMsg + "You must supply a FirstName name.<br>";
			}
			else if (ctx.getInputString("FirstName").trim().equals("")){
				ErrorMsg = ErrorMsg + "You must supply a FirstName name.<br>";
			}
			else if ((ctx.getInputString("FirstName").trim()).length()<2){
				ErrorMsg = ErrorMsg + "FirstName name must be at least 2 characters long.<br>";
			}
			if (ctx.getInputString("LastName")==null){
				ErrorMsg = ErrorMsg + "You must supply a LastName name.<br>";
			}
			else if (ctx.getInputString("LastName").trim().equals("")){
				ErrorMsg = ErrorMsg + "You must supply a LastName name.<br>";
			}
			else if ((ctx.getInputString("LastName").trim()).length()<2){
				ErrorMsg = ErrorMsg + "LastName name must be at least 2 characters long.<br>";
			}
			if (ctx.getInputString("UserName")==null){
				ErrorMsg = ErrorMsg + "You must supply a Username.<br>";
			}
			else if (ctx.getInputString("UserName").trim().equals("")){
				ErrorMsg = ErrorMsg + "You must supply a Username.<br>";
			}
			else if ((ctx.getInputString("UserName").trim()).length()<5){
				ErrorMsg = ErrorMsg + "Username must be at least 5 characters long.<br>";
			}
			if ((ctx.getInputString("UserName").indexOf("."))==-1){
				ErrorMsg = ErrorMsg + "Username must be of format: firstname.lastname.<br>";
			}
			String Passwd = ctx.getInputString("Passwd");
			String Vpasswd = ctx.getInputString("Vpasswd");
			if (Passwd==null){
				ErrorMsg = ErrorMsg + "You must supply a Password.<br>";
			}
			else if (Passwd.equals("")){
				ErrorMsg = ErrorMsg + "You must supply a Password.<br>";
			}
			if (Passwd.length()<4){
				ErrorMsg = ErrorMsg + "Password must be at least 4 characters long.<br>";
			}
			if (Passwd.length()>14){
				ErrorMsg = ErrorMsg + "Password must be at most 14 characters long.<br>";
			}
			if (!Vpasswd.equals(Passwd)){
				ErrorMsg = ErrorMsg + "Passwords do not match.<br>";
			}

			// PASSED ALL THE INPUT ERROR CHECKING
			if (ErrorMsg.equals("")){
				try {

                    StringBuffer id = new StringBuffer();
                    StringBuffer errs = new StringBuffer();

					StaffSiteProfile ssp = new StaffSiteProfile();

			        ssp.setFirstName(ctx.getInputString("FirstName", true));
		            ssp.setLastName(ctx.getInputString("LastName", true));
		            ssp.setUserName(ctx.getInputString("UserName", true) + MAIL_SUFFIX);
		            String pw = ctx.getInputString("Passwd", true);
		            String pwVerify = ctx.getInputString("Vpasswd", true);
		            ssp.setAccountNo(ctx.getInputString("AccountNo", true));
					ssp.setIsStaff((ctx.getInputString("IsStaff") != null && (ctx.getInputString("IsStaff")).equalsIgnoreCase("true")));
					//ssp.setIsStudent((ctx.getInputString("IsStudent") != null && (ctx.getInputString("IsStudent")).equalsIgnoreCase("true")));
					ssp.setChangePassword((ctx.getInputString("ChangePassword") != null && (ctx.getInputString("ChangePassword")).equalsIgnoreCase("true")));

	                _profileManager.createProfile(ssp, pw, pwVerify, id, errs);
					tub.put("ID", id.toString());
					ResultMsg = ResultMsg + "User Account Created.<br>";
				} catch (ProfileAlreadyExistsException e) {
					ErrorMsg += e.getMessage();
				} catch (Exception e){
					ErrorMsg +=  "There was an error creating the user account!<br>";
					log.error("Error connecting to secant!:" + e);
				}

			}

			tub.put("FirstName", ctx.getInputString("FirstName"));
			tub.put("LastName", ctx.getInputString("LastName"));
			tub.put("AccountNo", ctx.getInputString("AccountNo"));
			tub.put("UserName", ctx.getInputString("UserName") + MAIL_SUFFIX);
			if (ctx.getInputString("ChangePassword")!=null) {
				tub.put("ChangePassword", (ctx.getInputString("ChangePassword") != null &&
		                (ctx.getInputString("ChangePassword")).equalsIgnoreCase("true")) ? "Y" : "");
			}
			if (ctx.getInputString("IsStaff")!=null) {
				tub.put("IsStaff", (ctx.getInputString("IsStaff") != null &&
						(ctx.getInputString("IsStaff")).equalsIgnoreCase("true")) ? "Y" : "");
			}
			/*
			if (ctx.getInputString("IsStudent")!=null) {
				tub.put("IsStudent", (ctx.getInputString("IsStudent") != null &&
						(ctx.getInputString("IsStudent")).equalsIgnoreCase("true")) ? "Y" : "");
			}*/
			tub.put("Option", "Update");

		}

		//////////////////////////////////////////////////////
		else if (Option.equals("Add")){
			tub.put("Option", "");
			tub.put("UserName", "firstname.lastname@uscm.org");
		}

        //////////////////////////////////////////////////////
		 else if (Option.equals("View")){
			try {
				String userName = ctx.getInputString("UserName").toLowerCase();

				StaffSiteProfile profile = _profileManager.getProfile(userName);
				tub.put("ID", profile.getStaffSiteProfileID());
				tub.put("UserName", profile.getUserName());
				tub.put("FirstName", profile.getFirstName());
				tub.put("LastName", profile.getLastName());
				tub.put("AccountNo", profile.getAccountNo());
				tub.put("ChangePassword", profile.getChangePassword() ? "Y" : "");
				tub.put("IsStaff", profile.getIsStaff() ? "Y" : "");
				//tub.put("IsStudent", profile.getIsStudent() ? "Y" : "");

				tub.put("Option", "Update");

			} catch (Exception e) {
				ErrorMsg = "Failed to list...";
			}
		}

        //////////////////////////////////////////////////////
		else if (Option.equals("Update")){

            try {
				String userName = ctx.getInputString("UserName").toLowerCase() + MAIL_SUFFIX;

//                ProfileValues input = new ProfileValues();
	            StaffSiteProfile input = new StaffSiteProfile();
                input.setStaffSiteProfileID(ctx.getInputString("ID"));
		        input.setFirstName(ctx.getInputString("FirstName"));
	            input.setLastName(ctx.getInputString("LastName"));
	            input.setUserName(ctx.getInputString("UserName") + MAIL_SUFFIX);
	            input.setAccountNo(ctx.getInputString("AccountNo"));
				input.setIsStaff((ctx.getInputString("IsStaff") != null && (ctx.getInputString("IsStaff")).equalsIgnoreCase("true")));
				//input.setIsStudent((ctx.getInputString("IsStudent") != null && (ctx.getInputString("IsStudent")).equalsIgnoreCase("true")));
	            input.setChangePassword((ctx.getInputString("ChangePassword") != null && (ctx.getInputString("ChangePassword")).equalsIgnoreCase("true")));

//	            String pw = ctx.getInputString("Password");
//	            String pwVerify = ctx.getInputString("VPassword");

				// Perform update
				_profileManager.updateProfile(input);

                // Get updated values
                StaffSiteProfile profile = _profileManager.getProfile(userName);

				tub.put("ID", profile.getStaffSiteProfileID());
				tub.put("UserName", profile.getUserName());
				tub.put("FirstName", profile.getFirstName());
				tub.put("LastName", profile.getLastName());
				tub.put("AccountNo", profile.getAccountNo());
				if(profile.getChangePassword())
                    tub.put("ChangePassword", "Y");
				if(profile.getIsStaff())
					tub.put("IsStaff", "Y");
				//if(profile.getIsStudent())
				//	tub.put("IsStudent", "Y");

				tub.put("Option", ctx.getInputString("Option"));
            } catch (Exception e) {
                e.printStackTrace();
            }

		}

		//////////////////////////////////////////////////////
		else if (Option.equals("Delete")){
            String userName = ctx.getInputString("UserName").toLowerCase() + MAIL_SUFFIX;

			try{
                _profileManager.deleteProfile(userName);
			}
			catch (Exception e){
				log.error("Could not create user" + e);
			}
			ResultMsg = ResultMsg + "User Account Deleted.<br>";
			tub.put("UserName", ctx.getInputString("UserName") + MAIL_SUFFIX);
		}

		tub.put("ErrorMsg", ErrorMsg);
		tub.put("ResultMsg", ResultMsg);

		ctx.setSessionValue("tub",tub);
		ctx.goToView("addUser");
	}

	/**
	 * Action: changePassword
	 *
	 */
	public void changePassword(ActionContext ctx)  {
		Hashtable tub = new Hashtable();
		String ErrorMsg = "";
		String ResultMsg = "";

		if (ctx.getInputString("UserName")!=null) {

			String userName = ctx.getInputString("UserName").toLowerCase();
			if (userName.indexOf("@uscm.org")==-1) {
				userName += MAIL_SUFFIX;
			}
			//Client client = new Client();

			if (ctx.getInputString("view").equals("userChangePassword")) {	//user wants to change their password

				String oPasswd = ctx.getInputString("OPassword");
				String passwd = ctx.getInputString("Password");
				String nPasswd = ctx.getInputString("VPassword");
				boolean changeFlag = (ctx.getInputString("ChangePassword") != null) && (ctx.getInputString("ChangePassword").equalsIgnoreCase("true"));

				//error check the passwords
				if (passwd.length()<5)
                    ErrorMsg = ErrorMsg + "Your new password must be a minimum of 5 characters.<br>";
				else if (!passwd.equals(nPasswd))
                    ErrorMsg = ErrorMsg + "New passwords do not match.<br>";
				else if (oPasswd.equals(passwd))
                    ErrorMsg = ErrorMsg + "Your temporary password and desired password must be different.<br>";
				else {
					try {
						_profileManager.changePassword(userName, oPasswd, nPasswd,changeFlag);
						ResultMsg += "The password for " + userName + " has been changed<br>";

					} catch (NotAuthorizedException e) {
			            ErrorMsg += "You entered your old password incorrectly.<br>";
					} catch (Exception e) {
                        log.debug("Nope", e);
						e.printStackTrace();
						ErrorMsg += "The password change was not successful.  This may not be the last time you will have to change your password.<br>";
	                }
                }
			}


        }

		// If their profile was marked with a change password flag, set the first login flag ??
		boolean mustChange = ((Boolean) ( ctx.getProfile().get("ChangePassword") )).booleanValue();
		tub.put("firstLogin",String.valueOf(mustChange));

		tub.put("userName",(String) ctx.getProfile().get("UserName"));
		tub.put("ErrorMsg",ErrorMsg);
		tub.put("ResultMsg",ResultMsg);

		ctx.setSessionValue("passwordChange",tub);
		ctx.goToView("userChangePassword");

    }
	/**
	 * Action: resetPassword
	 *	Notes: because the password is stored separately from the user info, we can delete
	 *			and recreate the secant user account without affecting the user profile
	 */
	public void resetPassword(ActionContext ctx) throws javax.transaction.SystemException{
		Hashtable tub = new Hashtable();
		String ErrorMsg = "";
		String ResultMsg = "";

		if (ctx.getInputString("UserName")!=null) {
			String userName = ctx.getInputString("UserName").toLowerCase();
//We are going to requre the full username, to allow for usernames that are not email addresses.

			String password = ctx.getInputString("Password");
			boolean flag = (ctx.getInputString("Flag") != null && ctx.getInputString("Flag").equalsIgnoreCase("true"));

			try {
				_profileManager.resetPassword(userName, password, flag);
				ResultMsg = "Password changed successfully!";

				if(flag==true) {
					ResultMsg += "Your password must be changed upon next login.<br>";
				}

			} catch (Exception e){
				log.error("Could not reset password: " + e);
				ErrorMsg += "Could not reset password: " + e.getMessage();
				ErrorMsg += "<P> Please notify Alt60M about this error and the UserName that gave the error.";
			}

		} else{
			ErrorMsg = ErrorMsg + " No user name given!<br>";
		}

		tub.put("userName",(String) ctx.getProfile().get("UserName"));
		tub.put("ErrorMsg",ErrorMsg);
		tub.put("ResultMsg",ResultMsg);
		ctx.setSessionValue("passwordChange",tub);

		if (ctx.getInputString("view").equals("sec")) {
			ctx.goToView("adminChangePassword");
		} else{
			ctx.goToView("userChangePassword");
		}
	}


	/**
	 * Action: listUsers
	 *
	 */
	public void listUsers(ActionContext ctx) {
		Hashtable tub = new Hashtable();
		String[] users = null;
		String ErrorMsg = "";
		String username;
		String key;
		try {

			users = _profileManager.listStaffSiteUsers(); //.listUsers("@uscm.org");
			int len = users.length;
			tub.put("numOfUsers",String.valueOf(len));
			for (int i = 0; i<len; i++) {
				username = users[i];
				tub.put(String.valueOf(i),username);
				key = "name" + String.valueOf(i);
				tub.put(key, username.substring(0, username.indexOf("@uscm.org")));
			}

		}
		catch (Exception e) {
			ErrorMsg = "Error retreiving user list!";
		}

		tub.put("ErrorMsg", ErrorMsg);

		ctx.setSessionValue("tub",tub);
		ctx.goToView("listUsers");
	}
	/**
	 * Action: showTools
	 *
	 */
	public void showTools(ActionContext ctx) {
		try {
			ActionResults results = new ActionResults();

			results.putValue("isHR", (String)ctx.getSessionValue("isHR"));

			ctx.setReturnValue(results);
			ctx.goToView("tools");

		} catch (Exception e) {
			if(ctx.getSessionValue("isHR") == null) {
				ctx.goToURL("/Error.jsp?Reason=Timeout");
			}
			log.error("Failed to perform showTools", e);
		}

	}
	/**
	 * Action: showUserAdmin
	 *
	 */
	public void showUserAdmin(ActionContext ctx) {
		Hashtable tub = new Hashtable();
		ctx.setSessionValue("passwordChange",tub);
		ctx.goToView("userAdmin");
	}

	/**
	 * Action: showHome
	 *
	 */
	public void showHome(ActionContext ctx) {
		ctx.goToView("home");
	}

	/**
	 * Action: showMPD
	 *
	 */
	public void showMPD(ActionContext ctx) {
		try {
			ActionResults results = new ActionResults();

			results.putValue("balance", getPreference(ctx.getProfileID(), "CURRENT_BALANCE", "N/A"));

			ctx.setReturnValue(results);
			ctx.goToView("mpd");

		} catch (Exception e) {
			if(ctx.getProfileID() == null) {
				ctx.goToURL("/Error.jsp?Reason=Timeout");
			}
			log.error("Failed to perform loginStaffWeb", e);
		}

	}


	/**
	 * Action: loginStaffWeb
	 *
	 */
	public void loginStaffWeb(ActionContext ctx) {

		try {
			ActionResults results = new ActionResults();

//			String view = "";
			boolean isStaff = ((Boolean) ( ctx.getProfile().get("IsStaff") )).booleanValue();
			log.debug("Staff: " + isStaff);

			if (isStaff) {
				results.putValue("mode", "staff");
				results.putValue("username", "cccstaff");
				results.putValue("password", "vonette");
				String staffwebpath = ctx.getInputString("staffwebpath");
				if (staffwebpath!=null) {
					if (staffwebpath.equals("Reimbursements")) {
						results.putValue("staffwebpath", "ss/pages/EFormFrame.html?MainFrame=../servlet/ReimbServlet");
					} else if (staffwebpath.equals("ReimbursementAdvances")) {
						results.putValue("staffwebpath", "ss/pages/EFormFrame.html?MainFrame=../servlet/ReimbAdvServlet");
					} else if (staffwebpath.equals("AdditionalSalaryRequest")) {
						results.putValue("staffwebpath", "ss/pages/EFormFrame.html?MainFrame=../servlet/AsrServlet");
					} else if (staffwebpath.equals("SalaryCalc2002Servlet")) {
						results.putValue("staffwebpath", "ss/pages/EFormFrame.html?MainFrame=../servlet/SalaryCalc2002Servlet");
					} else {
						results.putValue("staffwebpath", staffwebpath);
					}
				}
				else {
					results.putValue("staffwebpath", "");
				}
			} else {

				log("notStaff...");
				// Not staff
				results.putValue("mode", "nonstaff");
				ctx.setReturnValue(results);
				ctx.goToView("errorStaffWeb");

			}

			ctx.setReturnValue(results);
			ctx.goToView("loginStaffWeb");
		} catch (Exception e) {
			log.error("Failed to perform loginStaffWeb", e);
		}

	}


	/**
	 * Action: loginStaffResources
	 *
	 */
	public void loginStaffResources(ActionContext ctx) {

		try {
			ActionResults results = new ActionResults();

//			String view = "";
			boolean isStaff = ((Boolean) ( ctx.getProfile().get("IsStaff") )).booleanValue();
			log.debug("Staff: " + isStaff);

			if (isStaff) {
				results.putValue("mode", "staff");
				results.putValue("username", "cccstaff");
				results.putValue("password", "vonette");
				if (ctx.getInputString("staffwebpath")!=null) {
					results.putValue("staffwebpath", ctx.getInputString("staffwebpath"));
				}
				else {
					results.putValue("staffwebpath", "");
				}
			} else {

				log("notStaff...");
				// Not staff
				results.putValue("mode", "nonstaff");
				ctx.setReturnValue(results);
				ctx.goToView("errorStaffResources");

			}

			ctx.setReturnValue(results);
			ctx.goToView("loginStaffResources");
		} catch (Exception e) {
			log.error("Failed to perform loginStaffResources", e);
		}

	}


	/**
	 * Action: loginPS
	 *
	 */
	public void loginPS(ActionContext ctx) {

		final String[] sections = new String[] {"PFormFrame", "servlet/SaiServlet", "servlet/ReimbServlet", "servlet/ReimbAdvServlet", "servlet/AsrServlet", "servlet/SalaryCalcServlet"};

		try {
			ActionResults results = new ActionResults();

			boolean isStaff = ((Boolean) ( ctx.getProfile().get("IsStaff") )).booleanValue();
			String section = ctx.getInputString("section", sections);

			String view = "";
			String password = getEncryptedPreference(ctx.getProfileID(), PREF_NAME_CACHED_PS_PASSWORD);
			String enableSSO = getPreference(ctx.getProfileID(), PREF_NAME_ENABLE_PS_SSO, PREF_ENABLE_SSO_YES);
			String accountNo = getPreference(ctx.getProfileID(), PREF_NAME_CACHED_PS_USERNAME);

			if(!isStaff) {

				log("notStaff...");
				// Not staff
				results.putValue("mode", "nonstaff");
				view = "errorPS";

			} else if(!enableSSO.equals(PREF_ENABLE_SSO_NO) && !isNullOrEmpty(password) && !isNullOrEmpty(accountNo)) {
				// Haven't selected to ignore SSO and password is non-null
				// They are staff. Go for it
				log("Haven't selected to ignore SSO and password is non-null");
				results.putValue("section", section);
				results.putValue("username", "cccstaff");
				results.putValue("password", "vonette");

				results.putValue("psaccountno", accountNo);
				results.putValue("pspassword", password);
				view = "loginPS";

			} else if (!enableSSO.equals(PREF_ENABLE_SSO_NO) && isNullOrEmpty(password)) {
				// If haven't selected to ignore SSO, and password is null...
				log("If haven't selected to ignore SSO, and password is null...");
				view = "setupPS";
			} else if (enableSSO.equals(PREF_ENABLE_SSO_NO)) {
				view = " ";

				results.putValue("section", section);
				results.putValue("username", "cccstaff");
				results.putValue("password", "vonette");
								

			} else {
				// Who knows?
				results.putValue("mode", "unknown");
				view = "errorPS";
			}

			ctx.setReturnValue(results);
			ctx.goToView(view);

		} catch (Exception e) {
			log.error("Failed to perform loginPS", e);
		}

	}

	public void showSetupPS(ActionContext ctx) {
		try {

			ActionResults results = new ActionResults("showSetupPS");

			boolean isStaff = ((Boolean) ( ctx.getProfile().get("IsStaff") )).booleanValue();
			String defaultUsername = getPreference(ctx.getProfileID(), PREF_NAME_CACHED_PS_USERNAME, "");
			String view;

			if (!isStaff) {
				// Not staff

				results.putValue("mode", "nonstaff");
				view = "errorPS";

			} else {

				results.putValue("mode", "initialsetup");
				results.putValue("accountno", defaultUsername);
				view = "setupPS";
			}

			ctx.setReturnValue(results);
			ctx.goToView(view);

		}
		catch (Exception e) {
		}

	}
	public void managePS(ActionContext ctx) {
		try {

			ActionResults results = new ActionResults("managePS");

			boolean isStaff = ((Boolean) ( ctx.getProfile().get("IsStaff") )).booleanValue();
			String defaultUsername = getPreference(ctx.getProfileID(), PREF_NAME_CACHED_PS_USERNAME, "");
			String view;

			if (!isStaff) {
				// Not staff

				results.putValue("mode", "nonstaff");
				view = "errorPS";

			} else {

				results.putValue("mode", "initialsetup");
				results.putValue("accountno", defaultUsername);
				view = "managePS";
			}

			ctx.setReturnValue(results);
			ctx.goToView(view);

		}
		catch (Exception e) {
		}

	}
	public void showSetupEmail(ActionContext ctx) {
		try {

			ActionResults results = new ActionResults("showSetupEmail");

			if (getIntSessionValue(ctx, EMAIL_ATTEMPTS_SESSION_CNT) >= MAX_EMAIL_ATTEMPTS) {
				results.putValue("mode", "toomanyattempts");
				ctx.setReturnValue(results);
				ctx.goToView("errorEmail");
			} else {
				results.putValue("mode", "initialsetup");
				ctx.setReturnValue(results);
				ctx.goToView("setupEmail");
			}

		}
		catch (Exception e) {
		}

	}
	/**
	 * Action: setupPS
	 *
	 */
	public void setupPS(ActionContext ctx) {

		try {

			//String accountNo = (String) ctx.getProfile().get("AccountNo");
			String enableSSO = ctx.getInputString("SSOAction", new String[] {"Yes", "No", "Ignore"});

			ActionResults results = new ActionResults();

			if (enableSSO.equals("Yes")) {

				String psAccountNo = ctx.getInputString("accountno", true);
				String psPassword = ctx.getInputString("password", true);

				setPreference(ctx.getProfileID(), PREF_NAME_ENABLE_PS_SSO,  "", PREF_ENABLE_SSO_YES);
				setPreference(ctx.getProfileID(), PREF_NAME_CACHED_PS_USERNAME, "", psAccountNo);

				setEncryptedPreference(ctx.getProfileID(), PREF_NAME_CACHED_PS_PASSWORD, psPassword);

				results.putValue("section", "SaiServlet");
				results.putValue("username", "cccstaff");
				results.putValue("password", "vonette");
				results.putValue("psaccountno", psAccountNo);
				results.putValue("pspassword", psPassword);

				ctx.setReturnValue(results);
				ctx.goToView("loginPS");
			} else if (enableSSO.equals("No")) {
				setPreference(ctx.getProfileID(), PREF_NAME_ENABLE_PS_SSO, "", PREF_ENABLE_SSO_KEEP_ASKING);
				results.putValue("username", "cccstaff");
				results.putValue("password", "vonette");

				ctx.setReturnValue(results);
				ctx.goToView("loginPS");

			} else { // Ignore

				setPreference(ctx.getProfileID(), PREF_NAME_ENABLE_PS_SSO, "", PREF_ENABLE_SSO_NO);

				results.putValue("username", "cccstaff");
				results.putValue("password", "vonette");

				ctx.setReturnValue(results);
				ctx.goToView("loginPS");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * Action: setupEmail
	 *
	 */
	public void setupEmail(ActionContext ctx) {
		try {

			String email = (String) ((Hashtable) ctx.getSessionValue("profile")).get("Email");
			String enableSSO = ctx.getInputString("SSOAction", new String[] {"Yes", "No", "Ignore"});

			ActionResults results = new ActionResults();
			// If this email string contains *@uscm.org
			//if (email.indexOf("@"+MAIL_DOMAIN) > 0) {
			//}

			String username = email.substring(0, email.indexOf("@"+MAIL_DOMAIN));

			if (enableSSO.equals("Yes")) {
				String password = ctx.getInputString("password", true);

				//int attempts = getIntSessionValue(ctx.getSession(), EMAIL_ATTEMPTS_SESSION_CNT);
				//log("attempt counter: " + attempts);


				// Does this password work?
				if (verifyEmailPassword(username, password)) {

					setEncryptedPreference(ctx.getProfileID(), PREF_NAME_CACHED_EMAIL_PASSWORD, password);
					setPreference(ctx.getProfileID(), PREF_NAME_ENABLE_EMAIL_SSO, "", PREF_ENABLE_SSO_YES);

					results.putValue("username", username);
					results.putValue("password", password);

					ctx.setReturnValue(results);
					ctx.goToView("loginEmail");
				//
				} else {
					if ( incrementIntSessionValue(ctx, EMAIL_ATTEMPTS_SESSION_CNT) >= MAX_EMAIL_ATTEMPTS ) {
						results.putValue("mode", "toomanyattempts");
						ctx.setReturnValue(results);
						ctx.goToView("errorEmail");
					} else {
						results.putValue("mode", "badpassword");
						ctx.setReturnValue(results);
						ctx.goToView("setupEmail");
					}
				}

			} else if (enableSSO.equals("No")) {

				setPreference(ctx.getProfileID(), PREF_NAME_ENABLE_EMAIL_SSO, "", PREF_ENABLE_SSO_KEEP_ASKING);
				// Just go to exchange anyway (without logging in automatically)
				results.putValue("username", username);

				ctx.setReturnValue(results);
				ctx.goToView("loginEmail");

			} else { // Ignore

				setPreference(ctx.getProfileID(), PREF_NAME_ENABLE_EMAIL_SSO, "", PREF_ENABLE_SSO_NO);

				results.putValue("username", username);
				ctx.setReturnValue(results);
				ctx.goToView("loginEmail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//_prefAdaptor.list
	}

	/**
	 * Action: loginEmail
	 *
	 */
	public void loginEmail(ActionContext ctx) {

//		boolean validLogin = false;
		String goToView = "";

		ActionResults results = new ActionResults();

		try {
			// First, do they have a valid 'uscm.org' email address
			String email = (String) ((Hashtable) ctx.getSessionValue("profile")).get("Email");

			log.debug("email: "+email);

			// If this email string contains *@uscm.org
			if (email.indexOf("@"+MAIL_DOMAIN) > 0) {

				//Does a cached password exist?
				String password = getEncryptedPreference(ctx.getProfileID(), PREF_NAME_CACHED_EMAIL_PASSWORD);
				String username = email.substring(0, email.indexOf("@"+MAIL_DOMAIN));

				boolean enableSSO = !(
					getPreference(ctx.getProfileID(), PREF_NAME_ENABLE_EMAIL_SSO, PREF_ENABLE_SSO_KEEP_ASKING).equalsIgnoreCase(PREF_ENABLE_SSO_NO)
				);

				log.debug("enableSSO: " + enableSSO);
				log.debug(getPreference(ctx.getProfileID(), PREF_NAME_ENABLE_EMAIL_SSO)); // != "False");
				// Yes, has cached password and sso enabled
				if ((password != null) && (enableSSO != false)) {

					log.debug("username: "+username);

					// is password still valid?
					if (verifyEmailPassword(username, password))
					{
						log.debug("verified password");

						results.putValue("mode", "login");
						results.putValue("username", username);
						results.putValue("password", password);

						goToView = "loginEmail";

					// password not valid
					} else {
						results.putValue("mode", "updatepassword");
						goToView = "setupEmail";
					}

				// No, no cached password
				} else {
					log.debug("no cached password or sso disabled");
					if (enableSSO) {
						results.putValue("mode", "initialsetup");
						goToView = "setupEmail";
					} else {
						results.putValue("mode", "login");
						results.putValue("username", username);
						goToView = "loginEmail";

					}
				}
			// No "uscm.org" type email address
			} else {
				results.putValue("mode", "update");
				results.putValue("problem", "email");
				goToView = "setupEmail";
			}

			ctx.setReturnValue(results);
			ctx.goToView(goToView);

		} catch (Exception e) {
			System.err.println("Profile:"+(Hashtable)ctx.getSessionValue("profile"));
			System.err.println("Session:"+ObjectHashUtil.obj2hash(ctx.getSession().toString()));
			System.err.println("Request:"+ObjectHashUtil.obj2hash(ctx.getRequest().toString()));
			e.printStackTrace();
		}

	}

	private String getEncryptedPreference(String profileID, String name) throws EncryptorException{

        StaffSitePref pref = _encryptedPreferences.getPreference(profileID, name);
        return (pref!=null) ? pref.getValue() : null;


        //return _prefEncryptor.decrypt(getPreference(profileID, name));
	}

	private void setEncryptedPreference(String profileID, String name, String cleartext) throws EncryptorException {

		_encryptedPreferences.savePreference(profileID, name, "", cleartext);

		//setPreference(profileID, name,"", _prefEncryptor.encrypt(cleartext));
		//_encryptedPreferences.savePreference(profileID, name, "", cleartext);
	}

	private boolean verifyEmailPassword(String username, String password) throws Exception{

		try
		{
			javax.mail.Session session = javax.mail.Session.getDefaultInstance(System.getProperties(), null);

			// Connect to host
			javax.mail.Store store = session.getStore("imap");
			store.connect(MAIL_HOST, -1, username, password);
			store.close();
			log.debug("SUCCESS Authentication: user:"+username);
			return true;
		} catch (javax.mail.AuthenticationFailedException authfailed) {
			// Catch wrong username/password type errors
			log.debug(authfailed.toString());
			log.debug("FAILED Authentication: user:"+username);
			return false;
		}
		// Propogate all other errors

	}


	private String getPreference(String profileID, String name) {
        //StaffSitePref pref = _preferences.getPreference(profileID, name);
        String value = _preferences.getPreferenceValue(profileID, name);
		return (value!=null) ? value : null;
	}

	private String getPreference(String profileID, String name, String defaultValue) {
		String prefValue = getPreference(profileID, name);
        return (prefValue!=null ? prefValue : defaultValue);
	}

	private void setPreference(String profileID, String name, String displayName, String value) {
        _preferences.savePreference(profileID, name, displayName, value);
	}

	private int getIntSessionValue(ActionContext ctx, String name) {

//		int value;
		String valueString = (String) ctx.getSessionValue(name);

		if (valueString == null)
			return 0;
		else
			return Integer.parseInt(valueString);
	}

	private int incrementIntSessionValue(ActionContext ctx, String name) {
		// Bump the failed attempt counter for this session
		int newValue = getIntSessionValue(ctx, name)+1;
		ctx.setSessionValue(name, Integer.toString(newValue));

		return newValue;
	}

	boolean isNullOrEmpty(String string) {
		return !( string != null && string.length()>0 );
	}


}
