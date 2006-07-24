package org.alt60m.ministry.servlet;

import java.util.*;
import java.text.*;
import org.apache.log4j.*;
import org.alt60m.servlet.*;
import org.alt60m.staffSite.bean.dbio.Bookmarks;
import org.alt60m.ministry.Regions;
import org.alt60m.util.*;
import org.alt60m.ministry.model.dbio.*;
import org.alt60m.staffSite.model.dbio.*;
import org.alt60m.ministry.*;

/**
 * Web controller for InfoBase History: 4/10/01	MDP	Initial Coding Completeness (0 - 5): 3 Known Issues:<p>
 * refactoring and repackaging 5/23/03 MAB
 * @author  Mark Petrotta
 * @version 1.0
 */
public class InfoBaseController extends Controller {

    class StaffByRegionCache {
        Date lastUpdated;
		Hashtable staffByRegion = new Hashtable();
    }
    private final String[] _abbrevRegion = new String[] { "NE", "MA", "MS", "SE", "GL", "UM", "GP", "RR", "NW", "SW" };

    private final String[] _abbrevStrategy = new String[] { "CA", "SC", "IE", "ID", "II", "WI", "WS", "BR", "MM", "AA", "GR", "CL", "KC" };

    private Bookmarks _bookmarks;
    private final String[] _expandRegion = new String[] { "Northeast", "Mid-Atlantic", "MidSouth", "Southeast", "Great Lakes", "Upper Midwest", "Great Plains Int'l", "Red River", "Greater Northwest", "Pacific Southwest" };
    private final String[] _expandStrategy = new String[] { "Catalytic", "Staffed Campus", "ESM-Epic", "ESM-Destino", "ESM-Impact", "WSN ICS", "WSN STInt", "Bridges", "Military Ministry", "AIA", "Grad Resources", "CLM (Christian Leadership U)", "Korean CCC" };

    final String[] _reportTypes = new String[] { "locallevel", "targetarea", "regional", "national" };
    private final String LOCAL_LEVEL_ID_TOKEN = "locallevelid";
    private final String TARGET_AREA_ID_TOKEN = "targetareaid";

    public InfoBaseController() {
        log.debug("InfoBaseController constructor");
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
   			InfoBaseTool ibt = new InfoBaseTool();
            LocalLevel ll = ibt.getLocalLevelTeam(localLevelId);
            results.putValue("teamName", ll.getName());
            Collection tasInRegion = ibt.getTargetAreasByRegion(ll.getRegion());
            Vector tasInRegionHash = new Vector();
            for (Iterator iTA = tasInRegion.iterator(); iTA.hasNext(); ) {
                TargetArea ta = (TargetArea)iTA.next();
                Iterator activitiesIter = ta.getActivities().iterator();
                boolean addCampus = true;
                while (activitiesIter.hasNext()) {
                	 Activity act = (Activity)activitiesIter.next();
                	 if (act.getStrategy().equals(strategy) && !act.getStatus().equals("IN")) {
                	 	addCampus = false;
                	 	break;
                	 }
                }
                if (addCampus) {
                	tasInRegionHash.add(ObjectHashUtil.obj2hash(ta));
                }
            }
            results.addCollection("campuses", tasInRegionHash);
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
                Vector v = InfoBaseQueries.getNonSecureTargetAreasByName(partialName);
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
    public void addContact(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("addContact");
            InfoBaseTool ibt = new InfoBaseTool();
            String mode = ctx.getInputString("mode", true);
            String parameter = ctx.getInputString(mode, true);
            if (parameter.length() > 2)
                parameter += "%";
            String activityId = ctx.getInputString("activityid", true);
            String targetAreaId = ctx.getInputString("targetareaid", true);
            Collection colStaff;
            if ("region".equalsIgnoreCase(mode)) {
                colStaff = ibt.listStaffByRegionSQL(parameter.toUpperCase());
            } else {
                colStaff = ibt.listStaffHashByLastName(parameter.toUpperCase());
            }
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
			e.printStackTrace();
			ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform addContact().", e);
        }
    }


