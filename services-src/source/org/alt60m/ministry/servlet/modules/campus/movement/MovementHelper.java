package org.alt60m.ministry.servlet.modules.campus.movement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import java.util.StringTokenizer;
import java.text.ParseException;
import org.alt60m.ministry.Strategy;
import org.alt60m.ministry.ActivityExistsException;
import org.alt60m.ministry.model.dbio.Activity;
import org.alt60m.ministry.model.dbio.ActivityHistory;
import org.alt60m.ministry.model.dbio.LocalLevel;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
public class MovementHelper extends org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper {
	private static final int MAX_CONTACTS = 2; //If this gets changed, need to change saveContact() checks
	private static Log log = LogFactory.getLog(MovementHelper.class);
	public static Hashtable info(String id)throws Exception{
		Hashtable result=new Hashtable();
		Activity act = new Activity(id);
		result=infotize(act);
	    return result;
	}

  public void savePersonContact(String personID, String activityId) throws Exception {
      try {
      	MovementQueries.removePersonContact(personID,activityId);
      	MovementQueries.savePersonContact(personID,activityId);
          
      }
      catch (Exception e) {
          log.error("Failed to perform savePersonContact().", e);
			throw new Exception(e);
      }
  }
	public void removePersonContact(String personID,String activityId) throws Exception {
		try {
			MovementQueries.removePersonContact(personID, activityId );
		}
		catch (Exception e) {
		    log.error("Failed to perform removePersonContact().", e);
				throw new Exception(e);
		}
	}
  public static void saveEditActivity(String activityId, String periodEnd, String strategy, 
	String newStatus, String profileId, String newTeamId, String newUrl, String newFacebook) throws Exception, ActivityExistsException {
	try {
	checkAndPersistChanges(newTeamId, newStatus, activityId, newUrl, newFacebook, periodEnd, profileId);
	 		//if (checkAndPersistChanges(newTeamId, newStatus, activityId, newUrl, periodEnd, profileId)) {
	//	if (strategy.equals("SC") || strategy.equals("CA")) {
			
	//		saveEditActivitySC(activityId, periodEnd, strategy, newStatus, profileId, newTeamId, newUrl);
	//	}
	//	else {
	//		saveEditActivityOther(activityId, periodEnd, strategy, newStatus, profileId, newTeamId, newUrl);
	//	}
	//}
}
catch (Exception e) {
	log.error("Failed to perform saveEditActivity().", e);
	throw e;
}
}
private synchronized static void saveEditActivityOther(String activityId, String periodEnd, String strategy, 
	String newStatus, String profileId, String newTeamId, String Url) throws Exception, ActivityExistsException {
try {
	log.debug("***  saveEditActivityOther: ");
	Activity oldActivity = new Activity(activityId);
	
	
	
	if ( newStatus.equals("IN") || !checkDuplicateActiveActivity(oldActivity.getTargetAreaId(), strategy, activityId) ){
  
		if (!newStatus.equals("IN")) {
			
		}
		
	}
	else {
		
		log.warn("Possible double-click bug in ibt.saveEditActivity");
		throw new ActivityExistsException("Strategy is already active for this target area.\n\nYou may also be receiving this error message if you double-clicked on the 'OK' button instead of single-clicked.  If that was the case, your change may have succeeded.");
	}
}
catch (Exception e) {
	log.error("Failed to perform saveEditActivityOther()", e);
	throw e;
}
}


private static boolean checkDuplicateActiveActivity(String targetAreaId, ArrayList<String> strategies, String notActivityId) throws Exception {
try {
	Activity checkA = new Activity();
	boolean result = checkA.select(
			"fk_targetAreaID = " + targetAreaId +
			" AND status <> 'IN'" +
			" AND strategy IN (" + Strategy.formatStrategies(strategies) + ")" +
			" AND ActivityID <> " + notActivityId);
	return result;
}
catch (Exception e) {
	log.error("Failed to perform checkDuplicateActiveActivity", e);
	throw e;
}
}

private static boolean checkDuplicateActiveActivity(String targetAreaId, String strategy, String notActivityId) throws Exception {
try {
	ArrayList<String> strategies = Strategy.listStrategiesToCheck(strategy);
	
	Activity checkA = new Activity();
	boolean result = checkA.select(
			"fk_targetAreaID = " + targetAreaId +
			" AND status <> 'IN'" +
			" AND strategy IN (" + Strategy.formatStrategies(strategies) + ")" +
			" AND ActivityID <> " + notActivityId);
	return result;
}
catch (Exception e) {
	log.error("Failed to perform checkDuplicateActiveActivity", e);
	throw e;
}
}

private static boolean checkDuplicateActiveActivity(String targetAreaId, String strategy) throws Exception {
return checkDuplicateActiveActivity(targetAreaId, strategy, "0");
}

private static boolean checkAndPersistChanges(String newTeamId, String newStatus, String oldActivityId, String newUrl, String newFacebook, String periodEnd, String profileId) {
Activity oldActivity = new Activity(oldActivityId);
return checkAndPersistChanges(newTeamId, oldActivity.getLocalLevelId(), newStatus, oldActivity.getStatus(), newUrl, oldActivity.getUrl(), newFacebook, oldActivity.getFacebook(),   oldActivity, periodEnd, profileId);
}

private static boolean checkAndPersistChanges(String newTeamId, String oldTeamId, 
	String newStatus, String oldStatus, String newUrl, String oldUrl, String newFacebook, String oldFacebook, Activity oldActivity, String periodEnd, String profileId)  {
boolean change = false;

if (!newTeamId.equals(oldTeamId)){
	LocalLevel team = new LocalLevel(newTeamId);
	oldActivity.setTeam(team);
	change = true;
}
if(!newStatus.equals(oldStatus))
{
	try {
		deactivateOldHistory(oldActivity.getActivityId(), periodEnd, profileId);  
		
	}catch (Exception e) {
      log.error("CheckForChange:   Failed to deactivateOldHistory().", e);
		
  }
	oldActivity.setStatus(newStatus);  
	change = true;
	ActivityHistory activityHistory = new ActivityHistory();
	String oldestActHistID = activityHistory.getLastActivityHistoryID(oldActivity.getActivityId());
	ActivityHistory oldestActivityHistory = new ActivityHistory(oldestActHistID);
	
	activityHistory.setFromStatus(oldestActivityHistory.getToStatus());
	activityHistory.setActivity_id(oldActivity.getActivityId());
	activityHistory.setToStatus(oldActivity.getStatus());   
	activityHistory.setPeriodBegin(new Date());
	
  activityHistory.setTransUsername(profileId);
  activityHistory.persist();
  
   
}


if(!newUrl.equals(oldUrl)) {
	oldActivity.setUrl(newUrl);
	change = true;
}

if(!newFacebook.equals(oldFacebook)) {
	oldActivity.setFacebook(newFacebook);
	change = true;
}

if(change) 					
	oldActivity.persist();  
	

return change;
}


public static void saveActivityHistory(Activity activity, String status, String periodBegin, String profileId) throws Exception {
try {
	log.debug("*** saveActivityHistory.  ActivityID: " + activity.getActivityId());	
	
  ActivityHistory activityHistory = new ActivityHistory();
  String lastHistoryID = activityHistory.getLastActivityHistoryID(activity.getActivityId());
  String lastToStatus = "";
  if (!lastHistoryID.equals("")) {
  	activityHistory = new ActivityHistory(lastHistoryID);
  	lastToStatus = activityHistory.getToStatus();
  	log.debug("*** saveActivityHistory:  lastToStatus: " + activityHistory.getToStatus());	
  	deactivateOldHistory(activity.getActivityId(), periodBegin, profileId);  
  }
	
  activityHistory.setPeriodBegin(parseSimpleDate(periodBegin));
  activityHistory.setActivity_id(activity.getActivityId());
  activityHistory.setTransUsername(activity.getTransUsername());
  activityHistory.setToStatus(activity.getStatus()); 
  activityHistory.setFromStatus(lastToStatus);
  activityHistory.persist();									
}
catch (Exception e) {
  log.error("Failed to perform saveActivityHistory().", e);
	throw new Exception(e);
}
}
static private java.sql.Date parseSimpleDate(String date) throws java.text.ParseException {
StringTokenizer tokens = new StringTokenizer(date, "/");
if (tokens.countTokens() != 3)
  throw new ParseException("Unparsable: " + date, 0);
int month = Integer.parseInt(tokens.nextToken()) - 1;
int day = Integer.parseInt(tokens.nextToken());
int year = Integer.parseInt(tokens.nextToken());
Calendar c = Calendar.getInstance();
c.set(year, month, day);
return new java.sql.Date(c.getTime().getTime());
}
public static void deactivateOldHistory(String activityID, String newPeriodBegin, String profileID) throws Exception {

  ActivityHistory lastActivityHistory = new ActivityHistory();     	    
  String lastHistoryID = lastActivityHistory.getLastActivityHistoryID(activityID);
  lastActivityHistory = new ActivityHistory(lastHistoryID); 
  lastActivityHistory.setPeriodEnd(parseSimpleDate(newPeriodBegin));  
  lastActivityHistory.setTransUsername(profileID);					
  lastActivityHistory.persist();


}

}
