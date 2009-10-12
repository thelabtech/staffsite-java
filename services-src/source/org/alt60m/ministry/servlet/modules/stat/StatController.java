
package org.alt60m.ministry.servlet.modules.stat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.alt60m.ministry.MissingTargetAreaIdException;
import org.alt60m.ministry.Strategy;
import org.alt60m.ministry.model.dbio.Activity;
import org.alt60m.ministry.model.dbio.LocalLevel;
import org.alt60m.ministry.model.dbio.Statistic;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.servlet.ActionResults;
import org.alt60m.servlet.Controller.ActionContext;
import org.alt60m.staffSite.bean.dbio.Bookmarks;
import org.alt60m.staffSite.model.dbio.StaffSitePref;
import org.alt60m.util.DateUtils;

public class StatController extends org.alt60m.ministry.servlet.modules.InfoBaseModuleController {

    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	

    public StatController() {
        log.debug("StatController constructor");
    }
    private final String module="stat";
	private final String title="Stats";
    public void init() {
        log.debug("StatController.init()");
        try {
            initState();
        } catch (Exception e) {
            log.fatal("Failed to init!", e);
        }
    }
    protected void initState() throws Exception {
        initViews(getServletContext().getRealPath("/WEB-INF/modules/views.xml"));
        setDefaultAction("index");
        _bookmarks = new Bookmarks();
    }
    public void index(ActionContext ctx) {//IJK
        try {
        	
        	ActionResults results=new ActionResults();
        	ctx.setSessionValue("quicksearch",ctx.getInputString("quicksearch")==null?null:"true");
        	ArrayList<Activity> activities=new ArrayList<Activity>();
        	
            if(ctx.getInputString("addBookmark")!=null) {
            	String singleKey=ctx.getInputString("addBookmark");
            	_bookmarks.removeBookmark(ctx.getProfileID(), Bookmarks.STATISTIC, singleKey);
            	Activity activity = new Activity(singleKey);
            	if (!activity.isPKEmpty()) {
	            	_bookmarks.addBookmark(ctx.getProfileID(), Bookmarks.STATISTIC, activity.getTargetArea().getName(), singleKey);
	            	activities.add(activity);
            	}
            } else {
	            Collection<StaffSitePref> acts=_bookmarks.getBookmarks(ctx.getProfileID(),Bookmarks.STATISTIC);
	            for(StaffSitePref sp:acts){
	            	Activity activity = new Activity();
	            	activity.setActivityId(sp.getValue());
	            	if (!activity.select()) {
	            		_bookmarks.removeBookmark(ctx.getProfileID(), Bookmarks.STATISTIC, sp.getValue());
	            	} else {
	            		activities.add(activity);
	            	}
	            }
            }
            results=StatHelper.fastStats(activities);
            String weeksBack = ctx.getInputString("weeksBack", false);
        	if (weeksBack!=null) {
        		results.putValue("weeksBack", weeksBack);
        	}
        	else {
        		results.putValue("weeksBack", "0");
    		}
        	if(ctx.getSessionValue("statSuccess")!=null) {
        		if(ctx.getSessionValue("statSuccess").equals("true")) {
        			results.putValue("message","Your stats were saved successfully. Check below or run a report to verify.");
        		}
        		results.putValue("statSuccess", (String)ctx.getSessionValue("statSuccess"));
        		ctx.setSessionValue("statSuccess", null);
        	} else {
        		results.putValue("statSuccess", "");
        	}
        	Hashtable<String,String> activityIds = new Hashtable<String,String>();
        	for (Activity activity:activities) {
        		activityIds.put(activity.getActivityId(), activity.getActivityId());
        	}
        	results.addHashtable("info",InfoBaseModuleHelper.infotize(new LocalLevel()));
        	results.addHashtable("search", InfoBaseModuleHelper.sessionSearch(ctx));
        	results.addHashtable("activities", activityIds);
        	results.putValue("module",this.module);
			results.putValue("title",this.title);
			results.putValue("mode","content");
            ctx.setReturnValue(results);
            ctx.goToView("enter_stat");
        }
        
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform index().", e);
        }
    }

	private ActionResults getBookmarks(ActionContext ctx, ActionResults results, int type, String id) throws Exception {
		StaffSitePref p = _bookmarks.getBookmark(ctx.getProfileID(), type, id);
		if (p != null)
			results.putValue("bookmarkID", p.getStaffSitePrefID());
		else
			results.putValue("bookmarkID", "");
		return results;
	}
 
	public void deleteFastSuccessCriteriaBookmark(ActionContext ctx){
   	 try {
   		if (! loginCheck(ctx)) {
    		return;
    	}
   	if(ctx.getInputString("delBookmark")!=null){
       	_bookmarks.removeBookmark(ctx.getProfileID(), Bookmarks.STATISTIC, (String)ctx.getInputString("delBookmark"));
       		
       }
   		index(ctx);
   	 }
        
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform deleteFastSuccessCriteriaBookmark ().", e);
        }
   }
	public void saveFastSuccessCriteria(ActionContext ctx) {//IJK
    	if (! loginCheck(ctx)) {
    		return;
    	}
        try {
        	HttpServletRequest tempCtx=ctx.getRequest();
        	ActionResults errorResults=new ActionResults("fast_stats_error");
        	Hashtable<String,Hashtable<String,String>> newStats=new Hashtable<String,Hashtable<String,String>>(convertBracketedParamsToHashtable(ctx));
        	log.debug(newStats);
        	Hashtable<String,String> thisStat;
        	Iterator scanStats=(newStats.keySet().iterator());
        	String activityId;
        	String peopleGroup="";
        	Boolean hasData=false;
        	Boolean hasProblem=false;
        	ArrayList<Activity> badActivities = new ArrayList<Activity>();
        	Hashtable<String,String> badSaves=new Hashtable<String,String>();
        	StatHelper ibt;
        	 Statistic stat;
        	 String statisticId;
        	 String username = (String) ctx.getSessionValue("userName");
        	 List<String> keys;
        	 Map<String, String> statMap;
        	while (scanStats.hasNext())
        	{
        		hasData=new Boolean(false);
        		log.debug("hasData="+hasData);
        		thisStat=new Hashtable<String,String>();
        		thisStat=newStats.get(scanStats.next());
	            activityId = thisStat.get("activityid");
	            peopleGroup = thisStat.get("PeopleGroup");
				ibt = new StatHelper();
				stat = new Statistic();
				keys = Arrays.asList(new String[] { "PeriodBegin",
						"PeriodEnd", "PersonalEvangelismExposures",
						"GroupEvangelismExposures", "MediaExposures", "Decisions",
						"Multipliers", "StudentLeaders", "InvolvedStudents",
						"LaborersSent", "PeopleGroup", "DecisionsMediaExposures","DecisionsPersonalEvangelismExposures",
						"DecisionsGroupEvangelismExposures","HolySpiritConversations", "Seekers" });
				 statMap = new HashMap<String, String>();
				for (String key : keys) 
				{
					
					if(("PersonalEvangelismExposures GroupEvangelismExposures  MediaExposures  " +
							"Decisions Multipliers  StudentLeaders  InvolvedStudents LaborersSent" +
							"  PeopleGroup  DecisionsMediaExposures DecisionsPersonalEvangelismExposures " +
							" DecisionsGroupEvangelismExposures HolySpiritConversations  Seekers ").contains((String)key)){//we only test the stats entered by user
						log.debug(key+": "+(String) thisStat.get(key)+", Before"+key+": "+(String) thisStat.get("Before"+key));
							
						if(
								(! //no blank or invalid values in supplied data
									isBlankOrNonNumeric((String)thisStat.get(key))
								)
								&&
								(
									(//demographic stats must be new non zero value to count as changed (i.e. 4 to 0 is changed, null to 0 is not)
											//otherwise an autofilled value could be mistaken for a new value; autofill
											//will always supply zero in place of null.
											(("Multipliers  StudentLeaders  InvolvedStudents").contains((String)key))
											&&
											(!
													blankEqualsZeroCompare((String)thisStat.get(key),(String) thisStat.get("Before"+key))
													//blankequalszerocompare treats any blank as string "0" in either input.
											)
									)
										||
									(//other stats only need to be new value, because they are not autofilled.
											//We test to make sure it's not demographic data
											//to prevent this from giving a false positive for those stats.
											(!("Multipliers  StudentLeaders  InvolvedStudents").contains((String)key))
											&&
											(!(((String) thisStat.get(key)).equals((String) thisStat.get("Before"+key))))	
									)
								)
							)	
							
						{
							hasData=true;
							log.debug(key+": "+(String) thisStat.get(key)+", BeforeKey: "+(String) thisStat.get("Before"+key));
							log.debug("hasData="+hasData);
						}
					}
					if(("PeriodBegin PeriodEnd".contains((String)key)))
					{
						statMap.put(key, (String) thisStat.get(key));
					}
					else if (("PeopleGroup".equals((String)key)))
					{
						if ((!(null==((String) thisStat.get(key))))&&(!((String) thisStat.get(key)).equals(""))&&(!((String) thisStat.get(key)).equals("null"))){
							statMap.put(key, (String) thisStat.get(key));
						}
					}
					else if	(((String) thisStat.get(key)).replaceAll("[^0123456789]","error").contains("error"))
					{
						badActivities.add(new Activity(activityId));
						badSaves.put(activityId, username);
						hasProblem=true;
					}
					else
					{
						statMap.put(key, ((String) thisStat.get(key)).replaceAll("[^0123456789]",""));	
					}
				}
	        	if(hasData)
	        	{
					if (thisStat.get("statisticid").equals("")) 
					{
		            	
		            	if ((peopleGroup==null)||(peopleGroup.equals("null"))||(peopleGroup.equals(""))||(peopleGroup.equals("(Other Internationals)")))
		            	{
		            		if (!stat.select("fk_Activity="+activityId+" and periodBegin='"+org.alt60m.util.DateUtils.clearTimeFromDate(DateUtils.parseDate(thisStat.get("PeriodBegin")))+"' and ((peopleGroup is null) or (peopleGroup in ('','null','(Other Internationals)')))")) 
		            			{
			                    stat = ibt.createStatObject();
			                    stat.setActivityId(activityId);
			                    }
		            	}
		            	else 
		            	{
		            		stat.setPeriodBegin(DateUtils.parseDate(thisStat.get("PeriodBegin")));
			            	stat.setActivityId(activityId);
		            		stat.setPeopleGroup(peopleGroup);
			            	if (!stat.select()) 
			            	{
			                    stat = ibt.createStatObject();
			                    stat.setActivityId(activityId);
		                    }
		            	} 
		            }
					else 
					{
		                statisticId = thisStat.get("statisticid");
		                stat = ibt.getStatObject(statisticId);
		            }
					username = (String) ctx.getSessionValue("userName");
		        	stat.setUpdatedBy(username);
		        	ibt.saveStatObjectWithActivity(statMap, stat);
	        	}
			}
        	if(!hasProblem){
        		ctx.setSessionValue("statSuccess", "true");
        		index(ctx); }
        	else{ //if non-numerical input
        		ActionResults results=new ActionResults();
        		results=StatHelper.fastStats(badActivities);
            	results.addHashtable("activities",badSaves);
        		String weeksBack = ctx.getInputString("weeksBack", false);
            	if (weeksBack!=null)
        		{results.putValue("weeksBack", weeksBack);}
            	else
        		{results.putValue("weeksBack", "0");}
            	ctx.setSessionValue("statSuccess", "false");
            	results.putValue("message", "You entered non-numerical data in these movements; please try again.");
            	results.putValue("statSuccess", (String)ctx.getSessionValue("statSuccess"));
            	results.putValue("module",this.module);

            	results.addHashtable("search", InfoBaseModuleHelper.sessionSearch(ctx));
    			results.putValue("title",this.title);
    			results.putValue("mode","content");
            	ctx.setReturnValue(results);
                ctx.goToView("enter_stat");
        	}
        }catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveFastSuccessCriteria().", e);
        }
    }
}