    public void addMinToCampus(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("addTeamToCampus ");
			InfoBaseTool ibt = new InfoBaseTool();
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
			InfoBaseTool ibt = new InfoBaseTool();

            String targetAreaId = ctx.getInputString(TARGET_AREA_ID_TOKEN, true);
            String strategy = ctx.getInputString("strategy", true);
            String from = ctx.getInputString("from", true);

			java.util.GregorianCalendar today = new java.util.GregorianCalendar();
            java.text.SimpleDateFormat headerFormatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
            results.putValue("date", headerFormatter.format(today.getTime()));
            results.putValue("strategy", strategy);

            TargetArea target = ibt.getTargetArea(targetAreaId);

            Collection teams = ibt.getLocalLevelTeamsByRegion(target.getRegion()!=null?target.getRegion():"");
            Vector hashedTeams = new Vector();

            for (Iterator iTeams = teams.iterator(); iTeams.hasNext(); ) {
                LocalLevel ll = (LocalLevel)iTeams.next();
                Hashtable hash = ObjectHashUtil.obj2hash(ll);
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
			InfoBaseTool ibt = new InfoBaseTool();
            java.util.GregorianCalendar today = new java.util.GregorianCalendar();
            java.text.SimpleDateFormat headerFormatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
            results.putValue("date", headerFormatter.format(today.getTime()));
            String searchText = ctx.getInputString("Region", true);
            Collection hashedTeams = ObjectHashUtil.list(ibt.getLocalLevelTeamsByRegion(searchText));
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

    private Hashtable[] blankStatsCalendar(String statId) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		calendar.add(Calendar.WEEK_OF_YEAR, -15);
		Hashtable[] allDates = new Hashtable[16];
		for (int cnt = 0; cnt < 16; cnt++) {
			Hashtable noEntry = new Hashtable();
			noEntry.put("PeriodBegin", calendar.getTime());
			calendar.add(Calendar.DAY_OF_MONTH, 6);
			noEntry.put("PeriodEnd", calendar.getTime());
			calendar.add(Calendar.DAY_OF_MONTH, 1);
			noEntry.put(statId, "");
			allDates[cnt] = noEntry;
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

    /** @param ctx ActionContext object */
    public void changeBookmark(ActionContext ctx) {
        try {
            String type = ctx.getInputString("type", new String[] { "targetarea", "locallevel", "statistic" });
            String mode = ctx.getInputString("mode", new String[] { "add", "remove" });
            log.debug("current user: " + ctx.getProfileID());
            if (mode.equals("remove")) {
                String bookmarkID = ctx.getInputString("bookmarkid", true);
                _bookmarks.removeBookmark(bookmarkID);
            } else {
                String displayName = ctx.getInputString("displayname", true);
                if (type.equals("targetarea")) {
                    _bookmarks.addBookmark(ctx.getProfileID(),
                        Bookmarks.TARGET_AREA, displayName, ctx.getInputString("targetareaid", true));
                } else if (type.equals("locallevel")) {
                    _bookmarks.addBookmark(ctx.getProfileID(),
                        Bookmarks.LOCAL_LEVEL, displayName, ctx.getInputString("locallevelid", true));
                } else if (type.equals("statistic")) {
                    _bookmarks.addBookmark(ctx.getProfileID(),
                        Bookmarks.STATISTIC, displayName, ctx.getInputString("activityid", true));
                }
            }
            if (mode.equals("add"))
                ctx.goToView("bookmarkConfirm");
            else {
                if (type.equals("targetarea"))
                    showTargetArea(ctx);
                else if (type.equals("locallevel"))
                    showTeam(ctx);
                else {
                    enterSuccessCriteriaForActivity(ctx);
                }
            }
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform changeBookmark().", e);
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
                results.putValue("fromMonth", Integer.toString(cal.get(Calendar.MONTH) + 1));
                results.putValue("toMonth", Integer.toString(cal.get(Calendar.MONTH) + 1));
                results.putValue("fromYear", Integer.toString(cal.get(Calendar.YEAR) - 1));
                results.putValue("toYear", Integer.toString(cal.get(Calendar.YEAR)));
                results.putValue("type", type);
                ctx.setReturnValue(results);
                ctx.goToView("setReportCriteria");
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
            InfoBaseTool ibt = new InfoBaseTool();
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
            InfoBaseTool ibt = new InfoBaseTool();
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
        final String[] allowedSearchBy = {"name", "city", "state", "country", "zip", "region"};
        try {
            ActionResults results = new ActionResults("listCampus");
            String searchBy = ctx.getInputString("searchby", allowedSearchBy);
            String searchText = ctx.getInputString("searchstring", true);
            String nextView = ctx.getInputString("view", true);
			InfoBaseTool ibt = new InfoBaseTool();
						
			if (searchBy.equals("country")) {
                String countryCode = CountryCodes.nameToCode(searchText);
                searchText = (countryCode != null) ? countryCode : searchText;
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
    public void editActivity(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("editActivity");
   			InfoBaseTool ibt = new InfoBaseTool();
            String referrer = ctx.getInputString("referrer",
                new String[] { "targetarea", "locallevel" });
            String activityId = ctx.getInputString("activityid", true);
            String targetAreaId = ctx.getInputString("targetareaid", true);
            String strategy = ctx.getInputString("strategy", true);
            String status = ctx.getInputString("status", true);
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
       			InfoBaseTool ibt = new InfoBaseTool();
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
            InfoBaseTool ibt = new InfoBaseTool();
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
            InfoBaseTool ibt = new InfoBaseTool();
			RegionalTeam regionalTeam = ibt.getRegionalTeam(region);

			Hashtable regionalHash = ObjectHashUtil.obj2hash(regionalTeam);
            results.addHashtable("regionalteam", regionalHash);
            
			Hashtable[] allDates = blankStatsCalendar("RegionalStatId");
			Collection c = ibt.getRegionalStats(region, allDates);
            allDates = populateStatsCalendar(c.iterator(), allDates);

			SimpleDateFormat shortFormat = new SimpleDateFormat("M/dd");
            SimpleDateFormat fullFormat = new SimpleDateFormat("MM/dd/yyyy");
            for (int cnt = 0; cnt < 16; cnt++) {
                Hashtable row = allDates[cnt];
                row.put("PeriodBeginShort", shortFormat.format(row.get("PeriodBegin")));
                row.put("PeriodEndShort", shortFormat.format(row.get("PeriodEnd")));
                row.put("PeriodBegin", fullFormat.format(row.get("PeriodBegin")));
                row.put("PeriodEnd", fullFormat.format(row.get("PeriodEnd")));
            }

            results.addCollection("regionalInfo", Arrays.asList(allDates));
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
			InfoBaseTool ibt = new InfoBaseTool();
            String targetAreaId = ctx.getInputString("targetareaid", true);
            String activityId = ctx.getInputString("activityid", true);
            String statisticId = ctx.getInputString("statisticid", false);
			String lastStatId = ctx.getInputString("laststatid", false);
            results.putValue("targetareaid", targetAreaId);
            results.putValue("activityid", activityId);
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
            InfoBaseTool ibt = new InfoBaseTool();
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
	   			InfoBaseTool ibt = new InfoBaseTool();
                Hashtable ll = ObjectHashUtil.obj2hash(ibt.getLocalLevelTeam(localLevelId));
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

    private Hashtable emulateOldStaffStructure(Staff staff) throws Exception {
        Hashtable staffHash = ObjectHashUtil.obj2hash(staff);
        OldAddress pa = staff.getPrimaryAddress();
        if (pa != null) {
            staffHash.put("Address1", pa.getAddress1());
            staffHash.put("Address2", pa.getAddress2());
            staffHash.put("Address3", pa.getAddress3());
            staffHash.put("Address4", pa.getAddress4());
            staffHash.put("City", pa.getCity());
            staffHash.put("State", pa.getState());
            staffHash.put("Zip", pa.getZip());
            staffHash.put("Country", pa.getCountry());
        } else {
            staffHash.put("Address1", "");
            staffHash.put("Address2", "");
            staffHash.put("Address3", "");
            staffHash.put("Address4", "");
            staffHash.put("City", "");
            staffHash.put("State", "");
            staffHash.put("Zip", "");
            staffHash.put("Country", "");
        }
        return staffHash;
    }

    /** @param ctx ActionContext object */
    public void enterSuccessCriteria(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("enterSuccessCriteria ");
			InfoBaseTool ibt = new InfoBaseTool();
            String activityId = ctx.getInputString("activityid", true);
            Activity activity = ibt.getActivityObject(activityId);
            TargetArea targetArea = activity.getTargetArea();
            String targetAreaId = targetArea.getTargetAreaId();
            results.putValue("targetareaid", targetAreaId);
            results.putValue("activityid", activityId);            
			results = getBookmarks(ctx, results, Bookmarks.STATISTIC, activityId);
            results.putValue("displayname", targetArea.getName());
			Hashtable[] allDates = blankStatsCalendar("StatisticId");
			Collection stats = ibt.getTargetAreaStats(targetAreaId, allDates);
            Collection hashedStats = ObjectHashUtil.list(stats);
            allDates = populateStatsCalendar(hashedStats.iterator(), allDates);

			SimpleDateFormat shortFormat = new SimpleDateFormat("M/dd");
            SimpleDateFormat fullFormat = new SimpleDateFormat("MM/dd/yyyy");
            for (int cnt = 0; cnt < 16; cnt++) {
                Hashtable row = allDates[cnt];
                row.put("PeriodBeginShort", shortFormat.format(row.get("PeriodBegin")));
                row.put("PeriodEndShort", shortFormat.format(row.get("PeriodEnd")));
                row.put("PeriodBegin", fullFormat.format(row.get("PeriodBegin")));
                row.put("PeriodEnd", fullFormat.format(row.get("PeriodEnd")));
            }

            results.addCollection("statistics", Arrays.asList(allDates));
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
            InfoBaseTool ibt = new InfoBaseTool();
            String activityId = ctx.getInputString("activityid", true);
            Activity activity = ibt.getActivityObject(activityId);
            List strategies = new Vector();
            strategies.add(activity.getStrategy());
            TargetArea targetArea = activity.getTargetArea();
            String targetAreaId = targetArea.getTargetAreaId();
            if(targetAreaId==null || targetAreaId.equals(""))
            {
            	throw new MissingTargetAreaIdException();
            }
            results.putValue("targetareaid", targetAreaId);
            results.putValue("activityid", activityId);
            results = getBookmarks(ctx, results, Bookmarks.STATISTIC, activityId);
            results.putValue("displayname", targetArea.getName());
            Hashtable[] allDates = blankStatsCalendar("StatisticId");
            Collection stats = ibt.getTargetAreaStats(targetAreaId, allDates, strategies);
            allDates = populateStatsCalendar(stats.iterator(), allDates);

            SimpleDateFormat shortFormat = new SimpleDateFormat("M/dd");
            SimpleDateFormat fullFormat = new SimpleDateFormat("MM/dd/yyyy");
            for (int cnt = 0; cnt < 16; cnt++) {
                Hashtable row = allDates[cnt];
                row.put("PeriodBeginShort", shortFormat.format(row.get("PeriodBegin")));
                row.put("PeriodEndShort", shortFormat.format(row.get("PeriodEnd")));
                row.put("PeriodBegin", fullFormat.format(row.get("PeriodBegin")));
                row.put("PeriodEnd", fullFormat.format(row.get("PeriodEnd")));
            }
            results.addCollection("statistics", Arrays.asList(allDates));

            ctx.setReturnValue(results);
            ctx.goToView("enterSuccessCriteria");
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

	private ActionResults getBookmarks(ActionContext ctx, ActionResults results, int type, String id) throws Exception {
		StaffSitePref p = _bookmarks.getBookmark(ctx.getProfileID(), type, id);
		if (p != null)
			results.putValue("bookmarkID", p.getStaffSitePrefID());
		else
			results.putValue("bookmarkID", "");
		return results;
	}

    // *************************************************************************
    // Expectatations:
    //		
    //	Returns:
    //		
    // History:
    //		3/19/01		MDP		Initial coding
    // *************************************************************************
    public void init() {
        log.debug("InfoBaseController.init()");
        try {
            initState();
        } catch (Exception e) {
            log.fatal("Failed to init!", e);
        }
    }

    private void initState() throws Exception {
        initViews(getServletContext().getRealPath("/WEB-INF/InfoBaseViews.xml"));
        setDefaultAction("showIndex");
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
			InfoBaseTool ibt = new InfoBaseTool();
						
			if (searchBy.equals("country")) {
                String countryCode = CountryCodes.nameToCode(searchText);
                searchText = (countryCode != null) ? countryCode : searchText;
            }
            if (searchText.length() > 0) {
                Collection colTAs = ibt.getCampusListLocator(searchBy, searchText);
                Collection colOfHashes = new Vector();
                for (Iterator i = colTAs.iterator(); i.hasNext(); ) {
                    TargetArea ta = (TargetArea)i.next();
                    Hashtable theHash = ObjectHashUtil.obj2hash(ta);
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
			InfoBaseTool ibt = new InfoBaseTool();
            Collection teams = ibt.getLocalLevelTeamsByRegion(region);
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
			InfoBaseTool ibt = new InfoBaseTool();
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
			e.printStackTrace();
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform listStaff().", e);
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

	private Hashtable[] populateStatsCalendar(Iterator enteredStats, Hashtable[] allDates) {
		SimpleDateFormat sqlFormat = new SimpleDateFormat("dd-MMM-yyyy");
		while (enteredStats.hasNext()) {
			Hashtable row = (Hashtable)enteredStats.next();
			for (int cnt = 0; cnt < 16; cnt++) {
				Date begin = (Date)row.get("PeriodBegin");
				if (sqlFormat.format(begin).equals(sqlFormat.format(allDates[cnt].get("PeriodBegin"))))
					allDates[cnt] = row;
			}
		}
		return allDates;	
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
            InfoBaseTool ibt = new InfoBaseTool();
			ibt.removeContact(activityId, staffId);
            showTargetArea(ctx);
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
			InfoBaseTool ibt = new InfoBaseTool();
            ibt.removeMin(targetAreaId, nonCccMinId);
            ctx.setReturnValue(results);
            String from = ctx.getInputString("from", true);
            if (from.equals("targetarea")) {
                showTargetArea(ctx);
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
   			InfoBaseTool ibt = new InfoBaseTool();
            ibt.removeStaff(localLevelId, staffId);
            showTeam(ctx);
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
            
            if("none".equals(targetAreaId)) {
            	throw new Exception("Didn't choose a target area.");
            }
            
   			InfoBaseTool ibt = new InfoBaseTool();
			ibt.saveActivity(localLevelId, targetAreaId, strategy, status, periodBegin);
            showTeam(ctx);
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
   			InfoBaseTool ibt = new InfoBaseTool();
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
            
   			InfoBaseTool ibt = new InfoBaseTool();
			ibt.saveAddMinToCampus(targetAreaId, nonCccMinId);
            showTargetArea(ctx);
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
			InfoBaseTool ibt = new InfoBaseTool();
			ibt.saveAddTeamToCampus(strategy, targetAreaId, localLevelId, periodBegin, ctx.getProfileID(), status);
            showTargetArea(ctx);
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
   			InfoBaseTool ibt = new InfoBaseTool();
            ibt.saveAssociateStaff(localLevelId, staffIds);
            showTeam(ctx);
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
            InfoBaseTool ibt = new InfoBaseTool();
            ibt.saveContact(staffId, activityId);
            showTargetArea(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveContact().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void saveEditActivity(ActionContext ctx) {
        try {
            String activityId = ctx.getInputString("activityid", true);
            String periodEnd = ctx.getInputString("datechanged", true);
            String strategy = ctx.getInputString("strategy", _abbrevStrategy);
            String referrer = ctx.getInputString("referrer",
                new String[] { "targetarea", "locallevel" });
            String updateOption = ctx.getInputString("updateoption", true);
   			
            InfoBaseTool.saveEditActivity(activityId, periodEnd, strategy, updateOption, ctx.getProfileID(), ctx.getInputString("teamid"));
            if (referrer.equals("targetarea"))
                showTargetArea(ctx);
            else
                showTeam(ctx);
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
			InfoBaseTool ibt = new InfoBaseTool();
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
	    InfoBaseTool ibt = new InfoBaseTool();
	    ibt.saveNonCCCMin(mode, nonCccMinId, targetAreaId, ctx.getHashedRequest());
            if (mode.equals("add")) {
                ctx.setReturnValue(results);
                showTargetArea(ctx);
            } else {
                showMin(ctx);
            }
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
            InfoBaseTool ibt = new InfoBaseTool();
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
            InfoBaseTool ibt = new InfoBaseTool();
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
        try {
            String activityId = ctx.getInputString("activityid", true);
			InfoBaseTool ibt = new InfoBaseTool();
            Statistic stat;
            if (ctx.getInputString("statisticid") == null) {
                stat = ibt.createStatObject();
            } else {
                String statisticId = ctx.getInputString("statisticid", true);
                stat = ibt.getStatObject(statisticId);
            }
            Hashtable request = ctx.getHashedRequest();
            //BEGIN NEW CODE FOR NEW SUCCESS CRITERIA CATEGORIES
			/*
			int exposuresViaMedia = new Integer(request.get("MediaExposures").toString()).intValue();
			int exposuresOneOnOne = new Integer(request.get("IndividualPresentations").toString()).intValue();
			int exposuresGroup = new Integer(request.get("GroupPresentations").toString()).intValue();
			int ongoingEvangelisticRelationships  = new Integer(request.get("OngoingRelationships").toString()).intValue();
			request.put("Exposures", (new Integer(exposuresViaMedia + exposuresOneOnOne + exposuresGroup + ongoingEvangelisticRelationships)).toString());
			
			int decisionsViaMedia = new Integer(request.get("MediaDecisions").toString()).intValue();
			int decisionsOneOnOne = new Integer(request.get("IndividualDecisions").toString()).intValue();
			int decisionsGroup = new Integer(request.get("GroupDecisions").toString()).intValue();
			int decisionsOngoing  = new Integer(request.get("OngoingDecisions").toString()).intValue();
			request.put("Decisions", (new Integer(decisionsViaMedia + decisionsOneOnOne + decisionsGroup + decisionsOngoing)).toString());
			*/
			//END NEW CODE FOR NEW SUCCESS CRITERIA CATEGORIES
            
            ibt.saveStatObjectWithActivity(request, stat, activityId);
            enterSuccessCriteriaForActivity(ctx);
        } catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveSuccessCriteria().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void saveTargetAreaInfo(ActionContext ctx) {
        try {
            String targetAreaId = ctx.getInputString(TARGET_AREA_ID_TOKEN, true);
			InfoBaseTool ibt = new InfoBaseTool();
            ibt.saveTargetAreaInfo(ctx.getHashedRequest(), targetAreaId);
            showTargetArea(ctx);
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
  			InfoBaseTool ibt = new InfoBaseTool();
  			InfoBaseTool.saveTeam(ctx.getHashedRequest(), localLevelId, mode);
            if (mode.equals("add")) {
                from = ctx.getInputString("from", true);
                if (from.equals("localLevelMetros")) {
                    addTeamToRegion(ctx);
                } else {
                    addTeamToCampus(ctx);
                }
            } else {
                showTeam(ctx);
            }
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveTeam().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void showCampusCountReport(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("showCampusCountReport");
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.YEAR, -1);
            InfoBaseTool ibt = new InfoBaseTool();
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

    /** @param ctx ActionContext object Request parameters: <none> */
    public void showIndex(ActionContext ctx) {
        try {
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
   			InfoBaseTool ibt = new InfoBaseTool();
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
            String type = ctx.getInputString("type", _reportTypes);
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

    /** @param ctx ActionContext object */
    public void showStaffInfo(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("showStaffInfo");
            String staffId = ctx.getInputString("staffid", true);
			InfoBaseTool ibt = new InfoBaseTool();
            Staff staff = ibt.getStaffObject(staffId);
            Hashtable staffHash = emulateOldStaffStructure(staff);
			if (staff.getMembership()!=null) {staffHash.put("Team", staff.getMembership().getName());}
			else {staffHash.put("Team", "");}
            Collection dependentInfo = new Vector();
            for (Iterator iDependents = staff.getDependents().iterator(); iDependents.hasNext(); ) {
                Dependent theDependent = (Dependent)iDependents.next();
                dependentInfo.add(theDependent.getLastName() + ", " + theDependent.getFirstName() + " " +
                    theDependent.getMiddleName());
            }
            String isHR =  (String)ctx.getSessionValue("isHR");
            if (isHR == null) {
            	isHR = "false";
            }
            results.putValue("isHR", isHR);
            results.addCollection("dependentInfo", dependentInfo);
            results.addHashtable("staffinfo", staffHash);
            ctx.setReturnValue(results);
            ctx.goToView("staffDetail");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform showStaffInfo().", e);
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

    /** @param ctx ActionContext object */
    public void showTargetArea(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("showTargetArea");
			InfoBaseTool ibt = new InfoBaseTool();
            String targetAreaID = ctx.getInputString(TARGET_AREA_ID_TOKEN, true);
			results = getBookmarks(ctx, results, Bookmarks.TARGET_AREA, targetAreaID);

			TargetArea ta = ibt.getTargetArea(targetAreaID);
            Hashtable targetAreaInfo = ObjectHashUtil.obj2hash(ta);
            results.addHashtable("target", targetAreaInfo);
            Collection nonCCCMinInfo = ObjectHashUtil.list(ta.getOtherMinistries());
            results.addCollection("noncccmin", nonCCCMinInfo);
	        for (Iterator i = ta.getActivities().iterator(); i.hasNext(); ) {
                Activity activity = (Activity)i.next();
				if(activity.isActive()) {
					Hashtable activityHash = ObjectHashUtil.obj2hash(activity);
					activityHash.put("activityID", activity.getActivityId());
					activityHash.put("teamID", activity.getTeam().getLocalLevelId());
					activityHash.put("name", activity.getTeam().getName());
					activityHash.put("status", activity.getStatus());
					activityHash.put("strategy", activity.getStrategy());
					activityHash.put("strategyName", activity.getStrategyFullName());
					activityHash.put("statusName", activity.getStatusFullName());
					Vector contacts = new Vector();
					for (Iterator iStaff = activity.getActivityContacts().iterator(); iStaff.hasNext(); ) {
						contacts.add(ObjectHashUtil.obj2hash((Staff)iStaff.next()));
					}
					activityHash.put("contacts", contacts);
					results.addHashtable(activity.getStrategy(), activityHash);
				}
            }
            ctx.setReturnValue(results);
            ctx.goToView("targetArea");
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform showTargetArea().", e);
        }
    }

    /** @param ctx ActionContext object */
    public void showTeam(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("showTeam");
            InfoBaseTool ibt = new InfoBaseTool();
            String llId = ctx.getInputString(LOCAL_LEVEL_ID_TOKEN, true);
            results = getBookmarks(ctx, results, Bookmarks.LOCAL_LEVEL, llId);
			
            LocalLevel ll = ibt.getLocalLevelTeam(llId);
            Hashtable teamInfo = ObjectHashUtil.obj2hash(ll);

            teamInfo.put("RegionName", Regions.expandRegion(ll.getRegion()));
            teamInfo.put("Lane", translate(_abbrevStrategy, _expandStrategy, ll.getLane()));
            
            results.addHashtable("team", teamInfo);

            Collection members = new Vector();
            for (Iterator iMembers = ll.getMembers().iterator(); iMembers.hasNext(); ) {
                members.add(ObjectHashUtil.obj2hash(iMembers.next()));
            }
            results.addCollection("staff", members);

			Vector activeTargetInfo = new Vector();
			Vector inactiveTargetInfo = new Vector();
			Vector forerunnerTargetInfo = new Vector();
            for (Iterator iActivities = ll.getSortedActivities().iterator(); iActivities.hasNext(); ) {
				Activity activity = (Activity)iActivities.next();
				TargetArea ta = activity.getTargetArea();
				Hashtable row = new Hashtable();
				ObjectHashUtil.obj2hash(activity);
				if (ta != null) {
					row.put("ActivityId",(activity.getActivityId() != null) ? activity.getActivityId() : "");
					row.put("Strategy",(activity.getStrategy() != null) ? activity.getStrategy() : "");
					row.put("Status",(activity.getStatus() != null) ? activity.getStatus() : "");
					row.put("TargetAreaID", ta.getTargetAreaId());
					row.put("Name", (ta.getName() != null) ? ta.getName() : "");
					row.put("StrategyName", activity.getStrategyFullName());
					row.put("StatusName", activity.getStatusFullName());
					if (activity.getStatus().equals("FR")) {
						forerunnerTargetInfo.add(row);					
					} else if (activity.getStatus().equals("IN")) {
						inactiveTargetInfo.add(row);							
					} else {
						activeTargetInfo.add(row);
					}
				}
            }

			results.addCollection("activetarget", activeTargetInfo);
			results.addCollection("inactivetarget", inactiveTargetInfo);
			results.addCollection("forerunnertarget", forerunnerTargetInfo);

			ctx.setReturnValue(results);
            ctx.goToView("teamInfo");
        }
        catch (Exception e) {
			e.printStackTrace();
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform showTeam().", e);
        }
    }

	/** @param ctx ActionContext object */
	public void submitNewTargetAreaRequest(ActionContext ctx) {
		try {
			String to = ctx.getInputString("to", true);
			InfoBaseTool ibt = new InfoBaseTool();
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
			InfoBaseTool ibt = new InfoBaseTool();
			boolean admin = (ctx.getInputString("admin") != null && ctx.getInputString("admin").equalsIgnoreCase("true"));
			Hashtable request = ctx.getHashedRequest();
			if (!admin) {
				ibt.sendLocalLevelRequestEmail(request, to, ctx.getProfileID());
			} else {
				InfoBaseTool.saveTeam(request, null, null);
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