package org.alt60m.accounts.servlet.dbio;

import java.io.IOException;
import java.util.*;
import java.util.regex.Pattern;

import org.alt60m.servlet.*;
import org.alt60m.staffSite.bean.PasswordValidator;
import org.alt60m.security.dbio.manager.*;
import org.alt60m.security.dbio.model.User;
import org.alt60m.util.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Priority;
import org.alt60m.crs.model.Conference;

public class AccountController extends org.alt60m.servlet.Controller {
	private static final String redirectPage = "/accounts/messagePage";


	protected static Log log = LogFactory.getLog(AccountController.class);
	

	private final String VIEWS_FILE = "/WEB-INF/accountviews.xml";
	private final String DEFAULT_ACTION = "goToPage";
	private Random randGen = new Random(System.currentTimeMillis());
	private final String GENERIC_FROM_ADDRESS = "help@campuscrusadeforchrist.com";
	private final long coefficient = 2125551212L;  // largest long integer is: 214 748 3647
	private SimpleSecurityManager manager = null;

	//constructor
	public AccountController() {
		manager = new SimpleSecurityManager();
	}

	// goes to the error page
	public void goToErrorPage(ActionContext ctx, String errorString) {
		try	{
			log.info("Error encountered: " + errorString);
			ctx.setSessionValue("ErrorString", errorString);
			ctx.goToView("error");
		}
		catch (Exception e) {
			log.error("An exception was caught during goToErrorPage",e);
		}
	}

	public void goToPage(ActionContext ctx) {
		ActionResults ar = new ActionResults();
		String page = ctx.getInputString("page");
		String url = ctx.getInputString("url");
		String loginPage = ctx.getInputString("loginPage");
		String destinationPage = ctx.getInputString("destinationPage");
		String username = ctx.getInputString("username");
		try	{
			if (loginPage == null || loginPage.equals("")) loginPage = "genericLogin";
			if (destinationPage == null || destinationPage.equals("")) destinationPage = "thankYouForLoggingIn";
			if (username == null) username = "";
			ar.putValue("loginPage", loginPage);
			ar.putValue("destinationPage", destinationPage);
			ar.putValue("username", username);
			ctx.setReturnValue(ar);
			if (url != null && !url.equals("")) 
				ctx.goToURL(url);
			else {
				if (page != null && !page.equals("")) {
					ctx.goToView(page);
				} else {
					log.warn("No url or page specified");
					ctx.goToErrorView();
				}
			}
		} catch (Exception e) {
			log.error(e, e);
		}
	}

	//	basic initialization stuff
	public void init() {
		super.setViewsFile(getServletContext().getRealPath(VIEWS_FILE));
		super.setDefaultAction(DEFAULT_ACTION);
	}

	public void reload() {
		super.setViewsFile(getServletContext().getRealPath(VIEWS_FILE));
		super.setDefaultAction(DEFAULT_ACTION);
	}

	/* Authenticate a SimpleSecurityManager user.
	   created 23 September 2002 by RDH (Based on code by TEM) */
	   
	//refactored to offer choices when email not validated. kb 12/18/02 
	   
