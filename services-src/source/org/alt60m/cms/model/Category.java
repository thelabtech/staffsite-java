package org.alt60m.cms.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class Category extends DBIOEntity {
	
	public Category(String id) {
		CategoryId = id;
		select();
	}
	public Category() { }
	
    private String CategoryId = "";
    private String parentCategory = "";
    private String catName = "";
    private String catDesc = "";
    private String path = "";
    private String pathId = "";

    public boolean isPKEmpty() { return CategoryId.equals(""); }
    public boolean persist() { return isPKEmpty() ? insert() : update(); }
    
    public void localinit() throws DBIOEntityException {
    	String table = "cms_CmsCategory";
    	
    	setMetadata("CategoryId","CmsCategoryId","IDENTITY");
    	setMetadata("ParentCategory","parentCategory",table);
    	setMetadata("CatName","catName",table);
    	setMetadata("CatDesc","catDesc",table);
    	setMetadata("Path","path",table);
    	setMetadata("PathId","pathId",table);

    	setAutodetectProperties(false);
    }

	public String getCategoryId() { return CategoryId; }
	public void setCategoryId(String CategoryId) { this.CategoryId = CategoryId; }

	public String getParentCategory() { return parentCategory; }
	public void setParentCategory(String parentCategory) { this.parentCategory = parentCategory; }
	
	public String getCatName() { return catName; }
	public void setCatName(String catName) { this.catName = catName; }
	
	public String getCatDesc() { return catDesc; }
	public void setCatDesc(String catDesc) { this.catDesc = catDesc; }
	
	public String getPath() { return path; }
	public void setPath(String path) { this.path = path; }
	
	public String getPathId() { return pathId;  }
	public void setPathId(String pathId) { this.pathId = pathId; }
	
	public void assocFile(String fildId) {
		FileCategoryLink newFc = new FileCategoryLink();
		newFc.setFileId(fildId);
		newFc.setCategoryId(this.getCategoryId());
		newFc.insert();
	}
	public void dissocFile(String fileId) {
		FileCategoryLink nfc = new FileCategoryLink();
		nfc.setFileId(fileId);
		nfc.setCategoryId(this.getCategoryId());
		nfc.delete();
	}
}