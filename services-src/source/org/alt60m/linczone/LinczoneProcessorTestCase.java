package org.alt60m.linczone;

import java.util.*;
import java.sql.*;
import org.alt60m.util.SendMessage;

public class LinczoneProcessorTestCase {
	public static void main(String[] args) throws Exception {
		

		String propPath = args[0];
		String baseDir = args[1];
		
		LinczoneProcessorRedirect lp = new LinczoneProcessorRedirect(propPath, baseDir);
		

		Properties props = new Properties();
		props.load(new java.io.FileInputStream(propPath));

		Class.forName(props.getProperty("driver"));
		Connection conn = DriverManager.getConnection(props.getProperty("url"));
		
		Statement stat = conn.createStatement();
//	short test	ResultSet rs = stat.executeQuery("select TargetAreaID, name from dev.istdev.ministry_TargetArea where state like 'CA'");
// longer test
		ResultSet rs = stat.executeQuery("select TargetAreaID, name from dev.istdev.ministry_TargetArea");
		while(rs.next()) {
			String taID = rs.getString("TargetAreaID");
			String taName = rs.getString("name");
			
			Map values = new HashMap();
			
			values.put("firstname", new String[] {"testfirstname"});
			values.put("lastname", new String[] {"testlastname"});
			values.put("address", new String[] {"testaddress"});
			values.put("city", new String[] {"CA"});
			values.put("state", new String[] {"teststate"});
			values.put("zip", new String[] {"32828"});
			values.put("email", new String[] {"students@email.com"});
			values.put("campusname", new String[] {taName});
			values.put("campusid", new String[] {taID});
			
			// alternate whether referrer or not
			if((new Long(taID)).longValue() % 2 == 0) {
				values.put("referrer", new String[] {"samplereferrer"});
				values.put("relationship", new String[] {"samplerelationship"});
				values.put("refemail", new String[] {"refferrer@referrer.com"});
			} else {
				values.put("referrer", new String[] {""});
				values.put("relationship", new String[] {""});
				values.put("refemail", new String[] {""});

			}
			
			values.put("ministryInfo", new String[] {"ccc", "nav", "iv", "fca", "bsu", "cacm", "efca", "gcm"});
			lp.enterNewContact(values);

		}

		for (int i =0;i<10 ;i++ ) {
			Map values = new HashMap();
			
			values.put("firstname", new String[] {"testfirstname"});
			values.put("lastname", new String[] {"testlastname"});
			values.put("address", new String[] {"testaddress"});
			values.put("city", new String[] {"CA"});
			values.put("state", new String[] {"teststate"});
			values.put("zip", new String[] {"32828"});
			values.put("email", new String[] {"students@email.com"});
			values.put("campusname", new String[] {"RandomCampus"+i});
			values.put("campusid", new String[] {""});
			values.put("referrer", new String[] {"samplereferrer"});
			values.put("relationship", new String[] {"samplerelationship"});
			values.put("refemail", new String[] {"refferrer@referrer.com"});
			values.put("ministryInfo", new String[] {"ccc", "nav", "iv", "fca", "bsu", "cacm", "efca", "gcm"});
			lp.enterNewContact(values);

		}



	}
}

class LinczoneProcessorRedirect extends LinczoneProcessor {

	public LinczoneProcessorRedirect(String propertyFilePath, String baseDir) throws Exception {
		super(propertyFilePath, baseDir, true);

	}

	protected void sendEmail(Vector recipients, String from, String subject, String body) throws Exception {
		String preface = "";

		System.out.println("*************************************************");
		System.out.println("From: " + from);
		System.out.println("To: ");
		for(Iterator i = recipients.iterator();i.hasNext();) {
			System.out.println("    " + (String)i.next() );
		}

		System.out.println("Subject: "+ subject);
		System.out.println("Body:\n"+preface+body);
		System.out.println("*************************************************\n\n\n");
	}


};