/* Generated by Together */

package org.alt60m.cms.test;

import org.alt60m.cms.util.CmsInfo;
import org.alt60m.cms.model.Category;
import org.alt60m.cms.model.File;
import org.alt60m.util.LogHelper;
import org.apache.log4j.Priority;
import junit.framework.*;
import junitx.framework.*;
import java.util.*;


/**
 * @stereotype test
 * @testedclass <{CmsInfo}>
 */
public class TestCmsInfo extends PrivateTestCase {
	
	//Log Helper Code//
	private static LogHelper logHelper = new LogHelper();
	private void log(Priority p, String msg) { logHelper.log(this.getClass().toString(),p,msg); }
	private void log(Priority p, String msg, java.lang.Throwable t) { logHelper.log(this.getClass().toString(),p,msg,t); }
	//End of Log Helper Code//
	
    /**
     * constructor.
     * @param    aName     a test name
     */
    public TestCmsInfo(String aName) {
        super(aName);
    }

    public static void main(String[] argv) throws Exception {
       // new org.alt60m.staffSite.test.TestStaffSite("TestStaffSite").testStaffSite();
        new TestCmsInfo("testCmsInfo").testAll();

    }

    public void testAll() {

        try {
			Category cat1 = new Category();
            cat1.setCatName("Category1");
	        cat1.persist();

            Category cat2 = new Category();
			cat2.setCatName("Category2");
	        cat2.persist();

            for(int i =0; i<10;i++) {
            	File file = new File();
				file.setTitle("File" + i);
	            file.persist();
                //cat1.getFiles().add(file);
                //cat2.getFiles().add(file);
                file.getCategories().add(cat1);
                file.getCategories().add(cat2);
            }


            Category cat;

			CmsInfo info = new CmsInfo();
            Collection cats = info.getTopLevelCategories();
			for(Iterator iCats = cats.iterator();iCats.hasNext();) {
                cat = (Category) iCats.next();
				showAllCategories(info, cat, 0);
            }


        } catch (Exception e) {
			log(Priority.ERROR,"testAll failed!",e);
        }
	}
	private void showAllCategories(CmsInfo info, Category parent, int level) throws Exception {
		int newLevel = level+1;
        Collection cats = info.getSubCategories(parent.getCategoryId().toString());
		for(Iterator iCats = cats.iterator();iCats.hasNext();) {
       		Category cat = (Category) iCats.next();
            StringBuffer buf = new StringBuffer();
            for(int indent=0;indent<level;indent++) System.out.print("..");
			log(Priority.INFO,cat.getCatName());
//ToDo: Re-add this before using.  I commented it out, so it would compile.
//			for(Iterator iFiles = cat.getFiles().iterator();iFiles.hasNext();) {
//                File theFile = (File) iFiles.next();
//	            for(int indent=0;indent<level+1;indent++) System.out.print("++");
//				System.out.println(theFile.getTitle());
//	        }

            showAllCategories(info, cat, newLevel+1);
		}

    }
}
