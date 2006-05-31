package org.alt60m.cms.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class Category extends DBIOEntity {
	
	public Category(String id) {
		CategoryId = new Integer(id);
		select();
	}
	public Category() { }
	
    private Integer CategoryId = 0;
    private Integer parentCategory = 0;
    private String catName = "";
    private String catDesc = "";
    private String path = "";
    private String pathId = "";

    public boolean isPKEmpty() { return CategoryId == null || CategoryId.equals(0); }
    public boolean persist() { return isPKEmpty() ? insert() : update(); }
    
    public void localinit() throws DBIOEntityException {
    	String table = "cms_cmscategory";
    	
    	setMetadata("CategoryId","CmsCategoryId","IDENTITY");
    	setMetadata("ParentCategory","parentCategory",table);
    	setMetadata("CatName","catName",table);
    	setMetadata("CatDesc","catDesc",table);
    	setMetadata("Path","path",table);
    	setMetadata("PathId","pathId",table);

    	setAutodetectProperties(false);
    }

	public int getCategoryId() { return CategoryId; }
	public void setCategoryId(int CategoryId) { this.CategoryId = CategoryId; }

	public Integer getParentCategory() { return parentCategory; }
	public void setParentCategory(Integer parentCategory) { this.parentCategory = parentCategory; }
	
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
		newFc.setCategoryId(String.valueOf(this.getCategoryId()));
		newFc.insert();
	}
	public void dissocFile(String fileId) {
		FileCategoryLink nfc = new FileCategoryLink();
		nfc.setFileId(fileId);
		nfc.setCategoryId(String.valueOf(this.getCategoryId()));
		nfc.delete();
	}
}