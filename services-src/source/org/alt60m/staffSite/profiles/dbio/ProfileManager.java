package org.alt60m.staffSite.profiles.dbio;

//import org.alt60m.security.CAS.CASUser;
import java.util.Collection;

import org.alt60m.cas.CASUser;
import org.alt60m.ministry.model.dbio.OldAddress;
import org.alt60m.ministry.model.dbio.Staff;
import org.alt60m.security.dbio.manager.SecurityManager;
import org.alt60m.security.dbio.manager.SecurityManagerException;
import org.alt60m.security.dbio.manager.SecurityManagerFailedException;
import org.alt60m.security.dbio.manager.SimpleSecurityManager;
import org.alt60m.security.dbio.manager.UserLockedOutException;
import org.alt60m.security.dbio.manager.UserNotFoundException;
import org.alt60m.security.dbio.manager.UserNotVerifiedException;
import org.alt60m.security.dbio.model.User;
import org.alt60m.staffSite.bean.dbio.UserPreferences;
import org.alt60m.staffSite.model.dbio.StaffSiteProfile;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
/**
 * @stereotype tested
 * @testcase <{TestProfileManager}>
 */
public class ProfileManager {
	private static Log log = LogFactory.getLog(ProfileManager.class);

    public ProfileManager() { //String secantAdminUserName, String secantAdminPassword) throws ProfileManagementException {
            _securityMan = new SimpleSecurityManager();// org.alt60m.factory.ServiceFactory.getSimpleSecurityManager(); //new org.alt60m.security.manager.SimpleSecurityManager();//org.alt60m.security.manager.TransitionalSecurityManager(secantAdminUserName, secantAdminPassword);
    }

//    public static void main(String[] args) throws Exception {
//        ProfileManager pMan = new ProfileManager("","");
//
//        if(args[0].equalsIgnoreCase("-authenticate")) {
//			String result = pMan.authenticate(args[1], args[2]);
//			System.out.println("Authenticate: " + result);
//
//        } else if(args[0].equalsIgnoreCase("-create")) {
//            ProfileValues pVals = new ProfileValues();
//            pVals.isStaff = false;
//			pVals.firstName= args[1];
//			pVals.lastName = args[2];
//            pVals.userName = args[3];
//			pVals.password =args[4] ;
//			pVals.verifyPassword=args[4];
//
//            StringBuffer profileID = new StringBuffer();
//            StringBuffer errors = new StringBuffer();
//
//			boolean result = pMan.createProfile(pVals, profileID, errors);
//
//            if(result=true) {
//				System.out.println("Create new account.");
//				System.out.println("  ProfileID: "+profileID);
//				System.out.println("  errors: "+errors);
//            } else {
//				System.out.println("Failed!");
//				System.out.println("  errors: "+errors);
//            }
//
//        }
//
//    }

    /** Handle requests for authentication from the Staff Controller. Returns the profile ID if successful... */
    public String authenticate(String userName, String password) throws ProfileNotFoundException,
        MultipleProfilesFoundException, NotAuthorizedException, ProfileManagementException, UserLockedOutException {
            boolean secantAuthorized = false;
            // first, try connecting to Secant's security
            try {
				log.debug("userName="+userName+", password="+password.length());
                secantAuthorized = _securityMan.authenticate(userName, password);
				log.debug("authorized="+secantAuthorized);
            } catch (UserNotFoundException err) {
                throw new ProfileNotFoundException(err.toString());
			} catch (UserLockedOutException err) {
				throw err;
            } catch (Exception err) {
                throw new ProfileManagementException(err.toString());
            }
            if (!secantAuthorized) {
                throw new NotAuthorizedException();
            } else {
            	
//*****  NEW SSO CODE  
            	return getProfile(userName).getStaffSiteProfileID();
            }
    }  
//*****  END NEW SSO CODE */
            	
/*****  OLD CODE TO DELETE  *****
              try {
                    // if successful, continue for 2nd check (profile info)
//                    String query = "select obj from org.alt60m.staffSite.model.StaffSiteProfile as obj where obj.userName = $1";
//                    System.out.println("OQL: " + query);
	                StaffSiteProfile ssp = new StaffSiteProfile();
	                ssp.setUserName(userName);
                    Collection profiles = ObjectHashUtil.list(ssp.selectList());// _profileAdaptor.listWithParams(query, new Object[] {userName});
                    if (profiles.size() == 0) {
                        throw new ProfileNotFoundException();
                    } else if (profiles.size() > 1) {
                        throw new MultipleProfilesFoundException();
                    } else {
                        Hashtable profileHash = (Hashtable)profiles.iterator().next();
                        return (String)profileHash.get("StaffSiteProfileID");
                    }
                } catch (Exception e) {
                    throw new ProfileManagementException();
                }
            }
    }
/*****  END OLD CODE TO DELETE  *****/
    
    
    public void changePassword(String userName, String oldPassword, String newPassword) throws
        ProfileNotFoundException, ProfileManagementException, NotAuthorizedException {

        changePassword(userName, oldPassword, newPassword, false);

    }

