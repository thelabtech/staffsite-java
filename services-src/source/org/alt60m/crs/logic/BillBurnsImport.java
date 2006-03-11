/*
 * Created by IntelliJ IDEA.
 * User: David Bowdoin
 * Date: Aug 26, 2002
 * Time: 2:35:44 PM
 */
package org.alt60m.crs.logic;

//import org.alt60m.crs.model.CRSPerson;
//import org.alt60m.crs.model.CRSConference;
//import org.alt60m.factory.ServiceFactory;
//import org.alt60m.persistence.castor.ObjectAdaptor;
import org.alt60m.security.dbio.manager.SimpleSecurityManager;

import java.sql.*;


public class BillBurnsImport {
	final int confId = 10;
	Connection m_connection = null;
	Statement statement = null;
	ResultSet rs = null;
//    CRSBroker broker;
    java.util.Random _rand = new java.util.Random();


//javac -d C:\ade3\classes C:\ade3\controlled-src\services-src\source\org\alt60m\crs\logic\BillBurnsImport.java
//java org.alt60m.crs.logic.BillBurnsImport
    public static void main(String[] args) throws Exception {
	    BillBurnsImport test = new BillBurnsImport();
	    test.givePWD();
	}

    public void givePWD()  throws Exception {
        m_connection = org.alt60m.util.DBConnectionFactory.getDatabaseConn();
        statement = m_connection.createStatement();
        rs = statement.executeQuery("SELECT crs_CRSPerson.username, crs_CRSPerson.email, crs_CRSPerson.firstname , crs_CRSPerson.lastname FROM crs_CRSPerson LEFT OUTER JOIN simplesecuritymanager_user ON crs_CRSPerson.username = simplesecuritymanager_user.username WHERE simplesecuritymanager_user.userID IS NULL AND crs_CRSPerson.password ='Impact Import' AND (crs_CRSPerson.username not like '1%')");
        System.out.println("Query was ran.");
        int i = 0;
        while(rs.next()) {
            System.out.println("---------------------------------Record # " + ++i +" "+rs.getString("username"));
            try {
            addUser(rs.getString("username"),rs.getString("firstname"),rs.getString("lastname"));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

/*
	private String getField(String fieldName) throws Exception {
		String value = rs.getString(fieldName);
		if(value==null) value = "";
		return value;
	}

	public void importBillBurns()  throws Exception {
		m_connection = org.alt60m.util.DBConnectionFactory.getDatabaseConn();
		statement = m_connection.createStatement();
		rs = statement.executeQuery("SELECT * from temp_CRSPersonImport ORDER BY LastName");
		CRSBroker broker = ServiceFactory.getCRSBroker();

		int i = 0;
		while(rs.next()) {
			System.out.println("---------------------------------Record # " + ++i);
			broker.begin();

            String email = rs.getObject("Email").toString();
			addUser(email,getField("FirstName"),getField("LastName"));

			CRSPerson person =  new CRSPerson();
			broker.createObject(person);
			person.setUsername(email);
			person.setEmail(email);
			person.setSsn(getField("SSN"));
			person.setFirstName(getField("FirstName"));
			person.setLastName(getField("LastName"));
			person.setAddress1(getField("CurrentStreet"));
			person.setCity(getField("CurrentCity"));
			person.setState(getField("CurrentState"));
			person.setZip(getField("CurrentZip"));
			person.setHomePhone(getField("CurrentPhone"));
			person.setPermanentAddress1(getField("PermStreet"));
			person.setPermanentCity(getField("PermCity"));
			person.setPermanentState(getField("PermState"));
			person.setPermanentZip(getField("PermZip"));
			person.setPermanentPhone(getField("PermPhone"));
			person.setCampus(getField("School"));
			person.setGraduationDate(getField("GradDate"));
			String gender = getField("Gender");
			if(gender.length() > 1) gender = gender.substring(0,1);
			person.setGender(gender);
			System.out.println(ObjectAdaptor.obj2hash(person));
			broker.commit();

			broker.begin();
			broker.registerForConference(email,confId);
			broker.commit();
		}
	}
*/
	private void addUser(String username, String firstName, String lastName) throws Exception {
		SimpleSecurityManager manager = new SimpleSecurityManager();
		if(!manager.userExists(username)) {
//			System.out.println("Creating a security Account");
            String generatedPW = _rand.nextInt(999999) +"";
            sendEmail(username, generatedPW, firstName);
            manager.createUser(username, generatedPW, "What is your last name?", lastName);
		}
	}

    private void sendEmail(String email, String generatedPW, String firstName) throws Exception {
        org.alt60m.util.SendMessage sm = new org.alt60m.util.SendMessage("smtp.newhopechristian.net");
        sm.setTo(email);
        sm.setFrom("impact@uscm.org");
        sm.setSubject("Your new Impact 2002 Username and Password");
        sm.setBody("Dear "+firstName+"," +
                "\n\nWe are busy preparing for your attendance at Impact 2002.  We are confident that God will use this conference in a very significant way." +
                "\n\nIf you have visited www.impactmovement.com recently, you may have noticed that we are in the process of making some significant upgrades to the site." +
                "\n\nOne major change involves the way we handle on-line registrations.  The new system has a few added features and is password protected.  As a result, in order to edit your registration information or make a pre-registration payment, you must login using your email address and password." +
                "\n\nWe have auto-generated a password for you based on the information that you have already supplied. Your username is "+email+" and your password is " + generatedPW +
                "\n\nThank you for your patience through the \"growing pains\" of our system upgrade.  We can't wait to see you in DC!" +
                "\n\nYours for a greater Impact,\n\nJim Williamson\nImpact 2002 Conference Director\nimpact@uscm.org");
        sm.send(false);
    }

}
