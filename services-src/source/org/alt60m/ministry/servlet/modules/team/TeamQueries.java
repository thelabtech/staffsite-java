package org.alt60m.ministry.servlet.modules.team;

import java.text.SimpleDateFormat;
import java.util.*;

import org.alt60m.ministry.model.dbio.*;
import org.alt60m.ministry.servlet.InfoBaseQueries;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import org.alt60m.util.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class TeamQueries extends org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries {
	private static Log log = LogFactory.getLog(TeamController.class);
  
	public static void saveTeamLeader (String personID, String teamID){
		try 
		{
			if(!(new Person(personID)).getIsSecure()){
			Connection conn = DBConnectionFactory.getDatabaseConn();
			String query="INSERT INTO ministry_missional_team_member (personID, teamID, is_leader) VALUES ("+personID+","+teamID+",1);";
			log.debug(query);
			Statement stmt=conn.prepareStatement(query);
			stmt.executeUpdate(query);
			}
			else
			{
				log.debug("Not saved as team leader: secure person record");
			}
		}
		catch (Exception e) 
		{
			log.error(e, e);
		}
	}
	public static void removeTeamMember( String personID,String teamID){
		try 
		{
			Connection conn = DBConnectionFactory.getDatabaseConn();
			String query=" DELETE FROM ministry_missional_team_member "+
			" WHERE ministry_missional_team_member.personID="+personID+" AND ministry_missional_team_member.teamID="+teamID+";";
			log.debug(query);
			Statement stmt=conn.prepareStatement(query);
			stmt.executeUpdate(query);
		}
		catch (Exception e) 
		{
			log.error(e, e);
		}
	}
	public static void saveTeamMember (String personID, String teamID){
		try 
		{
			if(!(new Person(personID)).getIsSecure()){
			Connection conn = DBConnectionFactory.getDatabaseConn();
			String query="INSERT INTO ministry_missional_team_member (personID, teamID) VALUES ("+personID+","+teamID+");";
			log.debug(query);
			Statement stmt=conn.prepareStatement(query);
			stmt.executeUpdate(query);
			}
			else
			{
				log.debug("Not saved as team member: secure person record");
			}
		}
		catch (Exception e) 
		{
			log.error(e, e);
		}
	}
}