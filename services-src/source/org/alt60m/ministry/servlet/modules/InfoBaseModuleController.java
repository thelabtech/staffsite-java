
package org.alt60m.ministry.servlet.modules;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.TreeMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TreeMap;
import java.util.Vector;
import org.alt60m.security.dbio.manager.SimpleSecurityManager;
import org.alt60m.security.dbio.manager.UserNotVerifiedException;
import org.alt60m.ministry.ActivityExistsException;
import org.alt60m.ministry.MissingTargetAreaIdException;
import org.alt60m.ministry.Regions;
import org.alt60m.ministry.Strategy;
import org.alt60m.ministry.model.dbio.Address;
import org.alt60m.ministry.model.dbio.Activity;
import org.alt60m.ministry.model.dbio.Person;
import org.alt60m.ministry.model.dbio.Contact;
import org.alt60m.ministry.model.dbio.Dependent;
import org.alt60m.ministry.model.dbio.LocalLevel;
import org.alt60m.ministry.model.dbio.NonCccMin;
import org.alt60m.ministry.model.dbio.OldAddress;
import org.alt60m.ministry.model.dbio.RegionalStat;
import org.alt60m.ministry.model.dbio.RegionalTeam;
import org.alt60m.ministry.model.dbio.Staff;
import org.alt60m.ministry.model.dbio.Statistic;
import org.alt60m.ministry.model.dbio.ReportRow;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.ministry.servlet.modules.model.Section;
import org.alt60m.ministry.servlet.modules.person.PersonHelper;
import org.alt60m.ministry.servlet.modules.team.TeamHelper;
import org.alt60m.security.dbio.model.User;
import org.alt60m.servlet.ActionResults;
import org.alt60m.servlet.Controller;

import org.alt60m.staffSite.bean.dbio.Bookmarks;
import org.alt60m.staffSite.model.dbio.StaffSitePref;
import org.alt60m.util.CountryCodes;
import org.alt60m.util.DateUtils;
import org.alt60m.util.ObjectHashUtil;
import java.util.regex.*;

/**
 * Web controller for InfoBase History: 4/10/01	MDP	Initial Coding Completeness (0 - 5): 3 Known Issues:<p>
 * refactoring and repackaging 5/23/03 MAB
 * @author  Mark Petrotta
 * @version 1.0
 */
public class InfoBaseModuleController extends Controller {
	
	private final String module="home";
	private final String title="Home";
    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	class StaffByRegionCache {
        Date lastUpdated;
		Hashtable staffByRegion = new Hashtable();
    }
    private final String[] _abbrevRegion = new String[] { "NE", "MA", "MS", "SE", "GL", "UM", "GP", "RR", "NW", "SW" };

    private Bookmarks _bookmarks;
    private final String[] _expandRegion = new String[] { "Northeast", "Mid-Atlantic", "MidSouth", "Southeast", "Great Lakes", "Upper Midwest", "Great Plains Int'l", "Red River", "Greater Northwest", "Pacific Southwest" };

