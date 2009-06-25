
package org.alt60m.ministry.servlet.modules.report;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.TreeMap;
import java.util.Vector;

import org.alt60m.ministry.model.dbio.LocalLevel;
import org.alt60m.ministry.model.dbio.ReportRow;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.servlet.ActionResults;
import org.alt60m.servlet.Controller.ActionContext;
import org.alt60m.staffSite.bean.dbio.Bookmarks;

public class ReportController extends org.alt60m.ministry.servlet.modules.InfoBaseModuleController {

    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	

    public ReportController() {
        log.debug("ReportController constructor");
    }
    private final String module="report";
	private final String title="Reports";
    public void init() {
        log.debug("ReportController.init()");
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
    /** @param ctx ActionContext object Request parameters: <none> */
    public void index(ActionContext ctx) {
        try {
        	ActionResults results = new ActionResults("createReport");
        	ctx.setSessionValue("quicksearch",ctx.getInputString("quicksearch")==null?null:"true");
        	results.addHashtable("info",InfoBaseModuleHelper.infotize(new LocalLevel()));
        	results.addHashtable("search", InfoBaseModuleHelper.lastSearch(ctx));
        	String type = ctx.getInputString("type");
            
            if(type==null||!Arrays.asList(_reportTypes).contains(type)){
            	type="national";
            }
            Boolean skip=false;
            String isMuster=ctx.getInputString("isMuster");
            if(isMuster==null){
            	 if(ctx.getSessionValue("report")!=null){
                 	ctx.setReturnValue(ctx.getSessionValue("report"));
                 	ctx.setSessionValue("isMuster", (String)ctx.getSessionValue("report_view")==null?"false":((String)ctx.getSessionValue("report_view")).equals("showMuster")?"true":"false");
                 	ctx.goToView((String)ctx.getSessionValue("report_view"));
                 	skip=true;
                 }
            	isMuster=(String)ctx.getSessionValue("isMuster");
            }
            if(isMuster==null){
            	isMuster="false";
            	
            }
            
            
            
            ctx.setSessionValue("isMuster",isMuster);
            results.putValue("isMuster",isMuster);
            
           
	            results.putValue("type", type);
	            
	            Calendar cal = Calendar.getInstance();
	            cal.setTime(new Date());
	            results.putValue("fromYear", Integer.toString(cal.get(Calendar.YEAR) - 1));
	            results.putValue("toYear", Integer.toString(cal.get(Calendar.YEAR)));
	            results.putValue("type", type);
	            results.putValue("personID",getUsersPersonId(ctx));
	    		results.putValue("module",this.module);
	    		results.putValue("title",this.title);
	    		results.putValue("mode","content");
	    		ctx.setReturnValue(results);
	    		if(!skip){
	    		if(isMuster.equals("true")){
	             	ctx.goToView("setMusterCriteriaAgile");
	             }else{
	    		ctx.goToView("setReportCriteriaAgile");
	           }}
        }
        catch (Exception e) {
            ctx.goToErrorView();
            log.error("Failed to perform showIndex().", e);
        }
    }
    public void statReport(ActionContext ctx){
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
    	
    	Vector<ReportRow> report=Reports.getSuccessCriteriaReport( type,  region,  strategyList,  periodEnd,  periodBegin,  teamID, targetAreaId);
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
    	 results.putValue("personID",getUsersPersonId(ctx));
    	 ctx.setSessionValue("quicksearch",ctx.getInputString("quicksearch")==null?null:"true");
     	results.addHashtable("info",InfoBaseModuleHelper.infotize(new LocalLevel()));
     	results.addHashtable("search", InfoBaseModuleHelper.lastSearch(ctx));
 		results.putValue("module",this.module);
 		results.putValue("title",this.title);
 		results.putValue("mode","content");
 		ctx.setSessionValue("report", results);
 		ctx.setSessionValue("report_view", "reportDisplayAgile");
    	ctx.setReturnValue(results);
    	ctx.goToView("reportDisplayAgile");
    	}
    	catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform showReportAgile().", e);
        }
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
        	
        	String report=Reports.getMuster(type, region, periodEnd, strategyList, sortOrderFromRequest(ctx),org.alt60m.ministry.servlet.UnlockCampus.keys((String)ctx.getSessionValue("userName")));
            results.putValue("report",report);
            
           report=null;
           results.putValue("type", type);
           results.putValue("strategyList", strategyList);
           results.putValue("region", region);
           results.putValue("userName",(String)ctx.getSessionValue("userName"));
           results.addCollection("order", sortOrderFromRequest(ctx));
           results.putValue("personID",getUsersPersonId(ctx));
           ctx.setSessionValue("quicksearch",ctx.getInputString("quicksearch")==null?null:"true");
        	results.addHashtable("info",InfoBaseModuleHelper.infotize(new LocalLevel()));
        	results.addHashtable("search", InfoBaseModuleHelper.lastSearch(ctx));
    		results.putValue("module",this.module);
    		results.putValue("title",this.title);
    		results.putValue("mode","content");
    		ctx.setSessionValue("report", results);
    		ctx.setSessionValue("report_view", "showMuster");
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
  public Vector<String> sortOrderFromRequest(ActionContext ctx){
	TreeMap<String,String> sortOrder=new TreeMap<String,String>(convertBracketedParamsToHashtable(ctx).get("order")); //TreeMap is like a hashtable sorted by keys' natural order
    Vector<String> order=new Vector<String>();
    for (String key : sortOrder.keySet()){//we dump the sort-by's according to the alpha order of their keys order[a],order[b],order[c] etc.
 	   order.add(sortOrder.get(key));
    }
    return order;
}

}