	public void authenticate(ActionContext ctx) {
		ActionResults ar = new ActionResults("authenticate");
		String loginPage = ctx.getInputString("loginPage");
		String destinationPage = ctx.getInputString("destinationPage");
		String username = ctx.getInputString("username").toLowerCase();
		String password = ctx.getInputString("password");
		log.info("User " + username + " attempting loggin in via AccountController");
		log.info("password length: "+password.length());
		log.info("loginPage: "+loginPage);
		log.info("destinationPage: "+destinationPage);
		try {

			if (loginPage == null || loginPage.equals("")) loginPage = "genericLogin";
			if (destinationPage == null || destinationPage.equals("")) goToErrorPage(ctx, "No destination page was specified.");
			ctx.setSessionValue("loginPage",loginPage);
			ctx.setSessionValue("destinationPage",destinationPage);

			//first check username/password.
			if (!manager.authenticate(username, password)) {
				throw new NotAuthorizedException(); 
			}

			String userEmail = username;
			String userID = (new Integer(manager.getUserID(username))).toString();

			//now check if email has been validated			
			if (!checkEmail(username)) {
				ar.putValue("email", userEmail);
				ar.putValue("username", username);
				//send verification email - processes conference registrants who had not previously validated for SP tool
				try
				{
					User user = manager.getUserObject(Integer.valueOf(userID).intValue());
					if (isUserGeneric(ctx)) {
						sendGenericThankYouEmail(user.getUserID(), user.getUsername(), "<HIDDEN>", user.getPasswordQuestion(), user.getPasswordAnswer(), loginPage, ctx);
					}
					else {
						sendThankYouEmail(user.getUserID(), user.getUsername(), "<HIDDEN>", user.getPasswordQuestion(), user.getPasswordAnswer(), loginPage, ctx);
					}
				}
				catch(Exception e)
				{
					log.error(e, e);
					ar.putValue("errorMessage","There was a problem completing your request: "+e.getMessage());
					ctx.setReturnValue(ar);
					if(loginPage!=null)	
						ctx.goToURL(loginPage);
					else
						ctx.goToView("login");
				}
				//add our values to the session with the "Validate" prefix for later
				ctx.setSessionValue("ValidateUserID",userID);
				ctx.setSessionValue("ValidateUserEmail",userEmail);
				ctx.setSessionValue("ValidateUserLoggedIn",username);
				ctx.setSessionValue("ValidateLoginUrl",loginPage);
				ctx.setSessionValue("ValidateDestinationUrl",destinationPage);
				ctx.setReturnValue(ar);
				ctx.goToView("validateEmail");
				return; //return if email not validated.
			} 
			
			// user has been authenticated and is validated
			// so proceed.
			
			log.info("User "+username+" has successfully logged in.");
			ctx.setSessionValue("userLoggedIn", username);
			ctx.setSessionValue("userLoggedInSsm", userID);
			ctx.setSessionValue("userEmail", userEmail);
			ctx.setSessionValue("userID", userID);
			ctx.goToURL(destinationPage);
			
			
		} catch(UserNotFoundException e) {  
			log.info("user not found: " + e.getMessage());
			ar.putValue("errorMessage", e.getMessage());
			ctx.setReturnValue(ar);
			ctx.goToURL(loginPage);
		} catch(NotAuthorizedException e) {
			log.info("invalid password");
			ar.putValue("errorMessage", "Invalid Password.");
			ctx.setReturnValue(ar);
			ctx.goToURL(loginPage);
		} catch(UserLockedOutException e) {  
			log.info("user locked out: " + e.getMessage());
			ar.putValue("errorMessage", e.getMessage());
			ctx.setReturnValue(ar);
			ctx.goToURL(loginPage);
		} catch(org.alt60m.security.dbio.manager.SecurityManagerFailedException smfe) {
			log.error("Security Manager failed. Execution of AccountController.authenticate() aborted: "+smfe.getMessage(),smfe);
			goToErrorPage(ctx, "Authentication failed, because an internal error occured in the security manager during processing.");	
		} catch(org.alt60m.security.dbio.manager.SecurityManagerException sme) {
			ar.putValue("errorMessage", sme.getMessage());
			ctx.setReturnValue(ar);
			ctx.goToURL(loginPage);
		} catch(Exception e) {
			log.error("Failed to complete AccountController.authenticate()!",e);
			goToErrorPage(ctx, "Authentication failed, because an internal error occured during processing.");			
		}
	}

	
	/**
	 * added kb 12/18/2002
	 * posts the new email given by the person to validate.
	 * @param ctx
	 */
	public void postUpdateValidateEmail(ActionContext ctx)
	{
		ActionResults ar = new ActionResults();
		//first make sure we have a valid session and they previously provided credentials
		String userID = (String) ctx.getSessionValue("ValidateUserID");
		String loginPage = (String) ctx.getSessionValue("ValidateLoginUrl");
				
		if(userID==null)
		{
			ar.putValue("errorMessage","Please login.");
			ctx.setReturnValue(ar);
			if(loginPage!=null)	
				ctx.goToURL(loginPage);
			else
				ctx.goToView("login"); //should never happen.  :)
			return;  //send them back to the login page.
		}
		
		String newEmail = ctx.getInputString("newEmail");
		
		if( newEmail != null && !newEmail.equals("")) {
			try
			{
				User user = manager.updateUsername(Integer.valueOf(userID).intValue(),newEmail);
				if (isUserGeneric(ctx)) {
					sendGenericThankYouEmail(user.getUserID(), user.getUsername(), "<HIDDEN>", user.getPasswordQuestion(), user.getPasswordAnswer(), loginPage, ctx);
				} else {
					sendThankYouEmail(user.getUserID(), user.getUsername(), "<HIDDEN>", user.getPasswordQuestion(), user.getPasswordAnswer(), loginPage, ctx);
				}
			}
			catch(UserAlreadyExistsException e1) {
				ar.putValue("errorMessage","A username with the email address you entered already exists.  " +
						"If you need to verify your email address, log in below and then check your email for a verification email.  " +
						"If you forgot your password for that email address, please click the link below.");
				ctx.setReturnValue(ar);
				if(loginPage!=null)	
					ctx.goToURL(loginPage);
				else
					ctx.goToView("login"); //should never happen.  :)
				return;
			}
			catch(Exception e)
			{
				log.error(e, e);
				ar.putValue("errorMessage","There was a problem completing your request: "+e.getMessage());
				ctx.setReturnValue(ar);
				if(loginPage!=null)	
					ctx.goToURL(loginPage);
				else
					ctx.goToView("login"); //should never happen.  :)
				return;
			}
		}
		
		ar.putValue("errorMessage","Your email address has been updated and a verification email has been sent to the address you provided.  Please follow the instructions in the validation email.");
		ctx.setReturnValue(ar);
		ctx.goToURL(loginPage);
				
	}
	
