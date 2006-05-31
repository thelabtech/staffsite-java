package org.alt60m.security.dbio.importer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import org.alt60m.util.LogHelper;
import org.apache.log4j.Priority;

public class LoginResetAndEmail {

	//Log Helper Code//
	private static LogHelper logHelper = new LogHelper();
	private void log(Priority p, String msg) { logHelper.log(this.getClass().toString(),p,msg); }
	private void log(Priority p, String msg, java.lang.Throwable t) { logHelper.log(this.getClass().toString(),p,msg,t); }
	//End of Log Helper Code//
	
	Connection m_connection = null;
	java.util.Random _rand = new java.util.Random();

	public void performUpdate()  {
		try {
			m_connection = org.alt60m.util.DBConnectionFactory.getDatabaseConn(); 
			 
			if (m_connection == null) {
				log(Priority.ERROR,"Failed to open database connection!");
				return;
			}

			Statement statement = m_connection.createStatement();
			ResultSet rs1 = statement.executeQuery("select * from vNoLogin");
			
			while (rs1.next())
			{
				String secantUN = rs1.getString("secant_un");
				String firstName = rs1.getString("firstName");
                String email = rs1.getString("profile_email");

                String generatedPW = _rand.nextInt(999999) +"";
                String hashedPW = clear2hash( generatedPW.getBytes() );
				try {
					String update = "insert into simplesecuritymanager_user(username, password, lastLogin, createdOn) values ('"+secantUN+"', '"+hashedPW+"', null, getdate())";
					log(Priority.INFO,update);
					Statement updateStatement = m_connection.createStatement();
					updateStatement.executeUpdate(update);

					try { 
						sendEmail(firstName, email, generatedPW); 
					} catch (Exception e) { 
						log(Priority.ERROR,"Error emailing: " + secantUN + " at " + email,e); 
					}
				} catch (Exception e) {
					log(Priority.ERROR,"Error updating record: " + secantUN + "\n",e);
				}
			}
		} catch (Exception e) {
			log(Priority.ERROR,"[" + new java.util.Date() +"] Failed.",e);
		}
	}

	private void sendEmail(String firstName, String email, String generatedPW) throws Exception {
		org.alt60m.util.SendMessage sm = new org.alt60m.util.SendMessage();
		sm.setTo(email);
		sm.setFrom("help@campuscrusadeforchrist.com");
		sm.setSubject("Your Campus Ministry Staff Site password has been reset");
		sm.setBody("Dear "+firstName+", \n\n\tDue to a security upgrade, your password to the Campus Ministry Staff Site (http://staff.campuscrusadeforchrist.com) has been reset.  Your new password is: \"" + generatedPW + "\".  The first time you log in with this password, you will be prompted to enter a new password.  \n\n\tIf you have any questions, please contact Customer Service at 888-222-5462, or send an email to help@campuscrusadeforchrist.com.\n\nInformation Solutions Team");
		sm.send(false);
    }

	public String resetRequest(String username) throws Exception {
		try {
			m_connection = org.alt60m.util.DBConnectionFactory.getDatabaseConn(); 

			if (m_connection == null) {
				log(Priority.ERROR,"Failed to open database connection!");
				Exception e = new Exception("Failed to open database connection.");
				throw e;
			}
			Statement statement = m_connection.createStatement();
			ResultSet rs1 = statement.executeQuery("select firstName, email from staffsite_staffsiteprofile where username='"+username+"'");
                        
			if (!rs1.next()) {
                throw new Exception("The username that you entered does not exist in our database. Please try again, or contact <a href=\"mailto:help@campuscrusadeforchrist.com\">help@campuscrusadeforchrist.com</a> for further assistance.");                           
            } else {
                String firstName = rs1.getString("firstName");
                String email = rs1.getString("email");

                String generatedPW = _rand.nextInt(999999) +"";
                String hashedPW = clear2hash( generatedPW.getBytes() );

                try {
                        String update = "update simplesecuritymanager_user set password='"+hashedPW+"' where username='"+username+"'";
                        System.out.println(update);
                        Statement updateStatement = m_connection.createStatement();
                        updateStatement.executeUpdate(update);

                        update = "update staffsite_staffsiteprofile set changePassword=1 where username='"+username+"'";
                        System.out.println(update);
                        updateStatement = m_connection.createStatement();
                        updateStatement.executeUpdate(update);

                        try { 
                                sendRequestedEmail(firstName, email, generatedPW); 
                        } catch (Exception e) { 
                                System.out.println("Error emailing: " + username + " at " + email); 
                                throw e;
                        }
                } catch (Exception e) {
                        System.out.println("Error updating record: " + username + "\n" + e);
                        throw e;
                }
                return email;
            }
		} catch (Exception e) {
			log(Priority.ERROR,"[" + new java.util.Date() +"] Failed.",e);
			throw e;
		}
	}

	private void sendRequestedEmail (String firstName, String email, String generatedPW) throws Exception {
		org.alt60m.util.SendMessage sm = new org.alt60m.util.SendMessage();
		sm.setTo(email);
		sm.setFrom("help@campuscrusadeforchrist.com");
		sm.setSubject("Your Campus Ministry Staff Site password has been reset");
		sm.setBody("Dear "+firstName+", \n\n\tAs per your request, your password to the Campus Ministry Staff Site (http://staff.campuscrusadeforchrist.com) has been reset.  Your new password is: \"" + generatedPW + "\".  The first time you log in with this password, you will be prompted to enter a new password.  \n\n\tIf you have any questions, please contact Customer Service at 888-222-5462, or send an email to help@campuscrusadeforchrist.com.\n\nInformation Solutions Team");
		sm.send(false);
	}

	private String clear2hash(byte[] clearText) throws java.security.NoSuchAlgorithmException {
        java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
		byte[] ba = md.digest(clearText);
		return new String(org.alt60m.util.Base64.encode(ba));
    }

	public static void main(String[] args) throws Exception {
        LoginResetAndEmail lrae = new LoginResetAndEmail();
        lrae.performUpdate();
	}
}

