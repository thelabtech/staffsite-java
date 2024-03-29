/* Generated by Together */

package org.alt60m.cms.test;

import java.util.Collection;
import java.util.Iterator;

import junit.framework.TestCase;

import org.alt60m.cms.model.Category;
import org.alt60m.cms.model.File;
import org.alt60m.cms.util.CmsInfo;


/**
 * @stereotype test
 * @testedclass <{CmsInfo}>
 */
public class TestCmsInfo extends TestCase {


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
        }
	}
	private void showAllCategories(CmsInfo info, Category parent, int level) throws Exception {
		int newLevel = level+1;
        Collection cats = info.getSubCategories(String.valueOf(parent.getCategoryId()));
		for(Iterator iCats = cats.iterator();iCats.hasNext();) {
       		Category cat = (Category) iCats.next();
            StringBuffer buf = new StringBuffer();
            for(int indent=0;indent<level;indent++) System.out.print("..");
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