    /** Change password */
    public void changePassword(String userName, String oldPassword, String newPassword, boolean changeFlag) throws
        ProfileNotFoundException, ProfileManagementException, NotAuthorizedException {
            try {
				log.debug("call sec manager: changePassword");
                _securityMan.changePassword(userName, oldPassword, newPassword);
				
				log.debug("turn off change password flag");
				setPasswordChangeFlag(userName, false);
			} catch(UserLockedOutException uloe) {
                throw new NotAuthorizedException();
            } catch(org.alt60m.security.dbio.manager.NotAuthorizedException nae) {
                throw new NotAuthorizedException();
            } catch (UserNotFoundException unfe) {
                throw new ProfileNotFoundException();
            } catch (SecurityManagerFailedException sme) {
                throw new ProfileManagementException(sme.toString());
            }
    }

	public void resetPassword(String userName, String newPassword) throws ProfileNotFoundException,ProfileManagementException {
		resetPassword(userName, newPassword, false);
    }

    public void resetPassword(String userName, String newPassword, boolean flagForPasswordChange) throws ProfileNotFoundException,
        ProfileManagementException {
            try {
                _securityMan.resetPassword(userName, newPassword);

                if(flagForPasswordChange)
				    setPasswordChangeFlag(userName, flagForPasswordChange);

            } catch (UserNotFoundException unfe) {
                throw new ProfileNotFoundException("Username: '" + userName + "' was not found.");
            } catch (SecurityManagerFailedException smfe) {
                throw new ProfileManagementException(smfe.toString());
            }
    }

    private void setPasswordChangeFlag(String userName, boolean flag) { // throws ProfileNotFoundException, ProfileManagementException {
		// Set the password change flag...

//		try
//		{
//			org.alt60m.staffSite.StaffSiteBroker ssb = org.alt60m.factory.ServiceFactory.getStaffSiteBroker();
//			ssb.begin();
		StaffSiteProfile spo = new StaffSiteProfile();
		spo.setUserName(userName);
		if(spo.select())
		{
			spo.setChangePassword(flag);
			spo.persist();
		}
//		} catch (.ObjectNotFoundException onfe) {
//			throw new ProfileNotFoundException("ProfileID '" + userName + "' was not found.");
//		} catch (Exception e) {
//			throw new ProfileManagementException(e.toString());
//		}

//		ProfileValues profile = getProfile(userName);
//		profile.changePassword = flag;
//		updateProfile(profile);
    }

    public void setCaptureHRinfoFlag(String userName, boolean flag) { // throws ProfileNotFoundException, ProfileManagementException {
		// Set the capture hr info flag...

		StaffSiteProfile spo = new StaffSiteProfile();
		spo.setUserName(userName);
		if(spo.select())
		{
			spo.setCaptureHRinfo(flag);
			spo.persist();
		}
    }

    
    public String[] listUsers() throws ProfileManagementException {
        try {
            return _securityMan.listUsers();
        } catch (SecurityManagerFailedException sme) {
            throw new ProfileManagementException(sme.toString());
        }
    }

    public String[] listUsers(String likeString) throws ProfileManagementException {
        try {
            return _securityMan.listUsers(likeString);
        } catch (SecurityManagerFailedException sme) {
            throw new ProfileManagementException(sme.toString());
        }
    }

    public String[] listStaffSiteUsers() throws ProfileManagementException {
        try {
            return _securityMan.listStaffSiteUsers();
        } catch (SecurityManagerFailedException sme) {
            throw new ProfileManagementException(sme.toString());
        }
    }

    public void deleteProfile(String username) throws ProfileManagementException, ProfileNotFoundException {


        try {

            // Delete from Secant
            _securityMan.removeUser(username);

            // Remove profile
            getProfile(username).delete();
//            _profileAdaptor.delete(profile.profileID);

        } catch (UserNotFoundException unfe) {
            throw new ProfileNotFoundException("Username: '" + username + "' was not found.  Couldn't delete.");
        } catch (Exception e) {
            throw new ProfileManagementException(e.toString());
        }
    }