    final String[] _reportTypes = new String[] { "locallevel", "targetarea", "regional", "national" };
    protected final String LOCAL_LEVEL_ID_TOKEN = "locallevelid";
    protected final String TARGET_AREA_ID_TOKEN = "targetareaid";
   
    
    public InfoBaseModuleController() {
        log.debug("InfoBaseModuleController constructor");
       
       
        
    }
    public Person getUserPerson(ActionContext ctx){
    	 String username = (String) ctx.getSessionValue("userName");
         User user=new User();
         user.setUsername(username);
         user.select();
         Person person=new Person();
         person.setFk_ssmUserID(user.getUserID());
         person.select();
         return person;
    }
    /** @param ctx ActionContext object */
    public void addActivity(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("createActivity");
            String localLevelId = ctx.getInputString(LOCAL_LEVEL_ID_TOKEN, true);
            String strategy = ctx.getInputString("strategy", true);
            java.util.GregorianCalendar today = new java.util.GregorianCalendar();
            java.text.SimpleDateFormat headerFormatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
            results.putValue("date", headerFormatter.format(today.getTime()));
            results.putValue("strategy", strategy);
   			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            LocalLevel ll = ibt.getLocalLevelTeam(localLevelId);
            results.putValue("teamName", ll.getName());
            
            Vector<Hashtable<String,String>> tasInRegionWithoutStrategy = ibt.getTargetAreasByRegionWithoutStrategy(ll.getRegion(),strategy);
            StringBuffer campusOptions=new StringBuffer();
            for(Hashtable<String,String>h:tasInRegionWithoutStrategy){
				campusOptions.append("<option value=\""+h.get("targetareaid")+"\">"+h.get("name")+"</option>");
				}
				    
            results.putValue("campuses", campusOptions.toString());
            ctx.setReturnValue(results);
            ctx.goToView("addCampusToTeam");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform addActivity ().", e);
        }
    }


    public void addCampusToMin(ActionContext ctx) {
	try {
		ActionResults results = new ActionResults("addCampusToMin");
		String partialName = ctx.getInputString("partialName", true);

		// Add collection of teams containing that name **********************************
        Vector v = InfoBaseModuleQueries.getNonSecureTargetAreasByName(partialName);
		results.addCollection("campuses", ObjectHashUtil.list(v));
		ctx.setReturnValue(results);
		ctx.goToView("addCampusToMin");
	}
	catch (Exception e) {
		ctx.setError();
		ctx.goToErrorView();
		log.error("Failed to perform addCampusToMin ().", e);
	}
    }

    /** @param ctx ActionContext object */
    public void addContact(ActionContext ctx) {// to be deprecated by addPersonContact()
        try {
            ActionResults results = new ActionResults("addContact");
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            String mode = ctx.getInputString("mode", true);
            String parameter = ctx.getInputString(mode, true);
            if (parameter.length() > 2)
                parameter += "%";
            String activityId = ctx.getInputString("activityid", true);
            String targetAreaId = ctx.getInputString("targetareaid", true);
            Collection colStaff;
            if ("region".equalsIgnoreCase(mode)) {
                colStaff = ibt.shortListStaffByRegionSQL(parameter.toUpperCase());
            } else if((parameter.length()>0)&&(!(parameter.replaceAll("%","").equals("")))){
                colStaff = ibt.listStaffHashByLastName(parameter.toUpperCase());
            } else {
            	parameter=ibt.getTargetArea(targetAreaId).getRegion();
            	colStaff = ibt.shortListStaffByRegionSQL(parameter.toUpperCase());
            	results.putValue("infoMessage", "You need to specify a last name. For the time being, here are some staff from the region:");
            }
            ibt.removeCurrentContactFromStaffList(colStaff, activityId); 
            results.addCollection("staff", colStaff);
            if (mode.equals("region")) {
                results.putValue("region", translate(_abbrevRegion, _expandRegion, ctx.getInputString("region", true)));
            }
            results.putValue("activityid", activityId);
            results.putValue("targetareaid", targetAreaId);
            ctx.setReturnValue(results);
            ctx.goToView("addContact");
        }
        catch (Exception e) {
			ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform addContact().", e);
        }
    }
    
   

   
    /** @param ctx ActionContext object */
   
    public void addMinToCampus(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("addTeamToCampus ");
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            String targetAreaId = ctx.getInputString(TARGET_AREA_ID_TOKEN, true);
            TargetArea target = ibt.getTargetArea(targetAreaId);
            results.putValue("targetAreaName", target.getName());
			Collection minTeamsHash = ObjectHashUtil.list(ibt.getAllNonCccMin());
            results.addCollection("ministries", minTeamsHash);
            ctx.setReturnValue(results);
            ctx.goToView("addMinToCampus");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform addMinToCampus().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void addNewCampus(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("addNewCampus");
            ctx.setReturnValue(results);
            ctx.goToView("addNewCampus");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform addNewCampus().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void addTeamToCampus(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("addTeamToCampus ");
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();

            String targetAreaId = ctx.getInputString(TARGET_AREA_ID_TOKEN, true);
            String strategy = ctx.getInputString("strategy", true);
            String from = ctx.getInputString("from", true);

			java.util.GregorianCalendar today = new java.util.GregorianCalendar();
            java.text.SimpleDateFormat headerFormatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
            results.putValue("date", headerFormatter.format(today.getTime()));
            results.putValue("strategy", strategy);

            TargetArea target = ibt.getTargetArea(targetAreaId);

            Collection teams = ibt.getLocalLevelTeamsByRegion(target.getRegion()!=null?target.getRegion():"");
            Vector<Hashtable<String, Object>> hashedTeams = new Vector<Hashtable<String, Object>>();

            for (Iterator iTeams = teams.iterator(); iTeams.hasNext(); ) {
                LocalLevel ll = (LocalLevel)iTeams.next();
                Hashtable<String, Object> hash = ObjectHashUtil.obj2hash(ll);
                hash.put("LocalLevelID", ll.getLocalLevelId());
                hashedTeams.add(hash);
            }

            results.addCollection("teams", hashedTeams);
            results.putValue("targetAreaName", target.getName());
            ctx.setReturnValue(results);
            if (from.equals("addTeamToCampus"))
                ctx.goToView("addTeamToCampus");
            if (from.equals("editActivity"))
                editActivity(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform addTeamToCampus().", e);
        }
    }

    public void addTeamToRegion(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("addTeamToCampus ");
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            java.util.GregorianCalendar today = new java.util.GregorianCalendar();
            java.text.SimpleDateFormat headerFormatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
            results.putValue("date", headerFormatter.format(today.getTime()));
            String searchText = ctx.getInputString("Region", true);
            Collection hashedTeams = ObjectHashUtil.list(ibt.getLocalLevelTeamsByRegionExclusive(searchText));
            results.addCollection("teams", hashedTeams);
            ctx.setReturnValue(results);
            ctx.goToView("localLevelMetros");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform addTeamToRegion().", e);
        }
    }

    private List<Hashtable<String, Object>> blankStatsCalendar(String statId) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		calendar.add(Calendar.WEEK_OF_YEAR, -15);
		List<Hashtable<String, Object>> allDates = new ArrayList<Hashtable<String,Object>>();
		for (int cnt = 0; cnt < 16; cnt++) {
			Hashtable<String, Object> noEntry = new Hashtable<String, Object>();
			noEntry.put("PeriodBegin", calendar.getTime());
			calendar.add(Calendar.DAY_OF_MONTH, 6);
			noEntry.put("PeriodEnd", calendar.getTime());
			calendar.add(Calendar.DAY_OF_MONTH, 1);
			noEntry.put(statId, "");
			allDates.add(noEntry);
		}
		return allDates;
	}
    
    String buildCommaDelimitedQuotedList(Collection col) {
        String result = "";
        Iterator i = col.iterator();
        while (i.hasNext()) {
            result += "'" + (String)i.next() + "'";
            if (i.hasNext()) result += ",";
        }
        return result;
    }

    String buildCommaDelimitedQuotedList(String[] arr) {
        String result = "";
        for (int cnt = 0; cnt < arr.length; cnt++) {
            result += "'" + arr[cnt] + "'";
            if (cnt != arr.length - 1) result += ",";
        }
        return result;
    }

   
    
    public void removeInactiveBookmark(ActionContext ctx) {
        try {
            String type = ctx.getInputString("type", new String[] { "targetarea", "locallevel", "statistic" });
            String mode = ctx.getInputString("mode", new String[] { "add", "remove" });
            log.debug("current user: " + ctx.getProfileID());
            if (mode.equals("remove")) 
            	{
                String bookmarkID = ctx.getInputString("bookmarkid", true);
                _bookmarks.removeBookmark(bookmarkID);
            	} 
            
            ctx.goToView("staffHome");
        	}
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform changeInactiveBookmark().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void createReport(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("createReport");
            String type = ctx.getInputString("type", _reportTypes);
            results.putValue("type", type);
            if (type.equals("regional") && !inList(_abbrevRegion, ctx.getInputString("region"))) {
                showSuccessCriteriaHome(ctx);
            } else {
                Calendar cal = Calendar.getInstance();
                cal.setTime(new Date());
                results.putValue("fromYear", Integer.toString(cal.get(Calendar.YEAR) - 1));
                results.putValue("toYear", Integer.toString(cal.get(Calendar.YEAR)));
                results.putValue("type", type);
                ctx.setReturnValue(results);
                ctx.goToView("setReportCriteriaAgile");
            }
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform createReport().", e);
        }
    }

	public void deleteTargetArea (ActionContext ctx) {
		try
		{
			String targetareaId = ctx.getInputString("targetareaid", true);
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			ibt.deleteTargetArea(targetareaId);
		}
		catch (Exception e)
		{
			ctx.setError();
			ctx.goToErrorView();
			log.error("Failed to perform deleteTeam().", e);
		}

	}


	public void deleteTeam (ActionContext ctx) {
		try
		{
			String teamId = ctx.getInputString("teamid", true);
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			ibt.deleteLocalLevelTeam(teamId);
		}
		catch (Exception e)
		{
			ctx.setError();
			ctx.goToErrorView();
			log.error("Failed to perform deleteTeam().", e);
		}
	}

    /** @param ctx ActionContext object */
    public void detailedListCampus(ActionContext ctx) {
        final String[] allowedSearchBy = {"name", "city", "state", "country", "zip", "region", 
        /*Movments: */ "FS", "SC", "CA", "II", "IE", "IE", "ID", "IN", "BR", "WS",  "MM", "AA", "CL", "KC", "GK", "VL", "OT"};
        
        final String[] validMovement = {"FS", "SC", "CA", "II", "IE", "IE", "ID", "IN", "BR", "WS",  
        								"MM", "AA", "CL", "KC", "GK", "VL", "OT"};

        try {

            ActionResults results = new ActionResults("listCampus");
            String searchBy = ctx.getInputString("searchby", allowedSearchBy);
            String searchText = ctx.getInputString("searchstring", true);
            String nextView = ctx.getInputString("view", true);            
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();


			if (searchBy.equals("country")) {
                String countryCode = CountryCodes.nameToCode(searchText);
                searchText = (countryCode != null) ? countryCode : searchText;
            }
			
			for(int i =0;i<validMovement.length;i++) {
				if (validMovement[i].equals(searchBy))
					searchText = searchBy;  
			}		
            if (searchText.length() > 0) {
               Collection colOfHashes = ibt.getCampusListDirectly(searchBy, searchText);
               results.addCollection("campusinfo", colOfHashes);
            }
            else {
                results.addCollection("campusinfo", new Vector());
            }
            ctx.setReturnValue(results);
            ctx.goToView(nextView);
        }
        catch (Exception e) {
			e.printStackTrace();
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform detailedListCampus().", e);
        }
    }
    /** @param ctx ActionContext object */
    public void search(ActionContext ctx) {
        try {
        	ActionResults results = new ActionResults("listCampus");
        	ctx.setSessionValue("home", "search");
        	String type = ctx.getInputString("type", true);
        	String name = ctx.getInputString("name", true);
            String city = ctx.getInputString("city", true);
            String state = ctx.getInputString("state", true);
            String region = ctx.getInputString("region", true);  
            InfoBaseModuleHelper.storeSearch(ctx);
			Section list=InfoBaseModuleHelper.getSearchResults(type,name,city,state,region);
			Vector<Section> content=new Vector<Section>();
			content.add(list);
			results.addHashtable("search",InfoBaseModuleHelper.sessionSearch(ctx));
			results.addCollection("content", content);
			results.putValue("module", "home");
			results.putValue("title", "Home");
			results.putValue("mode", "list");
            ctx.setReturnValue(results);
            ctx.goToView("index");
        }
        catch (Exception e) {
			e.printStackTrace();
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform search().", e);
        }
    }
    /** @param ctx ActionContext object */
    public void editActivity(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("editActivity");
   			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            String referrer = ctx.getInputString("referrer",
                new String[] { "targetarea", "locallevel" });
            String activityId = ctx.getInputString("activityid", true);
            String targetAreaId = ctx.getInputString("targetareaid", true);
            String strategy = ctx.getInputString("strategy", true);
            String status = ctx.getInputString("status", true);
            String Url = ctx.getInputString("url", true);
            results.putValue("url", Url);
            String Facebook = ctx.getInputString("facebook", true);
            results.putValue("facebook", Facebook);
            results.putValue("referrer", referrer);
            results.putValue("activityid", activityId);
            results.putValue("targetareaid", targetAreaId);
            results.putValue("strategy", strategy);
            results.putValue("status", status);
            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            results.putValue("today", formatter.format(new Date()));
            TargetArea target = ibt.getTargetArea(targetAreaId);
            Collection colLLs = ObjectHashUtil.list(ibt.getLocalLevelTeamsByRegion(target.getRegion()));
            results.addCollection("teams", colLLs);
            results.putValue("targetareaname", target.getName());
            ctx.setReturnValue(results);
            ctx.goToView("editActivity");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform editActivity().", e);
        }
    }

    public void editNonCCCMin(ActionContext ctx) {
        try {
            String mode = ctx.getInputString("mode",
                new String[] { "add", "update" });
            ActionResults results = new ActionResults("editTeam");
            if (mode.equals("add")) {
                String targetAreaId = ctx.getInputString(TARGET_AREA_ID_TOKEN, true);
                results.putValue(TARGET_AREA_ID_TOKEN, targetAreaId);
                results.putValue("mode", mode);
            } else {
                String nonCccMinId = ctx.getInputString("noncccminid", true);
       			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
                Hashtable min = ObjectHashUtil.obj2hash(ibt.getNonCccMin(nonCccMinId));
                results.addHashtable("ministry", min);
                results.putValue("mode", mode);
            }
            ctx.setReturnValue(results);
            ctx.goToView("editNonCCCMin");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform editTeam().", e);
        }
    }

	/*
	 * @param ctx ActionContext object
	 */
    public void editRegionalSuccessCriteria(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("editRegionalSuccessCriteria");
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			SimpleDateFormat userFormat = new SimpleDateFormat("MM/dd/yyyy");
            results.putValue("region", ctx.getInputString("region", true));

			if (ctx.getInputString("statisticid") != null) {
                String statId = ctx.getInputString("statisticid");
                RegionalStat stat = ibt.getRegionalStatObject(statId);
                results.addHashtable("statistic", ObjectHashUtil.obj2hash(stat));
				log.debug("Statistic: " + ObjectHashUtil.obj2hash(stat));
                results.putValue("periodbegin", userFormat.format(stat.getPeriodBegin()));
                results.putValue("periodend", userFormat.format(stat.getPeriodEnd()));
            } else {
                results.putValue("periodbegin", ctx.getInputString("periodbegin", true));
                results.putValue("periodend", ctx.getInputString("periodend", true));
            }
            ctx.setReturnValue(results);
            ctx.goToView("editRegionalSuccessCriteria");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform editRegionalSuccessCriteria().", e);
        }
    }

	/** @param ctx ActionContext object */
    public void editRegionInfo(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults();
            String region = ctx.getInputString("region", true);
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			RegionalTeam regionalTeam = ibt.getRegionalTeam(region);

			Hashtable regionalHash = ObjectHashUtil.obj2hash(regionalTeam);
            results.addHashtable("regionalteam", regionalHash);

			List<Hashtable<String, Object>> allDates = blankStatsCalendar("RegionalStatId");
			Collection<Hashtable<String, Object>> c = ibt.getRegionalStats(region, allDates);
            allDates = populateStatsCalendar(c.iterator(), allDates);

			SimpleDateFormat shortFormat = new SimpleDateFormat("M/dd");
            SimpleDateFormat fullFormat = new SimpleDateFormat("MM/dd/yyyy");
            for (int cnt = 0; cnt < 16; cnt++) {
                Hashtable<String, Object> row = allDates.get(cnt);
                row.put("PeriodBeginShort", shortFormat.format(row.get("PeriodBegin")));
                row.put("PeriodEndShort", shortFormat.format(row.get("PeriodEnd")));
                row.put("PeriodBegin", fullFormat.format(row.get("PeriodBegin")));
                row.put("PeriodEnd", fullFormat.format(row.get("PeriodEnd")));
            }

            results.addCollection("regionalInfo", allDates);
            ctx.setReturnValue(results);
            ctx.goToView("regionInfo");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform editRegionlnfo().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void editSuccessCriteria(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("editSuccessCriteria");
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            String targetAreaId = ctx.getInputString("targetareaid", true);
            String activityId = ctx.getInputString("activityid", true);
            TargetArea ta = new TargetArea(targetAreaId);
            Activity act = new Activity(activityId);
            
            String statisticId = ctx.getInputString("statisticid", false);
			String lastStatId = ctx.getInputString("laststatid", false);
            results.putValue("targetareaid", targetAreaId);
            results.putValue("activityid", activityId);
            results.putValue("targetAreaName", ta.getName());
            results.putValue("strategyName", act.getStrategyFullName());
           
            	results = ibt.editSuccessCriteria(results, statisticId, lastStatId, ctx.getInputString("periodbegin", true), ctx.getInputString("periodend", true));
                ctx.setReturnValue(results);
                ctx.goToView("editSuccessCriteriaInfo");
            
        } catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform editSuccessCriteria().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void editTargetArea(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("editTargetArea");
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            String targetAreaId = ctx.getInputString(TARGET_AREA_ID_TOKEN, true);
            Hashtable targetInfo = ObjectHashUtil.obj2hash(ibt.getTargetArea(targetAreaId));
            results.addHashtable("targetAreaInfo", targetInfo);
            ctx.setReturnValue(results);
            ctx.goToView("editTargetAreaInfo");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform editTargetArea().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void editTeam(ActionContext ctx) {
        try {
            String mode = ctx.getInputString("mode",
                new String[] { "add", "update" });
            ActionResults results = new ActionResults("editTeam");
            if (mode.equals("add")) {
                String from = ctx.getInputString("from", true);
                if (from.equals("localLevelMetros")) {
                    String region = ctx.getInputString("region", true);
                    results.putValue("region", region);
                } else {
                	   
                    String targetAreaId = ctx.getInputString(TARGET_AREA_ID_TOKEN, true);
                    String strategy = ctx.getInputString("strategy", true);
                    if (from.equals("editActivity")) {
                        String referrer = ctx.getInputString("referrer", true);
                        String currentTeamId = ctx.getInputString("currentteamid", true);
                        
                        String activityId = ctx.getInputString("activityid", true);
                        String status = ctx.getInputString("status", true);
                        results.putValue("referrer", referrer);
                        results.putValue("currentTeamID", currentTeamId);
                        results.putValue("activityID", activityId);
                        results.putValue("status", status);
                    }
                    
                    results.putValue(TARGET_AREA_ID_TOKEN, targetAreaId);
                    results.putValue("strategy", strategy);
                }
                results.putValue("mode", mode);
                results.putValue("from", from);
            } else { // update
                String localLevelId = ctx.getInputString(LOCAL_LEVEL_ID_TOKEN, true);
	   			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
	   			LocalLevel thisTeam = ibt.getLocalLevelTeam(localLevelId);
                Hashtable ll = ObjectHashUtil.obj2hash(thisTeam);
                             
               
                String noMovements = new String ();
                noMovements = (thisTeam.hasNoActiveActivities())? "T" : "F" ;
                results.putValue("noMovements", noMovements);                      
                
                results.addHashtable("team", ll);
                results.putValue("mode", mode);
                
                                            
            }
           
            
            ctx.setReturnValue(results);
            ctx.goToView("editTeam");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform editTeam().", e);
        }
    }


 
    /** @param ctx ActionContext object */
    public void enterSuccessCriteria(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("enterSuccessCriteria ");
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            String activityId = ctx.getInputString("activityid", true);
            Activity activity = ibt.getActivityObject(activityId);
            TargetArea targetArea = activity.getTargetArea();
            String targetAreaId = targetArea.getTargetAreaId();
            results.putValue("targetareaid", targetAreaId);
            results.putValue("activityid", activityId);
			results = getBookmarks(ctx, results, Bookmarks.STATISTIC, activityId);
            results.putValue("displayname", targetArea.getName());
			List<Hashtable<String, Object>> allDates = blankStatsCalendar("StatisticId");
			Collection stats = ibt.getTargetAreaStats(targetAreaId, allDates);
            Collection<Hashtable<String, Object>> hashedStats = ObjectHashUtil.list(stats);
            allDates = populateStatsCalendar(hashedStats.iterator(), allDates);

			SimpleDateFormat shortFormat = new SimpleDateFormat("M/dd");
            SimpleDateFormat fullFormat = new SimpleDateFormat("MM/dd/yyyy");
            for (int cnt = 0; cnt < 16; cnt++) {
                Hashtable<String, Object> row = allDates.get(cnt);
                row.put("PeriodBeginShort", shortFormat.format(row.get("PeriodBegin")));
                row.put("PeriodEndShort", shortFormat.format(row.get("PeriodEnd")));
                row.put("PeriodBegin", fullFormat.format(row.get("PeriodBegin")));
                row.put("PeriodEnd", fullFormat.format(row.get("PeriodEnd")));
            }

            results.addCollection("statistics", allDates);
            ctx.setReturnValue(results);
            ctx.goToView("enterSuccessCriteria");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform enterSuccessCriteria ().", e);
        }
    }

    public void enterSuccessCriteriaForActivity(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("enterSuccessCriteria ");
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            String activityId = ctx.getInputString("activityid", true);
           Activity activity = ibt.getActivityObject(activityId);
            
            String strategy=activity.getStrategy();
            TargetArea targetArea = activity.getTargetArea();
            String status = activity.getStatus();
            
	            String targetAreaId = targetArea.getTargetAreaId();
	            if(targetAreaId==null || targetAreaId.equals(""))
	            {
	            	throw new MissingTargetAreaIdException("Activity " + activityId + " does not have an associated targetArea");
	            }
	            results.putValue("targetareaid", targetAreaId);
	            results.putValue("activityid", activityId);
	            results = getBookmarks(ctx, results, Bookmarks.STATISTIC, activityId);
	            results.putValue("displayname", targetArea.getName());
	            List<Hashtable<String, Object>> allDates = blankStatsCalendar("StatisticId");
	            Collection<Hashtable<String, Object>> stats = ibt.getTargetAreaStats(targetAreaId, allDates, strategy);
	            allDates = populateStatsCalendar(stats.iterator(), allDates);
	
	            SimpleDateFormat shortFormat = new SimpleDateFormat("M/dd");
	            SimpleDateFormat fullFormat = new SimpleDateFormat("MM/dd/yyyy");
	            for (int cnt = 0; cnt < 16; cnt++) {
	                Hashtable<String, Object> row = allDates.get(cnt);
	                row.put("PeriodBeginShort", shortFormat.format(row.get("PeriodBegin")));
	                row.put("PeriodEndShort", shortFormat.format(row.get("PeriodEnd")));
	                row.put("PeriodBegin", fullFormat.format(row.get("PeriodBegin")));
	                row.put("PeriodEnd", fullFormat.format(row.get("PeriodEnd")));
	            }
	            results.addCollection("statistics", allDates);
	
	            ctx.setReturnValue(results);
            if (status=="IN")
            	{
            	ctx.goToView("enterSuccessCriteriaInactive");
            	}
            else
            	{    
	            ctx.goToView("enterSuccessCriteria");
            	}
        }
        catch (MissingTargetAreaIdException e)
		{
        	ctx.setError();
        	ctx.goToErrorView();
        	log.error("Missing target area id.", e);
		}
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform enterSuccessCriteria ().", e);
        }
    }
    public ActionResults fastStats(Hashtable<String,String> attribute)throws Exception //IJK
    {
    	ActionResults multiResults=new ActionResults("fastStat");
        InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
        Activity activity;
        String status;
        Iterator actIter=attribute.keySet().iterator();
        TargetArea targetArea;
        String targetAreaId;
        SimpleDateFormat shortFormat = new SimpleDateFormat("M/dd");
        SimpleDateFormat fullFormat = new SimpleDateFormat("MM/dd/yyyy");
        Collection<Hashtable<String, Object>> stats;
        Hashtable<String, Object> row;
        ActionResults results=new ActionResults("hold each result");
        List<String> strategies = new Vector<String>();
        List<Hashtable<String, Object>> allDates = blankStatsCalendar("StatisticId");
        String activityId="";
        String strategy=""; 
        String peopleGroup="";
        Iterator peopleIter;
    	while (actIter.hasNext())
    	{
    		activityId=(String)actIter.next();
    		activity = ibt.getActivityObject(activityId);
            strategy=activity.getStrategy();  //if strategy is Bridges, go thru each peopleGroup option and invoke a stat object/ActionResult for it.
            if(strategy.equals("BR"))
            {
            	peopleIter=Arrays.asList("(Other Internationals)","East Asian","Ishmael Project","Japanese","South Asian").iterator();
            }
            else
            {
            	peopleIter=Arrays.asList("").iterator();
            }
            	while(peopleIter.hasNext())
            	{
            		
            		peopleGroup=(String)peopleIter.next();
            		allDates =blankStatsCalendar("StatisticId");
            		results=new ActionResults("hold each result");
            		targetArea = activity.getTargetArea();
                    status = activity.getStatus();
                    targetAreaId = targetArea.getTargetAreaId();
                    if(targetAreaId==null || targetAreaId.equals(""))
                    {
                    	throw new MissingTargetAreaIdException("Activity " + activityId + " does not have an associated targetArea");
                    }
                    results.putValue("targetareaid", targetAreaId);
                    results.putValue("activityid", activityId);
                    results.putValue("status", status);
                    results.putValue("strategy", strategy);
                    results.putValue("peopleGroup", peopleGroup);
                    stats = ibt.getBridgesTargetAreaStats(targetAreaId, allDates, strategy, peopleGroup);
                    allDates = populateStatsCalendar(stats.iterator(), allDates);
                    for (int cnt = 0; cnt < 16; cnt++) 
                    {
                        row = allDates.get(cnt);
                        row.put("PeriodBeginShort", shortFormat.format(row.get("PeriodBegin")));
                        row.put("PeriodEndShort", shortFormat.format(row.get("PeriodEnd")));
                        row.put("PeriodBegin", fullFormat.format(row.get("PeriodBegin")));
                        row.put("PeriodEnd", fullFormat.format(row.get("PeriodEnd")));
                    }
                    results.addCollection("statistics", allDates);
                    results.putValue("displayname", targetArea.getName()+" - "+Strategy.expandStrategy(strategy)+((strategy.equals("BR"))?"&%@!"+(peopleGroup.equals("null") ? "(Other Internationals)" : peopleGroup):""));
                    multiResults.addActionResults(results.getValue("displayname")+"_"+activityId,results);
            	}
            
        }
    	return multiResults;
    }    

    public void deleteFastSuccessCriteriaBookmark(ActionContext ctx){
    	 try {
    	if(ctx.getInputString("delBookmark")!=null){
        	_bookmarks.removeBookmark(ctx.getProfileID(), Bookmarks.STATISTIC, (String)ctx.getInputString("delBookmark"));
        		
        }
    	ctx.goToView("staffHome");
    	 }
         
         catch (Exception e) {
             ctx.setError();
             ctx.goToErrorView();
             log.error("Failed to perform deleteFastSuccessCriteriaBookmark ().", e);
         }
    }
    public void enterEventSuccessCriteria(ActionContext ctx) {//IJK
        try {
        	
        	ActionResults results=new ActionResults();
        	TargetArea event=new TargetArea();
        	Activity activity=new Activity();
        	Statistic statistic=new Statistic();
        	String eventType=ctx.getInputString("eventType");
        	String eventKeyID=ctx.getInputString("eventKeyID");
        	String region=ctx.getInputString("region");
        	String name=ctx.getInputString("name");
        	String isSecure=ctx.getInputString("isSecure");
        	String email=ctx.getInputString("email");
        	
        	
        	
        	Date periodEnd=new Date(Long.parseLong(ctx.getInputString("periodEnd")));
        	Date periodBegin=new Date(Long.parseLong(ctx.getInputString("periodBegin")));
        	
        	event.setEventType(eventType);
        	event.setEventKeyID(eventKeyID);
        	event.select(); //we select based on eventType and eventKeyID.
        	event.setName(name);
        	event.setRegion(region.equals("null")?"":region);
        	
        	event.setIsSecureString(isSecure);
        	event.setUrl(event.getEventLink());
        	event.setEmail(email);
        	
        	event.persist(); //we always save the most recent data for the event, populated from the toolside link.
        	
        	activity.setTargetAreaId(event.getTargetAreaId());
        	activity.select();
        	 
        	activity.setStatus("IN");
        	activity.setLocalLevelId("0");
        	int pgStart=0;
        	int pgEnd=1;
        	String[] pg={"","(Other Internationals)","East Asian","Ishmael Project","Japanese","South Asian"};
        	if (ctx.getInputString("strategy")!=null){
        	if(ctx.getInputString("strategy").equals("Bridges")){
        		activity.setStrategy("BR");
        		pgStart=1;
        		pgEnd=6;
        	}}
        	activity.persist();
        	Vector<Statistic>eventStats=new Vector<Statistic>();
        	
        	for(int i=pgStart;i<pgEnd;i++){
	        	statistic=new Statistic();
	        	statistic.setActivityId(activity.getActivityId());
	        	statistic.setPeopleGroup(pg[i]);
	        	statistic.setPeriodBegin(periodBegin);
	        	statistic.setPeriodEnd(periodEnd);
	        	statistic.select(); //get any existing stat matching these criteria
	        	statistic.persist(); //save it
	        	eventStats.add(statistic);
        	}
        	results.putValue("strategy", (activity.getStrategy()==null||activity.getStrategy().equals(""))?"EV":activity.getStrategy());
        	results.putValue("name", name);
        	results.putValue("activityID",activity.getActivityId());
        	results.putValue("eventKeyID",eventKeyID);
        	results.putValue("eventType", eventType);
        	String redirect=ctx.getInputString("redirect");
        	results.putValue("redirect", redirect);
        	results.putObject("eventStats", eventStats);
        	ctx.setReturnValue(results);
        	
            ctx.goToView("enterEventSuccessCriteria");
            	
        }
        
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform enterEventSuccessCriteria ().", e);
        }
    }
    
    public void enterFastSuccessCriteriaForActivity(ActionContext ctx) {//IJK
        try {
        	
        	ActionResults results=new ActionResults();
        	Hashtable<String,String> activities=new Hashtable<String,String>();
            activities=new Hashtable<String,String>((convertBracketedParamsToHashtable(ctx).get("activities")));
            if(ctx.getInputString("addBookmark")!=null){
            	
            	String singleKey=(String)activities.keySet().iterator().next();
            		_bookmarks.removeBookmark(ctx.getProfileID(), Bookmarks.STATISTIC, singleKey);
            		_bookmarks.addBookmark(ctx.getProfileID(), Bookmarks.STATISTIC, activities.get(singleKey), singleKey);
            }
            results=fastStats(activities);
            String weeksBack = ctx.getInputString("weeksBack", false);
        	if (weeksBack!=null)
    		{results.putValue("weeksBack", weeksBack);
        	results.addHashtable("activities", activities);}
    	else
    		{results.putValue("weeksBack", "0");
    		results.addHashtable("activities", activities);}
        	ctx.setReturnValue(results);
            ctx.goToView("enterFastSuccessCriteria");
            	
        }
        
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform enterFastSuccessCriteria ().", e);
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

    public void init() {
        log.debug("InfoBaseController.init()");
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

    boolean inList(String[] list, String value) {
        for (int i = 0; i < list.length; i++) {
            if (list[i].equalsIgnoreCase(value)) return true;
        }
        return false;
    }

    boolean isNullOrEmpty(String string) {
        return !(string != null && string.length() > 0);
    }

	/** @param ctx ActionContext object */
    public void listCampus(ActionContext ctx) {
        final String[] allowedSearchBy = {"name", "city", "state", "country", "zip", "region"};
        try {
            ActionResults results = new ActionResults("listCampus");
            String searchBy = ctx.getInputString("searchby", allowedSearchBy);
            String searchText = ctx.getInputString("searchstring", true);
            String nextView = ctx.getInputString("view", true);
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();

			if (searchBy.equals("country")) {
                String countryCode = CountryCodes.nameToCode(searchText);
                searchText = (countryCode != null) ? countryCode : searchText;
            }
            if (searchText.length() > 0) {
                Collection colTAs = ibt.getCampusListLocator(searchBy, searchText);
                Collection<Hashtable<String, Object>> colOfHashes = new Vector<Hashtable<String, Object>>();
                for (Iterator i = colTAs.iterator(); i.hasNext(); ) {
                    TargetArea ta = (TargetArea)i.next();
                    Hashtable<String, Object> theHash = ObjectHashUtil.obj2hash(ta);
                    //WORKAROUND FOR JSP PAGES THAT ARE LOOKING FOR OLD ID NAME
                    theHash.put("TargetAreaID",ta.getTargetAreaId());
                    colOfHashes.add(theHash);
                }
                results.addCollection("campusinfo", colOfHashes);
            }
            else {
                results.addCollection("campusinfo", new Vector());
            }
            ctx.setReturnValue(results);
            ctx.goToView(nextView);
        }
        catch (Exception e) {
			e.printStackTrace();
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform listCampus().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void listLLMetros(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("listLLMetros");
            String region = ctx.getInputString("region", true);
            User user=new User();
            user.setUsername((String) ctx.getSessionValue("userName"));
            user.select();
            Person person=new Person();
            person.setFk_ssmUserID(user.getUserID());
            person.select();
            results.putValue("personID", person.getPersonID()+"");
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            Collection teams = ibt.getLocalLevelTeamsByRegionExclusive(region);
            results.addCollection("teams", ObjectHashUtil.list(teams));
            ctx.setReturnValue(results);
            ctx.goToView("localLevelMetros");
        } catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform listLLMetros().", e);
        }
    }
    
    /** @param ctx ActionContext object Request parameters: lastname:	Staff person last name */
    public void listStaff(ActionContext ctx) {
        final String[] allowedModes = new String[] { "list", "associate" };
        final String[] allowedSearchBy = new String[] { "lastname", "region" };
        final String[] allowedGroups = new String[] { "locallevel" };

		try {
            ActionResults results = new ActionResults("listStaff");
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            String mode = ctx.getInputString("mode", allowedModes);
            String searchBy = ctx.getInputString("searchby", allowedSearchBy);
            String searchText = ctx.getInputString("searchtext", true);
            if (searchText.length() > 0) {
                results.addCollection("staff", ibt.listStaff(searchBy, searchText));
            } else {
                results.addCollection("staff", new Vector());
            }
            if (mode.equals("list")) {
                results.putValue("mode", "list");
            } else {
                String group = ctx.getInputString("group", allowedGroups);
                results.putValue("mode", "associate");
                results.putValue("group", group);
                results.putValue("groupid", ctx.getInputString("groupid", true));
            }
            ctx.setReturnValue(results);
            ctx.goToView("staffList");
        }
        catch (Exception e) {
            log.error("Failed to perform listStaff().", e);
            ctx.setError();
            ctx.goToErrorView();
        }
    }

    private java.sql.Date parseSimpleDate(String date) throws java.text.ParseException {
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

	private List<Hashtable<String, Object>> populateStatsCalendar(Iterator<Hashtable<String, Object>> enteredStats, List<Hashtable<String, Object>> allDates) {
		SimpleDateFormat sqlFormat = new SimpleDateFormat("dd-MMM-yyyy");
		while (enteredStats.hasNext()) {
			Hashtable<String, Object> row = enteredStats.next();
			for (int cnt = 0; cnt < 16; cnt++) {
				Date begin = (Date)row.get("PeriodBegin");
				if (sqlFormat.format(begin).equals(sqlFormat.format(allDates.get(cnt).get("PeriodBegin"))))
					allDates.set(cnt, row);
			}
		}
		return allDates;
	}
	
	public void checkNewPerson(ActionContext ctx){
    	try{
    		ActionResults results=new ActionResults("checkNewPerson");
    		Hashtable holdPerson=ctx.getHashedRequest();
    		results.addHashtable("holdPerson", holdPerson);
    		Integer personID;
    		Boolean complete=(
    			ctx.getInputString("email")!=null&&(!ctx.getInputString("email").equals(""))&&
    			ctx.getInputString("firstName")!=null&&(!ctx.getInputString("firstName").equals(""))&&
    			ctx.getInputString("lastName")!=null&&(!ctx.getInputString("lastName").equals("")));
    		
    		String email=ctx.getInputString("email")!=null?ctx.getInputString("email"):"";
    		Vector<Person>perps=new Vector<Person>();
    		Vector<Person>suspects=new Vector<Person>();
    		if (complete){
    			perps=InfoBaseModuleHelper.personMatchesByEmail(email);
    			suspects=InfoBaseModuleHelper.personMatchesByNames( holdPerson);
    		}
	    	Boolean unique=((perps.size()<1)&&((suspects.size()<1)||ctx.getInputString("confirmed").equals("confirmed")));
    		if(unique&&complete){
				InfoBaseModuleHelper.saveNewInfoBasePerson(holdPerson);
				
					//showTargetArea(ctx);
				//	
				
			}else{
				if (!complete){
					results.putValue("infoMessage","You must specify a unique email, plus first name and last name.");
				}
				results.addCollection("perps",perps);
				results.addCollection("suspects",suspects);
				results.putValue("teamID",ctx.getInputString("teamID"));
				results.putValue("activityid",ctx.getInputString("activityid"));
				results.putValue("purpose",ctx.getInputString("purpose"));
				ctx.setReturnValue(results);
				ctx.goToView("makePerson"); //back to entry form, with any matches
			}
    	}
    	 catch (Exception e) {
             ctx.setError();
             ctx.goToErrorView();
             log.error("Failed to perform checkNewPerson().", e);
         }
    }
	public void makeNewPerson(ActionContext ctx){
		try{
			ActionResults results=new ActionResults("makeNewPerson");
			results.putValue("teamID",ctx.getInputString("teamID"));
			results.putValue("activityid",ctx.getInputString("activityid"));
			results.putValue("purpose",ctx.getInputString("purpose"));
			ctx.setReturnValue(results);
			ctx.goToView("makePerson");
		
		}
		catch (Exception e) {
		 ctx.setError();
		 ctx.goToErrorView();
		 log.error("Failed to perform makeNewPerson().", e);
		}
	}
	/** @param ctx ActionContext object */
	public void proposeNewTargetArea(ActionContext ctx) {
		try {
			ActionResults results = new ActionResults("proposeNewTargetArea");
			String admin = ctx.getInputString("admin");
			if (admin != null && admin.equalsIgnoreCase("true"))
				results.putValue("admin", "true");
			else
				results.putValue("admin", "false");
			ctx.setReturnValue(results);
			ctx.goToView("targetAreaProposal");
		}
		catch (Exception e) {
			ctx.setError();
			ctx.goToErrorView();
			log.error("Failed to perform proposeNewTargetArea().", e);
		}
	}
	/** @param ctx ActionContext object */
	public void proposeNewLocalLevel(ActionContext ctx) {
		try {
			ActionResults results = new ActionResults("proposeNewLocalLevel");
			String admin = ctx.getInputString("admin");
			if (admin != null && admin.equalsIgnoreCase("true"))
				results.putValue("admin", "true");
			else
				results.putValue("admin", "false");
			ctx.setReturnValue(results);
			ctx.goToView("localLevelProposal");
		}
		catch (Exception e) {
			ctx.setError();
			ctx.goToErrorView();
			log.error("Failed to perform proposeNewLocalLevel().", e);
		}
	}

    /** Called by Controller on reload request */
    public void reload() throws Exception {
        initState();
    }

    /** @param ctx ActionContext object */
    public void removeContact(ActionContext ctx) {
        try {
            String activityId = ctx.getInputString("activityid", true);
            String staffId = ctx.getInputString("staffid");
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			ibt.removeContact(activityId, staffId);
            //showTargetArea(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform removeContact().", e);
        }
    }

    public void removeMin(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("removeMin ");
            String targetAreaId = ctx.getInputString("targetareaid", true);
            String nonCccMinId = ctx.getInputString("noncccminid", true);
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            ibt.removeMin(targetAreaId, nonCccMinId);
            ctx.setReturnValue(results);
            String from = ctx.getInputString("from", true);
            if (from.equals("targetarea")) {
               // showTargetArea(ctx);
            } else {
                showMin(ctx);
            }
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform removeMin().", e);
        }
    }


    /** @param ctx ActionContext object */
    public void removeStaff(ActionContext ctx) {
        try {
            String localLevelId = ctx.getInputString(LOCAL_LEVEL_ID_TOKEN, true);
            String staffId = ctx.getInputString("staffid", true);
   			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            ibt.removeStaff(localLevelId, staffId);
            //showTeam(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform removeStaff().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void saveActivity(ActionContext ctx) {
        try {
            String localLevelId = ctx.getInputString(LOCAL_LEVEL_ID_TOKEN, true);
            String targetAreaId = ctx.getInputString(TARGET_AREA_ID_TOKEN, true);
            String strategy = ctx.getInputString("strategy", true);
            String status = ctx.getInputString("status", true);
            String periodBegin = ctx.getInputString("periodbegin", true);
            String Url = ctx.getInputString("url", true);

            if("none".equals(targetAreaId)) {
            	throw new Exception("Didn't choose a target area.");
            }
            InfoBaseModuleHelper.saveActivityCheck(localLevelId, targetAreaId, strategy, status, periodBegin, ctx.getProfileID(), Url);
            //showTeam(ctx);
        } catch (ActivityExistsException e) {
        	ctx.setError(e.getMessage());
            ctx.goToView("activityError");
        } catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveActivity().", e);
        }
    }

    public void saveAddCampusToMin(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("saveAddCampusToMin");
            String targetAreaId = ctx.getInputString("targetareaid", true);
            String nonCccMinId = ctx.getInputString("noncccminid", true);
   			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			ibt.saveAddCampusToMin(targetAreaId, nonCccMinId);
            ctx.setReturnValue(results);
            showMin(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveAddCampusToMin().", e);
        }
    }

    public void saveAddMinToCampus(ActionContext ctx) {
        try {
            String targetAreaId = ctx.getInputString("targetareaid", true);
            String nonCccMinId = ctx.getInputString("noncccminid", true);

            if("none".equals(nonCccMinId)) {
            	throw new Exception("Didn't choose a ministry.");
            }

   			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			ibt.saveAddMinToCampus(targetAreaId, nonCccMinId);
           // showTargetArea(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveAddMinToCampus().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void saveAddTeamToCampus(ActionContext ctx) {
        try {
            String strategy = ctx.getInputString("strategy", true);
            String targetAreaId = ctx.getInputString("targetareaid", true);
            String localLevelId = ctx.getInputString("locallevelid", true);
            String periodBegin = ctx.getInputString("periodbegin", true);
			String status = null;
			if (strategy.equalsIgnoreCase("CA"))
				status = ctx.getInputString("status", true);
	//		Not needed here?
	//		String url = ctx.getInputString("url", true);
	//		
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			ibt.saveAddTeamToCampus(strategy, targetAreaId, localLevelId, periodBegin, ctx.getProfileID(), status);
         //   showTargetArea(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveAddTeamToCampus().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void saveAssociateStaff(ActionContext ctx) {
        try {
            String localLevelId = ctx.getInputString(LOCAL_LEVEL_ID_TOKEN, true);
            String[] staffIds = ctx.getInputStringArray("staffid");
   			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            ibt.saveAssociateStaff(localLevelId, staffIds);
           // showTeam(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform removeStaff().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void saveContact(ActionContext ctx) {
        try {
            String activityId = ctx.getInputString("activityid", true);
            String staffId = ctx.getInputString("accountno", true);
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            if (ibt.saveContact(staffId, activityId)) {
            	//showTargetArea(ctx);
            } else {
            	String errMsg = "There was an error adding the contact to this movement.  " +
            			"The usual cause of this is either that the contact you attempted to add " +
            			"is already a contact for this movement or that there are already two contacts " +
            			"for this movement.<br /><br />" +
            			"<a href=/servlet/InfoBaseController?action=showTargetArea&targetareaid=" +
            			ctx.getInputString(TARGET_AREA_ID_TOKEN, true) + ">Go Back To Campus Screen.</a>";
            	ctx.setError(errMsg);
            	ctx.goToErrorView();
            }
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveContact().", e);
        }
    }
//public void combBadActivityHistories(ActionContext ctx) {
//	try{
//	ActionResults results=new ActionResults("");
//	
//	
//	Vector<Hashtable<String,String>>badHistories=InfoBaseModuleQueries.getAllActivities();
//	for(Hashtable<String,String> a:badHistories){
//			org.alt60m.ministry.model.dbio.ActivityHistory ah=new org.alt60m.ministry.model.dbio.ActivityHistory();
//			ah.setActivity_id(a.get("activityID"));
//			Vector<org.alt60m.ministry.model.dbio.ActivityHistory>fix=ah.selectList();
//			if(fix.size()>0){
//			org.alt60m.ministry.model.dbio.ActivityHistory[] hist=new org.alt60m.ministry.model.dbio.ActivityHistory[fix.size()];
//			fix.copyInto(hist);
//			Integer pops=hist.length;
//			for(int i=pops-1;i>0;i--){
//				Date startDate=hist[i].getPeriodBegin();
//				Date endDate=hist[i-1].getPeriodEnd();
//				if(startDate!=null&&endDate!=null){
//				
//				
//					
//					
//					
//					
//					if (startDate.toString().equals("2008-08-21")){
//						log.debug(startDate+" to "+endDate);
//						
//						hist[i].setPeriodBegin(endDate);
//						hist[i].persist();
//					}
//					else log.debug(startDate.toString());
//						
//					
//					
//				}
//				}
//			}
//			
//			}
//		
//		
//		
//	}
//	
//	catch (Exception e) {
//        ctx.setError();
//        ctx.goToErrorView();
//        log.error("Failed to perform combBadActivityHistories().", e);
//    }
//}
    /** @param ctx ActionContext object */
    public void saveEditActivity(ActionContext ctx) {
        try {
            String activityId = ctx.getInputString("activityid", true);
            String periodEnd = ctx.getInputString("datechanged", true);

            String Url = ctx.getInputString("url", true);
            String Facebook = ctx.getInputString("facebook", true);
            log.debug("*** URL (Url) in saveEditActivity: " + Url );
            String strategy = ctx.getInputString("strategy", Strategy.strategiesArray());
            String referrer = ctx.getInputString("referrer",
                new String[] { "targetarea", "locallevel" });
            String updateOption = ctx.getInputString("updateoption", true);

            InfoBaseModuleHelper.saveEditActivity(activityId, periodEnd, strategy, updateOption, ctx.getProfileID(), ctx.getInputString("teamid"), Url, Facebook);
           // if (referrer.equals("targetarea"))
             //   showTargetArea(ctx);
           // else
              //  showTeam(ctx);
        }
        catch (ActivityExistsException aee) {
        	ctx.setError("Strategy is already active for this target area.");
            ctx.goToView("activityError");
        }catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveEditActivity().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void saveNewCampus(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("saveNewCampus");
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			ibt.saveNewCampus(ctx.getHashedRequest());
            ctx.setReturnValue(results);
            ctx.goToView("newCampusThankYou");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveNewCampus().", e);
        }
    }

    public void saveNonCCCMin(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("addMinToCampus ");
            String mode = ctx.getInputString("mode",
                new String[] { "add", "update" });
            String nonCccMinId = "";
            String targetAreaId = "";
            if(mode.equals("add")) { targetAreaId = ctx.getInputString("targetareaid", true); }
            else { nonCccMinId = ctx.getInputString("noncccminid", true); }
	    InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
	    ibt.saveNonCCCMin(mode, nonCccMinId, targetAreaId, ctx.getHashedRequest());
//            if (mode.equals("add")) {
//                ctx.setReturnValue(results);
//                showTargetArea(ctx);
//            } else {
//                showMin(ctx);
//            }
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveNonCCCMin().", e);
        }
    }

	/*
	 * @param ctx ActionContext object
	 */
    public void saveRegionalSuccessCriteria(ActionContext ctx) {
        try {
            String mode = ctx.getInputString("mode",
                new String[] { "update", "create" });
            String region = ctx.getInputString("region", true);
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            RegionalStat regionalStat;
            if (mode.equalsIgnoreCase("update")) {
                regionalStat = ibt.getRegionalStatObject(ctx.getInputString("regionalstatid", true));
            } else {
                regionalStat = ibt.createRegionalStatObject();
            }
            ibt.saveRegionalSuccessCriteria(ctx.getHashedRequest(), regionalStat, region, parseSimpleDate(ctx.getInputString("periodbegin", true)), parseSimpleDate(ctx.getInputString("periodend", true)));
            editRegionInfo(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveRegionalSuccessCriteria().", e);
        }
    }

	/** @param ctx ActionContext object */
    public void saveRegionInfo(ActionContext ctx) {
        try {
            String region = ctx.getInputString("region", true);
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			ibt.saveRegionInfo(ctx.getHashedRequest(), region);
            editRegionInfo(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveRegionInfo().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void saveSuccessCriteria(ActionContext ctx) {
    	if (! loginCheck(ctx)) {
    		return;
    	}
        try {
            String activityId = ctx.getInputString("activityid", true);
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            Statistic stat;
            if (ctx.getInputString("statisticid") == null) {
            	stat = new Statistic();
            	stat.setPeriodBegin(DateUtils.parseDate(ctx.getInputString("PeriodBegin")));
            	stat.setActivityId(activityId);
            	if (!stat.select()) {
                    stat = ibt.createStatObject();
                    stat.setActivityId(activityId);
            	}
            } else {
                String statisticId = ctx.getInputString("statisticid", true);
                stat = ibt.getStatObject(statisticId);
			}
			Hashtable request = ctx.getHashedRequest();
			List<String> keys = Arrays.asList(new String[] { "PeriodBegin",
					"PeriodEnd", "PersonalEvangelismExposures",
					"GroupEvangelismExposures", "MediaExposures", "Decisions",
					"Multipliers", "StudentLeaders", "InvolvedStudents",
					"LaborersSent","DecisionsMediaExposures","DecisionsPersonalEvangelismExposures",
					"DecisionsGroupEvangelismExposures","HolySpiritConversations"});
			Map<String, String> statMap = new HashMap<String, String>();
			for (String key : keys) {
				statMap.put(key, (String) request.get(key));
			}
        	String username = (String) ctx.getSessionValue("userName");
        	stat.setUpdatedBy(username);
			ibt.saveStatObjectWithActivity(statMap, stat);
			enterSuccessCriteriaForActivity(ctx);
		} catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveSuccessCriteria().", e);
        }
    }
	public Hashtable<String,Hashtable<String,String>> convertBracketedParamsToHashtable(ActionContext ctx) {
		Hashtable input=(ctx.getHashedRequest());
		
		Hashtable<String,Hashtable<String,String>> output=new Hashtable<String,Hashtable<String,String>>();

    	String content;
    	
    	Iterator getTheKeys=input.keySet().iterator();
    	String theKey;
    	String contentKey;
    	String objectCandidate;
    	Hashtable<String,String> contentCandidate;
    	while(getTheKeys.hasNext())
    	{
    		
    		objectCandidate="";
    		contentCandidate=new Hashtable<String,String>();
    		contentKey="";
    		content="";
    		theKey=(String)(getTheKeys.next());
    		if (theKey.contains("[")&&theKey.contains("]")&&(theKey.indexOf("[")!=0)&&(theKey.indexOf("[")<theKey.indexOf("]")))
    		{
    			
    			
    			objectCandidate=theKey.substring(0,theKey.indexOf("["));
    			
    				content=((String)(ctx.getInputString(theKey)));
    				
    			
    			contentKey=(theKey.substring(theKey.indexOf("[")+1,theKey.indexOf("]")));
    			if(output.keySet().contains(objectCandidate))
	    			{
	    			contentCandidate=new Hashtable<String,String>(output.get(objectCandidate));
	    			contentCandidate.put(contentKey,content);
    				output.put(objectCandidate, contentCandidate);
	    			}
	    			else
	    			{
	    				contentCandidate=new Hashtable<String,String>();
		    			contentCandidate.put(contentKey,content);
	    				output.put(objectCandidate,contentCandidate);
	    			}
    			
    		}
    	}
    	return  output;
	}
	public Boolean isBlank(String string){
		return (
				(string).equals("")
				||
				(string).equals("null")
				||
				(string)==null
				)
				
				;
	}
	public Boolean isBlankOrNonNumeric(String string){
		return (
				(string).replaceAll("[^0123456789]","error").contains("error")
				||
				isBlank(string)
				)
				;
	}
	public Boolean blankEqualsZeroCompare(String string,String compareString){
		if (isBlank(string)){string="0";}
		if (isBlank(compareString)){string="0";}
		return (
				string.equals(compareString)
				)
				;
	}
	
	public void saveFastEventSuccessCriteria(ActionContext ctx) {//IJK
    	if (! loginCheck(ctx)) {
    		return;
    	}
        try {
        	HttpServletRequest tempCtx=ctx.getRequest();
        	ActionResults errorResults=new ActionResults("fast_event_stats_error");
        	Hashtable<String,Hashtable<String,String>> newStats=new Hashtable<String,Hashtable<String,String>>(convertBracketedParamsToHashtable(ctx));
        	log.debug(newStats);
        	Hashtable<String,String> thisStat;
        	Iterator scanStats=(newStats.keySet().iterator());
        	String activityId=ctx.getInputString("activityId");
        	String peopleGroup="";
        	Activity act=new Activity(activityId);
        	act.setStrategy(ctx.getInputString("strategy"));
        	act.persist();
        	Boolean hasData=false;
        	Boolean hasProblem=false;
        	Hashtable<String,String> badSaves=new Hashtable<String,String>();
        	InfoBaseModuleHelper ibt;
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
				ibt = new InfoBaseModuleHelper();
				stat = new Statistic();
				keys = Arrays.asList(new String[] { "PersonalEvangelismExposures",
						"GroupEvangelismExposures", "MediaExposures", "Decisions",
						"Multipliers", "StudentLeaders", "InvolvedStudents",
						"LaborersSent", "PeopleGroup", "DecisionsMediaExposures","DecisionsPersonalEvangelismExposures",
						"DecisionsGroupEvangelismExposures","HolySpiritConversations", "Seekers" });
				 statMap = new HashMap<String, String>();
				for (String key : keys) 
				{
					statMap.put(key, (String) thisStat.get(key));	
				}
	        	
				
		            statisticId = thisStat.get("statisticid");
		            stat = ibt.getStatObject(statisticId);
		            
					username = (String) ctx.getSessionValue("userName");
		        	stat.setUpdatedBy(username);
		        	ibt.saveStatObjectWithActivity(statMap, stat);
	        	
			}
        	
        		String redirect=ctx.getInputString("redirect");
    			redirect=redirect.replace("%and%", "&");
    			redirect=redirect.replace("%question%", "?");
    			log.debug("redirecting to: "+redirect);
    			ctx.getResponse().sendRedirect(redirect);
        		
        }catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveFastEventSuccessCriteria().", e);
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
        	Hashtable<String,String> badSaves=new Hashtable<String,String>();
        	InfoBaseModuleHelper ibt;
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
				ibt = new InfoBaseModuleHelper();
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
        		ctx.goToView("staffHome"); }
        	else{ //if non-numerical input
        		ActionResults results=new ActionResults();
        		Hashtable<String,String> activities=new Hashtable<String,String>();
        		
        		results=fastStats(badSaves);
            	results.addHashtable("activities",badSaves);
        		String weeksBack = ctx.getInputString("weeksBack", false);
            	if (weeksBack!=null)
        		{results.putValue("weeksBack", weeksBack);}
            	else
        		{results.putValue("weeksBack", "0");}
            	results.putValue("message", "You entered non-numerical data in these movements; please try again.");
            	ctx.setReturnValue(results);
                ctx.goToView("enterFastSuccessCriteria");
        	}
        }catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveFastSuccessCriteria().", e);
        }
    }
    
    private boolean loginCheck(ActionContext ctx) {
		String username = (String) ctx.getSessionValue("userName");
		if (username == null) {
			ctx.goToView("login");
			return false;
		}
		return true;
	}
    public void showHeatMap(ActionContext ctx){
    	try{
    		ActionResults results=new ActionResults("heat map");
    		InfoBaseModuleHelper ibt=new InfoBaseModuleHelper();
    		Hashtable<String,Integer> enrollment=new Hashtable<String,Integer>();
    		
    		results.addHashtable("enrollment", enrollment);
    		ctx.setReturnValue(results);
            ctx.goToView("heatMap");
    	 }catch (Exception e) {
             ctx.setError();
             ctx.goToErrorView();
             log.error("Failed to perform showHeatMap().", e);
         }
    }
    
	/** @param ctx ActionContext object */
    public void saveTargetAreaInfo(ActionContext ctx) {
        try {
            String targetAreaId = ctx.getInputString(TARGET_AREA_ID_TOKEN, true);
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            ibt.saveTargetAreaInfo(ctx.getHashedRequest(), targetAreaId);
        //    showTargetArea(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveTargetAreaInfo().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void saveTeam(ActionContext ctx) {
        try {
            String mode = ctx.getInputString("mode",
                new String[] { "add", "update" });
            String from;
            String localLevelId = null;
            if (ctx.getInputString("locallevelid")!=null) { localLevelId = ctx.getInputString("locallevelid", true); }
  			InfoBaseModuleHelper.saveTeam(ctx.getHashedRequest(), localLevelId, mode);
            if (mode.equals("add")) {
                from = ctx.getInputString("from", true);
                if (from.equals("localLevelMetros")) {
                    addTeamToRegion(ctx);
                } else {
                    addTeamToCampus(ctx);
                }
            } //else {
              //  showTeam(ctx);
            //}
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveTeam().", e);
        }
    }

    
    public Vector<String> sortOrderFromRequest(ActionContext ctx){
    	TreeMap<String,String> sortOrder=new TreeMap<String,String>(convertBracketedParamsToHashtable(ctx).get("order")); //TreeMap is like a hashtable sorted by keys' natural order
        Vector<String> order=new Vector<String>();
        for (String key : sortOrder.keySet()){//we dump the sort-by's according to the alpha order of their keys order[a],order[b],order[c] etc.
     	   order.add(sortOrder.get(key));
        }
        return order;
    }
    
    public void showMuster(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("showCampusCountReport");
            String type=ctx.getInputString("type");
            String region=ctx.getInputString("region");
            String periodEndYear=ctx.getInputString("periodEndYear");
            String periodEndMonth=ctx.getInputString("periodEndMonth");
            String periodEnd=periodEndYear+"/"+periodEndMonth+"/31";
            String strategyList="";
            Collection strategies;
        	if(ctx.getInputString("strategyList")==null){
        		String[] strategiesArray = ctx.getInputStringArray("strategies");
    	    	for (String temp : strategiesArray)strategyList += "'" + temp +"', ";
    	    	strategyList=strategyList.substring(0,strategyList.length()-2);//trim final comma
        	}
        	else
        	{
        		strategyList=ctx.getInputString("strategyList");
        		 strategies=Arrays.asList(strategyList.replace("'","").split(","));
        	}
        	
        	String report=org.alt60m.ministry.servlet.Reports.getMuster(type, region, periodEnd, strategyList, sortOrderFromRequest(ctx),org.alt60m.ministry.servlet.UnlockCampus.keys((String)ctx.getSessionValue("userName")));
            results.putValue("report",report);
            
           report=null;
           results.putValue("type", type);
           results.putValue("strategyList", strategyList);
           results.putValue("region", region);
           results.putValue("userName",(String)ctx.getSessionValue("userName"));
           results.addCollection("order", sortOrderFromRequest(ctx));
            ctx.setReturnValue(results);
            results=null;
           ctx.goToView("showMuster");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform showMuster().", e);
        }
    }
    
    
    public void moveTeamMember(ActionContext ctx) {
        try {
            String teamID = ctx.getInputString("teamID", true);
            String personID = ctx.getInputString("personID", true);
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            ibt.moveTeamMember(personID, teamID);
          //  showTeam(ctx);
            
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveTeamMember().", e);
        }
    }
    /** @param ctx ActionContext object */
    public void showCampusCountReport(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("showCampusCountReport");
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.YEAR, -1);
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            results.putValue("activitycount", String.valueOf(ibt.getActivityCount()));
            results.putValue("activitycountcurrent", String.valueOf(ibt.getActivityCountCurrent()));
            results.putValue("reportedcount", String.valueOf(ibt.getReportedCnt(cal.getTime())));
            ctx.setReturnValue(results);
            ctx.goToView("campusCountReport");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform showCampusCountReport().", e);
        }
    }
    public static String getUsersPersonId(ActionContext ctx){
    	org.alt60m.security.dbio.model.User user=new org.alt60m.security.dbio.model.User();
		user.setUsername((String)ctx.getSessionValue("userName"));
		user.select();
		org.alt60m.ministry.model.dbio.Person person=new org.alt60m.ministry.model.dbio.Person();
		person.setFk_ssmUserID(user.getUserID());
		person.select();
		return person.getPersonID()+"";
    }
    /** @param ctx ActionContext object Request parameters: <none> */
    public void index(ActionContext ctx) {
        try {
        	ActionResults result=new ActionResults("IB index");
        	String id=(String)ctx.getSessionValue("home")!=null?(String)ctx.getSessionValue("home"):"";
        	if(id.equals("search")){
        		log.debug("search");
    			Hashtable search=InfoBaseModuleHelper.sessionSearch(ctx);
    			Section list=InfoBaseModuleHelper.getSearchResults((String)search.get("type"),(String)search.get("name"),(String)search.get("city"),(String)search.get("state"),(String)search.get("region"));
    			Vector<Section> content=new Vector<Section>();
    			content.add(list);
    			result.addCollection("content",content);
    			result.putValue("mode","list");
    		}
        	
    		result.putValue("personID",getUsersPersonId(ctx));
    		result.addHashtable("search",InfoBaseModuleHelper.sessionSearch(ctx));
    		result.putValue("module",this.module);
    		result.putValue("title",this.title);
    		ctx.setReturnValue(result);
    		
        	ctx.goToView("index");
        }
        catch (Exception e) {
            ctx.goToErrorView();
            log.error("Failed to perform showIndex().", e);
        }
    }

    public void showMin(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("showTeam");
            String ministryId = ctx.getInputString("noncccminid", true);
   			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            NonCccMin ministry = ibt.getNonCccMin(ministryId);
            results.addHashtable("ministry", ObjectHashUtil.obj2hash(ministry));
            Collection nonCccMinInfo = ObjectHashUtil.list(ministry.getOtherMinistries());
            results.addCollection("target", nonCccMinInfo);
            ctx.setReturnValue(results);
            ctx.goToView("minInfo");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform showMin().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void showReport(ActionContext ctx) {
        try {
        	ActionResults results=new ActionResults("showReport");
        	Collection strategies=(Collection)convertBracketedParamsToHashtable(ctx).get("strategies").keySet();
        	Iterator stratIter=strategies.iterator();
        	while (stratIter.hasNext()){
        		results.putValue((String)stratIter.next(),"true");//I rearranged the input coming from the .jsp form so this puts it back to the bad old way.
        	}
        	String type = ctx.getInputString("type", _reportTypes);
        	if (!(type.equals("targetarea"))&&!(type.equals("locallevel"))) results.addHashtable("census", InfoBaseModuleQueries.getActivityCountByRegionAndStrategies(ctx.getInputString("region"), strategies)); //runs two queries	
        	ctx.setReturnValue(results);
        	
             if (type.equals("targetarea")) {
                 ctx.goToView("reportDisplayDetail");
             } else {
                 ctx.goToView("reportDisplay");
             }
            
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform showReport().", e);
        }
    }

    public void showReportAgile(ActionContext ctx){
    	try{
    		ActionResults results=new ActionResults();
    	String type = ctx.getInputString("type", _reportTypes);
    	String region= ctx.getInputString("region");
    	String teamID=ctx.getInputString("teamID");
    	String targetAreaId=ctx.getInputString("targetareaid");
    	String fromYear=ctx.getInputString("fromyear");
    	String fromMonth=ctx.getInputString("frommonth");
    	String periodBegin = "'"+fromYear + "/" + fromMonth+"/01'";
    	Integer toYear=Integer.parseInt(ctx.getInputString("toyear"));
    	Integer toMonth=Integer.parseInt(ctx.getInputString("tomonth"));
    	if(ctx.getInputString("strategyList")==null){//this tells us it's from the checkbox page, so we move up the date to the first of the next month
	    	if (toMonth.equals(12)){ //we want to cut off stats on the first of the subsequent month, so we rule out invalid months first
	    		toYear+=1;
	    		toMonth=1;
	    	}
	    	else
	    	{
	    		toMonth+=1;
	    	}
    	}
    	String periodEnd = "'"+toYear.toString() + "/" + toMonth.toString()+"/01'";
    	String strategyList = "";
    	String temp="";
    	Collection strategies;
    	if(ctx.getInputString("strategyList")==null){
    		String[] strategiesArray = ctx.getInputStringArray("strategies");
	    	for (String strat : strategiesArray)strategyList += "'" + strat +"',";
	    	strategyList=strategyList.substring(0,strategyList.length()-1);//trim final comma
    	}
    	else
    	{
    		strategyList=ctx.getInputString("strategyList");
    		 strategies=Arrays.asList(strategyList.replace("'","").split(","));
    	}
    	if ((strategyList.length()>0)&&(!strategyList.contains("'EV'")))strategyList+=",'EV'";
    	Vector<ReportRow> report=org.alt60m.ministry.servlet.Reports.getSuccessCriteriaReport( type,  region,  strategyList,  periodEnd,  periodBegin,  teamID, targetAreaId);
    	results.putValue("type", type);
    	results.putValue("region", region);
    	results.putValue("teamID", teamID);
    	results.putValue("fromyear", fromYear);
    	results.putValue("frommonth", fromMonth);
    	results.putValue("toyear", toYear.toString());
    	results.putValue("tomonth", toMonth.toString());
    	results.putValue("periodBegin",  fromMonth+ "/1/" + fromYear);
    	results.putValue("periodEnd",  toMonth+ "/1/" + toYear);
    	results.putValue("strategyList", strategyList);
    	results.addCollection("report", report);
    	ctx.setReturnValue(results);
    	ctx.goToView("reportDisplayAgile");
    	}
    	catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform showReportAgile().", e);
        }
    }
    
    

    /** @param ctx ActionContext object */
    public void showSuccessCriteriaHome(ActionContext ctx) {
        try {
            ctx.goToView("successCriteriaHome");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform showSuccessCriteriaHome().", e);
        }
    }

    
    protected String isRD(Person person)
    {
    	
        String personID = person.getPersonID()+"";
        String isRD="false";
        LocalLevel lab=new LocalLevel(); //LAB members are honorary RDees!!
        lab.setName("The LAB");
        lab.setRegion("NC");
        lab.select();
        Vector<Hashtable<String,Object>> labMembers=InfoBaseModuleQueries.getTeamMembers(lab.getLocalLevelId()).getRows();
        for (Hashtable<String,Object> c:labMembers){
        	if((c.get("id").equals(personID))){
        		log.debug("The LAB!");
        		isRD="true";
        	}
        	
        }
       
       Staff staff=new Staff(person.getAccountNo());
       if (staff.getJobTitle().contains("Regional Director")){
    	   log.debug("Real RDee!");
   			isRD="true";
   			
       }
       return isRD;
    }
    
    
	/** @param ctx ActionContext object */
	public void submitNewTargetAreaRequest(ActionContext ctx) {
		try {
			String to = ctx.getInputString("to", true);
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			boolean admin = (ctx.getInputString("admin") != null && ctx.getInputString("admin").equalsIgnoreCase("true"));
			if (isNullOrEmpty(ctx.getInputString("name")) || isNullOrEmpty(ctx.getInputString("city")) ||
				isNullOrEmpty(ctx.getInputString("country")) || isNullOrEmpty(ctx.getInputString("isSecure")) ||
				isNullOrEmpty(ctx.getInputString("from"))) {
					ctx.goToView("targetAreaProposalError");
			} else { // required fields OK
				Hashtable request = ctx.getHashedRequest();
				if (!admin) {
					ibt.sendTargetAreaRequestEmail(request, to, ctx.getProfileID());
				} else {
					ibt.createNewTargetArea(request);
				}
				ctx.goToView("targetAreaProposalThankYou");
			}
		}
		catch (Exception e) {
			ctx.setError();
			ctx.goToErrorView();
			log.error("Failed to perform submitNewTargetAreaRequest().", e);
		}
	}

	/** @param ctx ActionContext object */
	public void submitNewLocalLevelRequest(ActionContext ctx) {
		try {
			String to = ctx.getInputString("to", true);
			InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			boolean admin = (ctx.getInputString("admin") != null && ctx.getInputString("admin").equalsIgnoreCase("true"));
			Hashtable request = ctx.getHashedRequest();
			if (!admin) {
				ibt.sendLocalLevelRequestEmail(request, to, ctx.getProfileID());
			} else {
				InfoBaseModuleHelper.saveTeam(request, null, null);
			}
			ctx.goToView("localLevelProposalThankYou");
		}
		catch (Exception e) {
			ctx.setError();
			ctx.goToErrorView();
			log.error("Failed to perform submitNewLocalLevelRequest().", e);
		}
	}

    private String translate(String[] from, String[] to, String word) {
        for (int i = 0; i < from.length; i++)
            if (word.equals(from[i]))
                return to[i];
        return word;
    }
 
}