
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
import org.alt60m.ministry.servlet.modules.team.TeamHelper;
import org.alt60m.servlet.ActionResults;
import org.alt60m.servlet.Controller.ActionContext;
import org.alt60m.staffSite.bean.dbio.Bookmarks;
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
    protected void initState() throws Exception {
        initViews(getServletContext().getRealPath("/WEB-INF/modules/views.xml"));
        setDefaultAction("index");
        _bookmarks = new Bookmarks();
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
           	PersonHelper ibt = new PersonHelper();
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
   
}