    /** Hashtable input */
    public void updateProfile(StaffSiteProfile profile) throws ProfileNotFoundException, ProfileManagementException {
        if ("".equals(profile.getStaffSiteProfileID())) {
            throw new ProfileNotFoundException("ProfileID was null.");
        } else {
            try {
//            	StaffSiteProfile oldProfile = new StaffSiteProfile(profile.getStaffSiteProfileID());
//            	profile.setFk_ssmUserId(oldProfile.getFk_ssmUserId());
	            profile.persist();
            } catch (Exception e) {
                throw new ProfileManagementException(e.toString());
            }
        }
    }

    /**
     * @param username
     * @return The StaffSiteProfile with the given username 
     * @throws ProfileNotFoundException
     * @throws ProfileManagementException
     * @throws MultipleProfilesFoundException
     */
    public static StaffSiteProfile getProfile(String username) throws ProfileNotFoundException, ProfileManagementException, MultipleProfilesFoundException {
        Collection profiles = null;
        try {
	        StaffSiteProfile ssp = new StaffSiteProfile();
	        ssp.setUserName(username);
            profiles = ssp.selectList(); //_profileAdaptor.listWithParams(query, new Object[] {userName});
            if (profiles.size() == 0) {
                throw new ProfileNotFoundException("Profile with username '" + username + "' was not found.");
            }
            else if (profiles.size() > 1) {
                throw new MultipleProfilesFoundException("Multiple profiles with username '" + username + "' were found.");
            }
        } catch (ProfileNotFoundException e) {
        	throw e;
        } catch (MultipleProfilesFoundException e) {
        	throw e;
        } catch (Exception e) {
            if (!(e instanceof ProfileNotFoundException) && !(e instanceof MultipleProfilesFoundException)) {
                throw new ProfileManagementException(e.toString());
            }
        }

        return (StaffSiteProfile)profiles.iterator().next();
    }

    

    /** Returns new profile id */
    public boolean createProfile(StaffSiteProfile profile, String password, String verifyPassword, StringBuffer profileID, StringBuffer validationErrors) throws ProfileAlreadyExistsException,
        ProfileManagementException, InvalidAccountNumberException {
            String newProfileID = "";

            // No longer force user name to lower case; SSO allows upper case, so we will too
            //profile.setUserName(profile.getUserName().toLowerCase());
            // Make sure that everything follows the rules...
            validationErrors.append(validateUserNamePassword(profile.getFirstName(), profile.getLastName(), profile.getUserName(), password, verifyPassword));
            // Validation failed!
            if (validationErrors.length() != 0) {
                return false;
            }
            // Passed validation
            try {
//                String query = "select obj from org.alt60m.staffSite.model.StaffSiteProfile as obj where obj.userName = $1";
	            StaffSiteProfile ssp = new StaffSiteProfile();
	            ssp.setUserName(profile.getUserName());
                Collection profiles = ssp.selectList(); // _profileAdaptor.listWithParams(query, new Object[] {profile.getUserName()} );
                if (profiles.size() > 0) {
                    throw new org.alt60m.staffSite.profiles.dbio.ProfileAlreadyExistsException("Username '" + profile.getUserName() + "' already exists.");
                } else {
                	User ssmUser = null;
                    // Create an security account, if none exsist
                    if(!_securityMan.userExists(profile.getUserName())) {
                        ssmUser = _securityMan.createUser(profile.getUserName(), password);
                    } else {   //Reset the password if the account already exsists.
                        ssmUser = _securityMan.resetPassword(profile.getUserName(), password);
                    }

                    
//                    profile.setFk_ssmUserId(ssmUser.getUserID());
	                profile.persist();
                    newProfileID = profile.getStaffSiteProfileID();
                    //client.commit();
                    // Is staff and has valid account no
                    // create default prefs
                    if (!"".equals(profile.getAccountNo())) {
	                    Staff s= new Staff(profile.getAccountNo());
	                    if(!s.select()){
	                    	throw new InvalidAccountNumberException();
	                    }
                    } else {
                    	throw new InvalidAccountNumberException();
                    }
                    if (profile.getIsStaff() && !profile.getAccountNo().equals("")) {
                        addDefaultStaffPrefs(newProfileID, profile.getAccountNo());
                    }
                }
            } catch (org.alt60m.staffSite.profiles.dbio.ProfileAlreadyExistsException e) {
                throw e;
            } catch (InvalidAccountNumberException e) {
                throw e;
            } catch (Exception e) {
                e.printStackTrace();
                throw new ProfileManagementException(e.toString());
            }
            profileID.append(newProfileID);
            return true;
    }

