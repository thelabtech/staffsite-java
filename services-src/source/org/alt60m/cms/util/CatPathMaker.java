package org.alt60m.cms.util;

import org.alt60m.cms.model.Category;
import java.util.*;

public class CatPathMaker {

	public CatPathMaker() {}

	public void run() {

		try {
            CmsInfo cmsInfo = new CmsInfo();
			Collection l = new Category().selectList();// ob.doQuery("select obj from org.alt60m.cms.model.CmsCategory as obj");
			Iterator llist = l.iterator();
			
			// for each category, figure out the pathid and path and save them
			while(llist.hasNext()) {
				Category cat = (Category) llist.next();//(CmsCategoryObject)a.ejbNarrow(llist.next());
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
				System.out.println("setting " + path);
				System.out.println("setting " + pathid);
				cat.setPath(path);
				cat.setPathId(pathid);
				cat.persist();
			}

		} catch (java.lang.Exception e) {
			e.printStackTrace();
		}	 

	}

	public static void main(String[] args) {

		CatPathMaker ci = new CatPathMaker();
		
		ci.run();
		System.out.println("done been run");

	}

}