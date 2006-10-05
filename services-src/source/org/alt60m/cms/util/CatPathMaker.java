package org.alt60m.cms.util;

import org.alt60m.cms.model.Category;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.*;

public class CatPathMaker {

	private static Log log = LogFactory.getLog(CatPathMaker.class); 
	
	public CatPathMaker() {}

	public void run() {

		try {
            CmsInfo cmsInfo = new CmsInfo();
			Collection l = new Category().selectList();
			Iterator llist = l.iterator();
			
			// for each category, figure out the pathid and path and save them
			while(llist.hasNext()) {
				Category cat = (Category) llist.next();
				Category temp = cat;
				String path = "";
				String pathid = "";
				if (temp.getCategoryId() == 0) {
					path = ":";
					pathid = ":";
				}
				while(temp.getCategoryId() != 0){
					path = temp.getCatName() + ":" + path;
					pathid = temp.getCategoryId() + ":" + pathid;
					temp = cmsInfo.getCategoryObject(temp.getParentCategory().toString());
				}
				path = path.substring(0,path.lastIndexOf(":"));
				pathid = pathid.substring(0,pathid.lastIndexOf(":"));
				log.info("setting " + path);
				log.info("setting " + pathid);
				cat.setPath(path);
				cat.setPathId(pathid);
				cat.persist();
			}

		} catch (java.lang.Exception e) {
			log.error(e, e);
		}	 

	}

	public static void main(String[] args) {

		CatPathMaker ci = new CatPathMaker();
		
		ci.run();
		log.info("done been run");

	}

}