    private void addDefaultStaffPrefs(String profileID, String accountNo) throws Exception {
        try {

//			MinistryBroker mb = org.alt60m.factory.ServiceFactory.getMinistryBroker();
//            mb.begin();
			Staff staff = new Staff(accountNo); // (Staff) mb.getObject(Staff.class, accountNo);
            //StaffObject staff = hmStaff.findByPrimaryKey(new StaffKey(accountNo));
			OldAddress address = staff.getPrimaryAddress();
            String zipCode = address.getZip();
//			mb.rollback();
            //client.rollback();
            // Can it be parsed?
            try {
                Integer.parseInt(zipCode);
            } catch (Exception e) {
                zipCode = "NO";
            }
            // Is it five characters?
            if (zipCode.length() != 5)
                zipCode = "NO";
            UserPreferences preferences = new UserPreferences();
            preferences.savePreference(profileID, "ZIPCODE", "Zip Code", zipCode);
        }
        catch (Exception e) {
           //try { client.rollback(); } catch (Exception ignore) { };
            throw e;
        }
    }

    /** Verify that the values are supplied */
    public String validateUserNamePassword(String firstName, String lastName, String userName, String password,
        String verifyPassword) {
		String errorMsg = new String();

		// ERROR CHECKING ------------------------------------------------------------
		//error checking should be done by the CAS server
//		if (firstName == null) {
//		errorMsg += "You must supply a FirstName name.<br>";
//		}
//		else if (firstName.trim().equals("")) {
//		errorMsg += "You must supply a FirstName name.<br>";
//		}
//		else if ((firstName.trim()).length() < 2) {
//		errorMsg += "FirstName name must be at least 2 characters long.<br>";
//		}
//		if (lastName == null) {
//		errorMsg += "You must supply a LastName name.<br>";
//		}
//		else if (lastName.trim().equals("")) {
//		errorMsg += "You must supply a LastName name.<br>";
//		}
//		else if ((lastName.trim()).length() < 2) {
//		errorMsg += "LastName name must be at least 2 characters long.<br>";
//		}
		if (userName == null) {
		errorMsg += "You must supply a Username.<br>";
		}
		else if (userName.trim().equals("")) {
		errorMsg += "You must supply a Username.<br>";
		}
		else if ((userName.trim()).length() < 5) {
		errorMsg += "Username must be at least 5 characters long.<br>";
		}
		//We don't require firstname.lastname usernames anymore
		//if ((userName.indexOf(".")) == -1) {
		//errorMsg += "Username must be of format: firstname.lastname.<br>";
		//}
		if (password == null) {
		errorMsg += "You must supply a Password.<br>";
		}
		else if (password.equals("")) {
		errorMsg += "You must supply a Password.<br>";
		}
		if (password.length() < 4) {
		errorMsg += "Password must be at least 4 characters long.<br>";
		}
		if (password.length() > 14) {
		errorMsg += "Password must be at most 14 characters long.<br>";
		}
		if (!verifyPassword.equals(password)) {
		errorMsg += "Passwords do not match.<br>";
		}
		
		return errorMsg;
    }

    SecurityManager _securityMan;

	/**
	 * @param username
	 * @param guid
	 * @return
	 * @throws MultipleProfilesFoundException
	 * @throws ProfileManagementException
	 * @throws ProfileNotFoundException
	 * @throws UserNotFoundException
	 */
	public String authorize(CASUser user)
			throws ProfileNotFoundException, ProfileManagementException,
			MultipleProfilesFoundException, UserNotFoundException,
			UserNotVerifiedException {
		
		User ssmUser;
		try {
			ssmUser = _securityMan.checkUser(user);
		}
		catch (SecurityManagerFailedException e)
		{
			e.printStackTrace();
			throw new ProfileManagementException("Unable to authorize");
		}
		// Get profile
		StaffSiteProfile ssp = getProfile(user.getUsername());
		if (ssp.getAccountNo()!= null && 
				user.getAcctNo() != null &&
				!ssp.getAccountNo().equals(user.getAcctNo()))
		{
			//TODO: may need to update person record; if they didn't use to be
			//staff, but are now, or such.
			ssp.setAccountNo(user.getAcctNo());
			ssp.setIsStaff(!user.getAcctNo().equals(""));
			ssp.persist();
		}
		ssmUser.hadSuccessfulLogin();
		ssmUser.persist();
		return ssp.getStaffSiteProfileID();
	}

    /**
     * @link
     * @shapeType PatternLink
     * @pattern TestCase
     * @clientRole tested
     * @supplierRole tests
     * @hidden 
     */
    /*# private TestProfileManager _testProfileManager; */

    /**
     * @link
     * @shapeType PatternLink
     * @pattern TestCase
     * @clientRole tested
     * @supplierRole tests
     * @hidden 
     */
    /*# private TestProfileManager _testProfileManager1; */
}
