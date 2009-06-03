package org.alt60m.ministry.servlet.modules.campus.movement;
import java.util.Hashtable;

import org.alt60m.ministry.model.dbio.Activity;
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
  
}
