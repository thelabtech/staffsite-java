package org.alt60m.security.dbio.manager;

import org.alt60m.cas.CASUser;
import org.alt60m.security.dbio.model.User;
import org.alt60m.staffSite.model.dbio.StaffSiteProfile;
import org.alt60m.staffSite.profiles.dbio.MultipleProfilesFoundException;
import org.alt60m.staffSite.profiles.dbio.ProfileManagementException;

public interface SecurityManager {
	/**
	 * changePassword
	 * 
	 */
	public void changePassword(String userName, String oldPassword, String newPassword)
		throws UserNotFoundException, UserLockedOutException, NotAuthorizedException, SecurityManagerFailedException;

	public boolean authenticate(String userName, String password) throws UserNotFoundException, UserLockedOutException, SecurityManagerFailedException;

	/**
	 * createUser
	 *		accountInfo should contain (at minimum):
	 *		"FirstName", "LastName", "AccountNo", and "Email" key/value pairs
	 */
	public User createUser(String userName, String password) 
		throws UserAlreadyExistsException, SecurityManagerFailedException;

   /**
    * listUsers
    */
	public String[] listUsers() throws SecurityManagerFailedException;
	public String[] listUsers(String likeString) throws SecurityManagerFailedException;
	public String[] listStaffSiteUsers() throws SecurityManagerFailedException;
	/**
	 * deleteUser
	 */
   public void removeUser(String userName) throws UserNotFoundException, SecurityManagerFailedException;

	/**
	 * resetPassword
	 */
	public User resetPassword(String userName, String newPassword) throws UserNotFoundException, SecurityManagerFailedException;

	public boolean userExists(String userName) throws SecurityManagerFailedException;


	/**
	 * @param user
	 * @return The (SecurityManager) User object associated with the given CASUser
	 * @throws UserNotFoundException
	 * @throws UserNotVerifiedException
	 * @throws ProfileManagementException 
	 * @throws MultipleProfilesFoundException 
	 */
	public User checkUser(CASUser user) throws UserNotFoundException, UserNotVerifiedException, SecurityManagerFailedException, SsmUserAlreadyExistsException, MultipleProfilesFoundException, ProfileManagementException;
	public User createProfile(CASUser user) throws SecurityManagerFailedException;
	//public User checkGCXCommunities(CASUser user) throws SecurityManagerFailedException, SsmUserAlreadyExistsException, UserNotVerifiedException, UserNotFoundException;
} 