	//added kb 12/19/2002
	/**
	 * sends the confirmation emailvalidate message to the user's email address
	 * @param ctx
	 */
	public void postResendMessage(ActionContext ctx)
	{
		
		ActionResults ar = new ActionResults();
		//first make sure we have a valid session and they previously provided credentials
		String userID = (String) ctx.getSessionValue("ValidateUserID");
		String loginPage = (String) ctx.getSessionValue("ValidateLoginUrl");
				
		if(userID==null)
		{
			ar.putValue("errorMessage","Please login.");
			ctx.setReturnValue(ar);
			if(loginPage!=null)	
				ctx.goToURL(loginPage);
			else
				ctx.goToView("login"); //should never happen.  :)
			return;  //send them back to the login page.
		}
		
		try
		{
			User user = manager.getUserObject(Integer.valueOf(userID).intValue());
			if (isUserGeneric(ctx)){
				sendGenericThankYouEmail(user.getUserID(), user.getUsername(), "<HIDDEN>", user.getPasswordQuestion(), user.getPasswordAnswer(), loginPage, ctx);
			} else {
				sendThankYouEmail(user.getUserID(), user.getUsername(), "<HIDDEN>", user.getPasswordQuestion(), user.getPasswordAnswer(), loginPage, ctx);
			}
		}
		catch(Exception e)
		{
			log.error(e, e);
			ar.putValue("errorMessage","There was a problem completing your request: "+e.getMessage());
			ctx.setReturnValue(ar);
			if(loginPage!=null)	
				ctx.goToURL(loginPage);
			else
				ctx.goToView("login"); //should never happen.  :)
		}
		
		ar.putValue("errorMessage","Your validation email has been sent.  Please go to your email box and follow the link in the email to validate your email address.  Thank you!");
		ctx.setReturnValue(ar);
		if(loginPage!=null)	
			ctx.goToURL(loginPage);
		else
			ctx.goToView("login"); //should never happen.  :)
		
	
	}


