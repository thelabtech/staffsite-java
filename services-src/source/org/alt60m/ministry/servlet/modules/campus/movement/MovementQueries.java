package org.alt60m.ministry.servlet.modules.campus.movement;

import java.text.SimpleDateFormat;
import java.util.*;

import org.alt60m.ministry.model.dbio.*;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import org.alt60m.util.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class MovementQueries extends org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries {
	private static Log log = LogFactory.getLog(MovementController.class);

	public static void savePersonContact (String personID, String activityId){
		try 
		{
			if(!(new Person(personID)).getIsSecure()){
			Connection conn = DBConnectionFactory.getDatabaseConn();
			
			String query="INSERT INTO ministry_movement_contact (personID, ActivityID) VALUES ("+personID+","+activityId+");";
			log.debug(query);
			Statement stmt=conn.prepareStatement(query);
			stmt.executeUpdate(query);
			}
			else
			{
				log.debug("Not saved as movement contact: secure person record");
			}
		}
		catch (Exception e) 
		{
			log.error(e, e);
		}
	}
	
	public static void removePersonContact( String personID,String activityId){
		try 
		{
			Connection conn = DBConnectionFactory.getDatabaseConn();
			String query=" DELETE FROM ministry_movement_contact "+
			" WHERE ministry_movement_contact.personID="+personID+" AND ministry_movement_contact.ActivityID="+activityId+";";
			log.debug(query);
			Statement stmt=conn.prepareStatement(query);
			stmt.executeUpdate(query);
		}
		catch (Exception e) 
		{
			log.error(e, e);
		}
	}

}