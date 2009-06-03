
package org.alt60m.ministry.servlet.modules.person;

import java.util.Collection;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Vector;

import org.alt60m.ministry.model.dbio.Address;
import org.alt60m.ministry.model.dbio.Contact;
import org.alt60m.ministry.model.dbio.Dependent;
import org.alt60m.ministry.model.dbio.OldAddress;
import org.alt60m.ministry.model.dbio.Person;
import org.alt60m.ministry.model.dbio.Staff;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries;
import org.alt60m.ministry.servlet.modules.campus.location.LocationHelper;
import org.alt60m.ministry.servlet.modules.model.Section;
import org.alt60m.servlet.ActionResults;
import org.alt60m.servlet.Controller.ActionContext;
import org.alt60m.util.ObjectHashUtil;

public class PersonController extends org.alt60m.ministry.servlet.modules.InfoBaseModuleController {

    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	

    public PersonController() {
        log.debug("PersonController constructor");
    }
    private final String module="person";
	private final String title="People";
    public void init() {
        log.debug("PersonController.init()");
        try {
            initState();
        } catch (Exception e) {
            log.fatal("Failed to init!", e);
        }
    }
    /** @param ctx ActionContext object Request parameters: <none> */
    public void index(ActionContext ctx) {
        try {
        	ActionResults result=new ActionResults("IB index");
        	ctx.setSessionValue("lastClass", "Person");
    		String id=(String)ctx.getSessionValue("person")!=null?(String)ctx.getSessionValue("person"):"";
    		if(id.equals("search")){
    			Hashtable search=PersonHelper.sessionSearch(ctx,"person");
    			Section list=PersonHelper.getPersonSearchResults((String)search.get("name"),(String)search.get("city"),(String)search.get("state"),(String)search.get("region"),(String)search.get("strategy"));
    			Vector<Section> content=new Vector<Section>();
    			content.add(list);
    			result.addCollection("content",content);
    			result.putValue("mode","list");
    		}else if(!id.equals("")){
    			
        		result.addHashtable("info", PersonHelper.info(id));
                result.addCollection("content",PersonHelper.content(id));
                result.putValue("mode","content");
        	}
    		result.addHashtable("search",PersonHelper.sessionSearch(ctx,"person"));
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
    public void content(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("showPersonInfo");
            String personID = ctx.getInputString("id", true);
            ctx.setSessionValue("person", ctx.getInputString("id"));
            String accountNo = ctx.getInputString("accountNo", true);
            ctx.setSessionValue("lastClass", "Person");
            log.debug(accountNo+" accountNo, "+personID+" personID");
           
            results.addHashtable("search",PersonHelper.sessionSearch(ctx,"person"));
            results.addHashtable("info", PersonHelper.info(personID));
            results.addCollection("content", PersonHelper.content(personID));
            results.putValue("module",this.module);
			results.putValue("title",this.title);
			results.putValue("mode","content");
            ctx.setReturnValue(results);
            ctx.goToView("index");
                     
            
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform showPersonInfo().", e);
        }
    }
    private Hashtable<String, Object> emulateOldStaffStructure(Staff staff) throws Exception {
        Hashtable<String, Object> staffHash = ObjectHashUtil.obj2hash(staff);
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
    private Hashtable<String,Object> getAddressForTeamMember(String accountNo, String personID) throws Exception {
   	 Address address = new Address();   
   	 
           if (!(accountNo==null||accountNo.equals(""))){
           	InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
               Staff staff = ibt.getStaffObject(accountNo);
               Hashtable<String, Object> staffHash = emulateOldStaffStructure(staff);
               address.setAddress1((String)staffHash.get("Address1"));
               address.setAddress2((String)staffHash.get("Address2"));
               address.setAddress3((String)staffHash.get("Address3"));
               address.setAddress4((String)staffHash.get("Address4"));
               address.setCity((String)staffHash.get("City"));
               address.setState((String)staffHash.get("State"));
               address.setZip((String)staffHash.get("Zip"));
               address.setCountry((String)staffHash.get("Country"));
               address.setWorkPhone(staff.getWorkPhone());
           }else if(!(personID.equals("0")||personID==null||personID.equals(""))){
           address.setFk_PersonID(personID);
           address.setAddressType("current");
           address.select();
           if (address==null){
           	address.setFk_PersonID(personID);
               address.setAddressType("permanent");
               address.select();
           }
           }
           Hashtable<String, Object> addressHash = ObjectHashUtil.obj2hash(address);
           return addressHash;
       }
    public void search(ActionContext ctx) {
        try {
        	ActionResults results = new ActionResults("listCampus");
        	ctx.setSessionValue("person", "search");
        	ctx.setSessionValue("lastClass", "Person");
        	String name = ctx.getInputString("name", true);
            String city = ctx.getInputString("city", true);
            String state = ctx.getInputString("state", true);
            String[] strategies=ctx.getInputStringArray("strategy");
            String strategy="(";
            for (String strat:strategies){
            	strategy+="'"+strat+"',";
            }
            strategy+=")";
            strategy=strategy.replace(",)",")");
            log.debug(strategy);
            String[] regions=ctx.getInputStringArray("region");
            String region="(";
            for (String reg:regions){
            	region+="'"+reg+"',";
            }
            region+=")";
            region=region.replace(",)",")");
            PersonHelper.storeSearch(ctx,"person");
			Section list=PersonHelper.getPersonSearchResults(name,city,state,region,strategy);
			Vector<Section> content=new Vector<Section>();
			content.add(list);
			results.addHashtable("search",PersonHelper.sessionSearch(ctx,"person"));
			results.addCollection("content", content);
			results.putValue("module", this.module);
			results.putValue("title", this.title);
			results.putValue("mode", "list");
            ctx.setReturnValue(results);
            ctx.goToView("index");
        }
        catch (Exception e) {
			e.printStackTrace();
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform detailedListCampus().", e);
        }
    }
}