package org.alt60m.cms.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class FileCategoryLink extends DBIOEntity {

	private String FileId = new String();
	private String CategoryId = new String();

	public boolean isPKEmpty() {
		return FileId.equals("") || CategoryId.equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}

	public void localinit() throws DBIOEntityException {
		String table = "cms_assoc_FileCategory";
		setMetadata("FileId","CmsFileID","KEY");
		setMetadata("CategoryId","CmsCategoryId","KEY");
		setMetadata("DbioDummy","dbioDummy",table);
		setAutodetectProperties(false);
	}
	private boolean dbioDummy = true;
	public boolean getDbioDummy(){return this.dbioDummy;}
	public void setDbioDummy(boolean dbioDummy){this.dbioDummy = dbioDummy;}

	public String getFileId() { return FileId; }
	public void setFileId(String FileId) { this.FileId = FileId; }
	public File getFile() { return new File(this.FileId); }
	public void setFile(File file) { this.FileId = file.getFileId(); }

	public String getCategoryId() { return CategoryId; }
	public void setCategoryId(String CategoryId) { this.CategoryId = CategoryId; }
	public Category getCategory(){ return new Category(this.CategoryId); }
	public void setCategory(Category cat){ this.CategoryId = cat.getCategoryId(); }
}