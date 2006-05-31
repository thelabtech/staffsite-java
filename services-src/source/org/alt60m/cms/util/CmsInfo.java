package org.alt60m.cms.util;

import org.alt60m.cms.model.Category;
import org.alt60m.cms.model.File;
import org.alt60m.util.ObjectHashUtil;

import java.util.*;

/**
 * @stereotype tested
 * @testcase org.alt60m.cms.test.TestCmsInfo 
 */
public class CmsInfo {

	public Category getCategoryObject(String CategoryId) {
		return  new Category(CategoryId);
    }

    public Collection getFrequentAccessedFiles(int count) {
		String qry = "accessCount > "+count+" order by accessCount DESC";
		return  new File().selectList(qry);
    }

    public Collection getTopLevelCategories() {
	    String qry = "parentCategory = 0 order by catName";
		return  new Category().selectList(qry);
    }
    public Collection getSubCategories(String category) throws Exception {
	    String[] fields = {"CategoryId","CatName"};
	    String query = "parentCategory = '"+category+"' ORDER BY catName";
	    return  ObjectHashUtil.list(new Category().selectList(query),fields);
    }
    public Collection getCategoriesFromFileID(String fileID) {
	    String qry = "CmsFileID = '"+fileID+"' order by path";
	    Category cat = new Category();
	    cat.changeTargetTable("cms_viewfileidcategories");
	    return  cat.selectList(qry);
    }
    public Collection getParentCategories() throws Exception {
		return  getSubCategories("1");
    }

    /**
     * @link
     * @shapeType PatternLink
     * @pattern TestCase
     * @clientRole tested
     * @supplierRole tests
     * @hidden 
     */
    /*# private TestCmsInfo _testCmsInfo; */

}