	/* Create a new SimpleSecurityManager user.
	   created 12 September 2002 by RDH (Based on code by TEM) */
	public void register(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults("createNewSSMUser");
			List<String> userErrors = new ArrayList<String>();
			String loginPage = ctx.getInputString("loginPage");
			String username = ctx.getInputString("username");
			String username2 = ctx.getInputString("usernameVerify");
			String registerUsername = ctx.getInputString("registerUsername"); 
			String password = ctx.getInputString("password");
			String passwordVerify = ctx.getInputString("passwordVerify");
			String passwordQuestion = ctx.getInputString("passwordQuestion");
			String passwordAnswer = ctx.getInputString("passwordAnswer");

			String sText = " reason:"; //sText=singular
			String pText = " reasons:"; //pText=plural
			String reasonText = ""; //text variable

			if (username != null && !username.equals(""))
				ar.putValue("username", username);
			else {
				userErrors.add("You did not specify a username.");
				username = "";
			}
			if (!username.equals(username2)) {
				userErrors.add("The usernames you entered did not match.");
			}
			
			log.debug("new username: " + username);
			String email = username;
			
			if (registerUsername.equals("false")) {				
				if (!Validate.validateEmail(email)) {
					userErrors.add("The email address you entered was not valid. Since your account registration is confirmed via email, we require a valid email address to send your feedback.");
				}
				try {
					javax.mail.internet.InternetAddress.parse(email);
					// in order to use parsing that more closely conforms to RFC822 rules, use the following instead
					// javax.mail.internet.InternetAddress.parse(email, true);
				}
				catch (javax.mail.internet.AddressException ae) {
					userErrors.add("The email address you entered was not valid. Since your account registration is confirmed via email, we require a valid email address to send your feedback.");
				}				
				log.debug("new email: " + email);
			}			
			if (manager.userExists(username)) {
				userErrors.add("The username you specified already exists.<br>");
			}
			if (password == null || password.equals("")) {
				userErrors.add("You must provide a password");
			}
			if (passwordQuestion == null || passwordQuestion.equals("")) {
				userErrors.add("You must provide a secret question");
			}
			if (passwordAnswer == null || passwordAnswer.equals("")) {
				userErrors.add("You must provide an answer to your secret question");
			}

			List<String> passwordErrors = PasswordValidator.validate(password,passwordVerify);
			userErrors.addAll(passwordErrors);

			//determine if text string is plural or not
			if(userErrors.size() > 1) {
				reasonText = pText;
			}
			else if(userErrors.size() > 0) {
				reasonText = sText;
			}

			if (userErrors.isEmpty()) { // everything was set up okay.
				log.info("Attempting to create account for " + username);
				manager.createUser(username, password, passwordQuestion, passwordAnswer.toLowerCase());
					log.debug("*****registerUsername=" + registerUsername);
					if (registerUsername.equals("true"))
						ar.putValue("errorMessage", "Thank you for creating a new Campus Crusade for Christ personal login account. Please write down your username and password and keep them in a safe place, as you will need them in the future if you register for additional conferences or apply for Summer Projects or STINT/Internships.<p>You may now log in and register for your conference by clicking \"Continue to Login,\" below.");
					else{
						try {
							int userid = manager.getUserID(username);
							if (isUserGeneric(ctx)) {
								sendGenericThankYouEmail(userid, username, password, passwordQuestion, passwordAnswer, loginPage, ctx);
								ar.putValue("errorMessage", "Thank you for creating a Conference Registration Tool personal login account. Please write down your username and password and keep them in a safe place, as you will need them in the future if you register for additional conferences.<p>You may now log in and register for your conference by clicking \"Continue to Login,\" below.<p>To verify that the email address associated with your account ("+email+") is correct, please also access your email and visit the verification url that we have provided. ");
							} else {
								sendThankYouEmail(userid, username, password, passwordQuestion, passwordAnswer, loginPage, ctx);
								ar.putValue("errorMessage", "Thank you for creating a new Campus Crusade for Christ personal login account. Please write down your username and password and keep them in a safe place, as you will need them in the future if you register for additional conferences or apply for Summer Projects or STINT/Internships.<p>You may now log in and register for your conference by clicking \"Continue to Login,\" below.<p>To verify that the email address associated with your account ("+email+") is correct, please also access your email and visit the verification url that we have provided. ");
							}
							
						} catch(Exception e) {
							//Why are we doing this if it's in a catch block?
							if (isUserGeneric(ctx)) {
								ar.putValue("errorMessage", "Thank you for creating a Conference Registration Tool personal login account. Please write down your username and password and keep them in a safe place, as you will need them in the future if you register for additional conferences.<p>You may now log in and register for your conference by clicking \"Continue to Login,\" below.<p>To verify that the email address associated with your account ("+email+") is correct, please also access your email and visit the verification url that we have provided. ");
							} else {
								ar.putValue("errorMessage", "Thank you for creating a new Campus Crusade for Christ personal login account. Although your account was created successfully, we had trouble verifying the email address ("+email+"). Please send an email from that address to <a href=\"mailto:help@campuscrusadeforchrist.com\">help@campuscrusadeforchrist.com</a> so that we can confirm that we have your correct email address. You may log in and register for your conference by clicking \"Continue to Login\" below.");
							}
						}
					}
				ctx.setReturnValue(ar);
				log.info("Account created successfully. Forwarding to: \""+loginPage+"\"");
				ctx.goToURL(loginPage);
			} else {
				String errorString = buildErrorString(userErrors);
				log.info("Account not created; Errors:" + errorString);
				ar.putValue("errorMessage", "Your account was not created for the following" + reasonText + "<div class=\"indent\">"+errorString+"</div>");
				ar.putValue("passwordQuestion", passwordQuestion);
				ar.putValue("passwordAnswer", passwordAnswer);
				ar.putValue("loginPage", loginPage);
				ctx.setReturnValue(ar);
				if (ctx.getInputString("registerUsernameMS").equalsIgnoreCase("true"))
					ctx.goToView("registerUsernameMS");
				else if ((ctx.getInputString("registerUsername") == null) || ((ctx.getInputString("registerUsername")).trim().equals("")) || (ctx.getInputString("registerUsername").equalsIgnoreCase("false")) || (ctx.getInputString("registerUsername").equalsIgnoreCase("f")))
					ctx.goToView("register");
				else
					ctx.goToView("registerUsername");
			}
		} catch(Exception e) {
			log.error("Failed to complete createUser().",e);
			goToErrorPage(ctx, "Failed to complete your registration, because an internal error occured during processing.");
		}
	}

	public void lookupQuestion(ActionContext ctx) {
		
		ActionResults ar ;
		try {
			ar = ActionResults.getActionResults(ctx.getSession());
		} catch (Exception e) {
			ar = new ActionResults("lookupQuestion");
		}
		String username = ctx.getInputString("username");
		String loginPage = ctx.getInputString("loginPage");
		ar.putValue("loginPage", loginPage);
		try {
			if (username != null && !username.equals("")) {
				String passwordQuestion = manager.getPasswordQuestion(username);
				log.debug("Password question: "+passwordQuestion);
				if ((passwordQuestion==null) || (passwordQuestion.length()==0)) {
					goToErrorPage(ctx, "If you are Campus Ministry Staff, you should be using your uscm email address (first.last@uscm.org) and your Campus Staff Site password. If you have forgotten your Staff Site password, you may reset it by going to https://staff.campuscrusadeforchrist.com/servlet/StaffController and clicking the \"forgot your password\" link beneath the login fields.");					
				} else {
					ar.putValue("username", username);
					ar.putValue("passwordQuestion", passwordQuestion);
					ctx.setReturnValue(ar);
					ctx.goToView("answerQuestion");
				}
			} else {
				ar.putValue("loginPage", loginPage);
				ar.putValue("errorMessage", "Please enter a username.");
				ctx.setReturnValue(ar);
				ctx.goToView("lookupQuestion");
			}
		} 
		catch (UserNotFoundException e) {
			log.info("Username not found: " + username);
			goToErrorPage(ctx, "That username does not exist");
		} 
		catch(Exception e) {
			log.error("Failed to complete AccountController.lookupQuestion()!",e);
			goToErrorPage(ctx, "Failed to retrieve your question, because an internal error occured during processing.");			
		}
	}

	public void answerQuestion(ActionContext ctx) {
		ActionResults ar = new ActionResults("answerQuestion");
		String username;
		String newPassword; 
		String newPasswordVerify;
		boolean internal;
		try {
			username = ctx.getInputString("username", true);
			newPassword = ctx.getInputString("newPassword", true);
			newPasswordVerify = ctx.getInputString("newPasswordVerify", true);
		} catch (MissingRequestParameterException e1) {
			log.error(e1, e1);
			goToErrorPage(ctx, e1.toString());
			return;
		}
		String loginPage = ctx.getInputString("loginPage");
		if (loginPage == null || loginPage.equals(""))
			loginPage = "/accounts/genericLogin.jsp";
		internal = loginPage.startsWith("/");
		
		ar.putValue("loginPage", loginPage);
		String passwordAnswer = ctx.getInputString("passwordAnswer");
		try {
			List<String> errors = PasswordValidator.validate(newPassword, newPasswordVerify);
			boolean valid = (errors.size() == 0);
			if (!valid) {
				log.debug("Invalid password: " + newPassword);
				String errorMessage = "";
				for (String error : errors) {
					errorMessage += error + " <br>";
				}
				ar.putValue("errorMessage", errorMessage);
				ctx.setReturnValue(ar);
				lookupQuestion(ctx);
				return;
			}
			// checks answer, SimpleSecurityManager will throw an
			// exception if it doesn't match
			manager.resetPasswordQA(username, passwordAnswer, newPassword);
			String email = username;
			try { // send email
				if (isUserGeneric(ctx)) {
					sendGenericPasswordEmail(username, email, newPassword,
							loginPage, ctx);
				} else {
					sendPasswordEmail(username, email, newPassword, loginPage,
							ctx);
				}
				ar.putValue(
								"errorMessage",
								"Your identity has been verified, your new password has been emailed to you at "
										+ email + ".");
			} catch (Exception e) {
				ar.putValue(
								"errorMessage",
								"Your identity was verified, and your password was reset. Unfortunately, an error occured during processing, and we were unable to send your password via email. You should click <span style=\"font-weight:bold;text-decoration:underline;\"><a href=\"/servlet/AccountController?action=goToPage&page=lookupQuestion&username="
										+ username
										+ "&loginPage="
										+ loginPage
										+ "\">here</a></span> to <span style=\"font-weight:bold;text-decoration:underline;\"><a href=\"/servlet/AccountController?action=goToPage&page=lookupQuestion&username="
										+ username
										+ "&loginPage="
										+ loginPage
										+ "\">request a new password</a></span>. We apologize for the inconvenience.");
			}
			ctx.setReturnValue(ar);
			if (internal) {
				ctx.goToURL(loginPage);
			} else {
				ctx.goToView("externalRedirect");
			}
		} catch (NotAuthorizedException nae) {
			log.info("User Not Authorized: " + nae.getMessage());
			ar.putValue("errorMessage", nae.getMessage());
			ctx.setReturnValue(ar);
			lookupQuestion(ctx);
		} catch (UserNotFoundException unfe) {
			log
					.info(
							"Security Manager failed. Execution of AccountController.answerQuestion() aborted: "
									+ unfe.getMessage(), unfe);
			goToErrorPage(ctx, unfe.getMessage());
		} catch (UserLockedOutException uloe) {
			log
					.info(
							"Security Manager failed. Execution of AccountController.answerQuestion() aborted: "
									+ uloe.getMessage(), uloe);
			goToErrorPage(ctx, uloe.getMessage());
		} catch (SecurityManagerFailedException smfe) {
			log
					.error(
							"Security Manager failed. Execution of AccountController.answerQuestion() aborted: "
									+ smfe.getMessage(), smfe);
			goToErrorPage(
					ctx,
					"Failed to check your answer, because an internal error occured in the security manager during processing.");
		} catch (Exception e) {
			log.error("Failed to complete AccountController.answerQuestion().",
					e);
			goToErrorPage(
					ctx,
					"Failed to check your answer, because an internal error occured during processing.");
			
		}
	}
	
	public void redirectToExternalPage(ActionContext ctx) throws IOException {
		String loginPage = ctx.getInputString("loginPage");
		ctx.getResponse().sendRedirect(loginPage);
	}

		
	public void changePassword(ActionContext ctx) {
		ActionResults ar = new ActionResults("lookupQuestion");
		String username = ctx.getInputString("username");
		String loginPage = ctx.getInputString("loginPage");
		String password = ctx.getInputString("password");
		String newPassword = ctx.getInputString("newPassword");
		String newPasswordVerify = ctx.getInputString("newPasswordVerify");
		if (username == null) username = "";
		ar.putValue("username", username);
		try { 
			List<String> errors = PasswordValidator.validate(newPassword, newPasswordVerify);
			String errorMessage = buildErrorString(errors);
			if (errorMessage.equals("")) { 
				manager.changePassword(username, password, newPassword);
				String email = username;
				try { // send email
				    ar.putValue("errorMessage", "Your password was successfully changed to the new password just entered.");
				} catch (Exception e) {
					ar.putValue("errorMessage", "Your password was successfully changed.");
				}
				ctx.setReturnValue(ar);
				if (loginPage!=null) {
					if (loginPage.startsWith("/")) {
						ctx.goToURL(loginPage);
					} else {
						ar.putValue("loginPage", loginPage);
						ctx.goToView("externalRedirect");
					}
				} else {
					ctx.goToURL("/accounts/passwordChangeConfirm.jsp");
				}
			} else { // new password was invalid
				ar.putValue("errorMessage", errorMessage);
				if (username!=null) {
					ar.putValue("username", username);
				}
				if (loginPage!=null) {
					ar.putValue("loginPage", loginPage);
				}
				ctx.setReturnValue(ar);
				if ((username!=null)&&(loginPage!=null)) {
					ctx.goToView("changePassword");
				} else {
					ctx.goToView("popUpChangePassword");
				}
			}
		} catch(org.alt60m.security.dbio.manager.SecurityManagerFailedException smfe) {
			log.error("Security Manager failed. Execution of AccountController.changePassword() aborted: "+smfe.getMessage(),smfe);
			goToErrorPage(ctx, "Failed to change your password, because an internal error occured in the security manager during processing.");	
		} catch(org.alt60m.security.dbio.manager.SecurityManagerException sme) { // happens if the password couldn't be changed
			if (username!=null) {
				ar.putValue("username", username);
			}
			if (loginPage!=null) {
				ar.putValue("loginPage", loginPage);
			}
			ar.putValue("errorMessage", sme.getMessage());
			ctx.setReturnValue(ar);
			ctx.goToView("changePassword");
		} catch(Exception e) {
			log.error("Failed to complete AccountController.changePassword().",e);
			goToErrorPage(ctx, "Failed to change your password, because an internal error occured during processing.");			
		}
	}

	private String buildErrorString(List<String> errors) {
		String errorMessage = "";
		for (String error : errors) {
			errorMessage += error + "<br>"; 					
		}
		return errorMessage;
	}

	public void verifyEmail(ActionContext ctx) {
		try {
			String auth = ctx.getInputString("auth");
			String username = ctx.getInputString("username");
			String url = ctx.getInputString("url");
			if (auth == null  ||  username == null  ||  url == null) {
				ctx.goToView("validateEmailError");
			} else {
				auth = decode(auth);
				manager.markEmailAsVerified(Integer.parseInt(auth));
				ActionResults ar = new ActionResults("verifyEmail");
				ar.putValue("errorMessage", "Your email address has been verified. You may now log in below or close this window.");
				ar.putValue("username",username);
				ctx.setReturnValue(ar);
				ctx.goToURL(url);
			}
		} catch (Exception e) {
			log.error("Failure while attempting to verify email address.",e);
			ctx.goToView("validateEmailError");
		}
	}

	private boolean checkEmail(String username) throws Exception{
		try {
			User user = manager.getUserObjectByUsername(username);
			return user.getEmailVerified();
		} catch (Exception e) {
			throw e;
		}
	}

	private String generatePassword(int passLength) {
		char[] chars = { 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3','4','5','6','7','8','9','0','!','$','?' };
		int _CHARS_ARRAY_SIZE = chars.length;
		String newPassword = "";
		for (int i = 0; i < passLength; i++) {
			newPassword += chars[randGen.nextInt(_CHARS_ARRAY_SIZE)]; 
		}
		return newPassword;
	}

	private void sendPasswordEmail(String username, String userEmail, String newPassword, String loginPage, ActionContext ctx) throws Exception {
		try {
			String subject = "New Campus Crusade for Christ User Account Change";
			String body = "This is a confirmation of your recent request to change your Campus Crusade for Christ user password."+
					"\n\nYou recently requested that your password be changed."+
					"\n\nYour username is: "+username+
					"\nYour new password is: "+newPassword+
				    "\n\nIf you have any questions please email help@campuscrusadeforchrist.com or call 888-222-5462."+
					"\n\nThe Campus Ministry of Campus Crusade for Christ" +
					"\nhttp://www.campuscrusadeforchrist.com";
			sendEmail(userEmail, GENERIC_FROM_ADDRESS, subject, body, "text/plain");
		} catch(Exception e) {
			log.error("Failed to send password email for user "+username+"!",e);
			throw e;
		}
	}

	private void sendGenericPasswordEmail(String username, String userEmail, String newPassword, String loginPage, ActionContext ctx) throws Exception {
		try {
			String subject = "New Conference Registration Tool Account Change";
			String body = "This is a confirmation of your recent request to change your password."+
					"\n\nYou recently requested that your password be changed."+
					"\n\nYour username is: "+username+
					"\nYour new password is: "+newPassword+
				    "\n\nIf you have any questions please contact the administrator for the conference you are registering for."+
				    "\n\nThe Conference Registration Tool Team";
			sendEmail(userEmail, "info@conferenceregistrationtool.com", subject, body, "text/plain");
		} catch(Exception e) {
			log.error("Failed to send password email for user "+username+"!",e);
			throw e;
		}
	}
	
	// OLD HTML version...  Got blocked by iHateSpam
/*	private void sendThankYouEmail(int userid, String username, String password, String passwordQuestion, String passwordAnswer, String loginPage, ActionContext ctx) throws Exception {
		try {
			String subject = "Campus Crusade for Christ Account Info",
				body = "This is a confirmation of your user account with Campus Crusade for Christ. You may use this login account to register for conferences and to apply for Summer Projects, Internships, and STINT.<BR><BR>"+
					"\n\n<a href='http://"+ctx.getRequest().getServerName()+"/servlet/AccountController?action=verifyEmail&auth="+encode(userid)+"&username="+username+"&url="+loginPage+"' target='_blank'>Please click here to verify your email address.</a><BR><BR>"+
					"\n\nIf the above link does not work or you do not see a link above, please use the following web address. Since it is a very long address and may have been split up into more than one line, it might not work as a hyperlink. If not, you will need to copy the entire address(including both/all of the lines) into your web browser's address bar.<BR><BR>"+
					"\n\n<a href='http://"+ctx.getRequest().getServerName()+"/servlet/AccountController?action=verifyEmail&auth="+encode(userid)+"&username="+username+"&url="+loginPage+"' target='_blank'>http://"+ctx.getRequest().getServerName()+"/servlet/AccountController?action=verifyEmail&auth="+encode(userid)+"&username="+username+"&url="+loginPage+"</a><BR><BR>"+
					"\n\nYour username is:\t"+username+"<BR>"+
					// "\nYour password is:\t"+password+"<BR>"+
					"\nYour secret question is:\t"+passwordQuestion+"<BR>"+
					"\nThe answer you provided was:\t"+passwordAnswer+"<BR><BR>"+
					"\nFor security reasons, your password has not been included in this email. However, if you forget your password in the future, you will be able to retrieve it by providing the answer to your secret question. Please retain this information in your records, as you will have to type the answer to your secret question exactly as it appears above.<BR><BR>"+
					"\n\nPlease retain a copy of this information in your records. If you forget your password in the future and need to retrieve it, you will have to type the answer to your secret question exactly as it appears above.<BR><BR>"+
					"\n\nIf you have any questions please email help@campuscrusadeforchrist.com or call 888-222-5462.<BR><BR>"+
					"\n\nThe Campus Ministry of Campus Crusade for Christ";
			log.debug(body);
			sendEmail(username, GENERIC_FROM_ADDRESS, subject, body, "text/html");
		} catch(Exception e) {
			log.error("Failed to send password email for user "+username+"!",e);
			throw e;
		}
	}
*/
	// NEW text version...  Passes iHateSpam test
	private void sendThankYouEmail(int userid, String username, String password, String passwordQuestion, String passwordAnswer, String loginPage, ActionContext ctx) throws Exception {
		try {
			String subject = "Campus Crusade for Christ Account Info",
				body = "This is a confirmation of your user account with Campus Crusade for Christ. You may use this login account to register for conferences and to apply for Summer Projects, Internships, and STINT."+
					"\n\nPlease use following link to verify your email address. Since it is a very long address and may have been split up into more than one line, it might not work as a link. If not, you will need to copy the entire address(including both/all of the lines) into your web browser's address bar."+
					"\n\nhttp://"+ctx.getRequest().getServerName()+"/servlet/AccountController?action=verifyEmail&auth="+encode(userid)+"&username="+username+"&url="+loginPage+
					"\n\nYour username is:\t"+username+
					"\nYour secret question is:\t"+passwordQuestion+
					"\nThe answer you provided was:\t"+passwordAnswer+
					"\nFor security reasons, your password has not been included in this email. However, if you forget your password in the future, you will be able to retrieve it by providing the answer to your secret question. Please retain this information in your records, as you will have to type the answer to your secret question exactly as it appears above."+
					"\n\nIf you have any questions please email help@campuscrusadeforchrist.com or call 888-222-5462."+
					"\n\nThe Campus Ministry of Campus Crusade for Christ";
			log.debug(body);
			sendEmail(username, GENERIC_FROM_ADDRESS, subject, body, "text/plain");
		} catch(Exception e) {
			log.error("Failed to send password email for user "+username+"!",e);
			throw e;
		}
	}

	private void sendGenericThankYouEmail(int userid, String username, String password, String passwordQuestion, String passwordAnswer, String loginPage, ActionContext ctx) throws Exception {
		try {
			String subject = "Conference Registration Tool Account Info",
				body = "This is a confirmation of your user account with the Conference Registration Tool."+
					"\n\nPlease use following link to verify your email address. Since it is a very long address and may have been split up into more than one line, it might not work as a link. If not, you will need to copy the entire address(including both/all of the lines) into your web browser's address bar."+
					"\n\nhttp://"+ctx.getRequest().getServerName()+"/servlet/AccountController?action=verifyEmail&auth="+encode(userid)+"&username="+username+"&url="+loginPage+
					"\n\nYour username is:\t"+username+
					"\nYour secret question is:\t"+passwordQuestion+
					"\nThe answer you provided was:\t"+passwordAnswer+
					"\nFor security reasons, your password has not been included in this email. However, if you forget your password in the future, you will be able to retrieve it by providing the answer to your secret question. Please retain this information in your records, as you will have to type the answer to your secret question exactly as it appears above."+
					"\n\nIf you have any questions please contact the administrator for the conference you are registering for.";
			log.debug(body);
			sendEmail(username, "info@conferenceregistrationtool.com", subject, body, "text/plain");
		} catch(Exception e) {
			log.error("Failed to send password email for user "+username+"!",e);
			throw e;
		}
	}
	
	private void sendEmail(String toAddress, String fromAddress, String subject, String body, String mimeType) throws Exception {
		try {
			SendMessage msg = new SendMessage();
			msg.setTo(toAddress);
			msg.setFrom(fromAddress);
			msg.setSubject(subject);
			msg.setBody(body, mimeType);
			msg.send();
		} catch(Exception e) {
			log.error("Failed to send password email to email address \""+toAddress+"!\"",e);
			throw e;
		}
	}

	// encodes an int (in this AccountController, usually the userID) and returns it.
	// used for emailing the userID as a hyperlink.
	// This software is not to be used in National Security or in the operation of nuclear or medical facilities. :-)
	/*	a better way to do this would be to convert the int to a string, concatenate it to a
		super-duper-extra-top-secret codeword, and MD5 the result, then URL-escape that result.
		Then concatenate it to the original string, separated by a "-". The result would be something
		like: "3xD45ba%20esdfD-12345" where "12345" is the original ID. Then, when the link came is clicked
		on, we're not so much decoding the ID as we are making sure that it is the correct encoding: we'd
		take the substring before the dash as "testEncodedValue" and the substring after the dash as "ID"
		we the concatenate ID with our code-word, and MD5 it. Then test that value against testEncodedValue
		(making sure to fix the url escaped sequences in there). If they match, it was a valid link,
		otherwise it was a faked link! Gasp! Horrors! 		It's a more secure method than multiplying by a
		coefficient. But time, deadlines, and laziness being what they are, well, ... */
	public String encode(int topSecretNumber) {
		return  new Long (coefficient * topSecretNumber).toString();
	}

	// Repairs the damage done to our poor little int by encode()
	public String decode(String bigBadEncodedMonster) {
		return new Long (Long.valueOf(bigBadEncodedMonster).longValue()/ coefficient).toString();
	}
	
	private boolean isUserGeneric(ActionContext ctx) {
		Conference cloakConference = new Conference();
		String event = (String) ctx.getSession().getAttribute("selectedEvent");
		if (event != null) {
			cloakConference.setConferenceID(Integer.parseInt(event));
			cloakConference.select();
		}

		boolean cloaked = cloakConference.getIsCloaked();
		return cloaked || ctx.getRequest().getServerName().contains("conferenceregistrationtool");
	}
}