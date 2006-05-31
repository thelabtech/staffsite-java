package org.alt60m.cms.model;

//import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class FileCategory extends File {

	private String CategoryId = "";
	private String parentCategory = "";
	private String catName = "";
	private String catDesc = "";
	private String path = "";
	private String pathId = "";

	public FileCategory() { } // Blank constructor needed, because we don't want the File constructor to run.


	public boolean isPKEmpty() {
		return FileId.equals("") || CategoryId.equals("");
	}
	public boolean persist(){
		return (1==0);  //Allways returns false, no edits allowed.
	}

	public void localinit() throws DBIOEntityException {
		String table = "cms_viewfilesandcategories";

		setMetadata("CategoryId","CmsCategoryId","IDENTITY");
		setMetadata("ParentCategory","parentCategory",table);
		setMetadata("CatName","catName",table);
		setMetadata("CatDesc","catDesc",table);
		setMetadata("Path","path",table);
		setMetadata("PathId","pathId",table);

		//All variables and getter/setters for the file pare  are not needed, as they are beeing extended.
		setMetadata("FileId", "CmsFileID", "IDENTITY");
		setMetadata("Mime", "mime", table);
		setMetadata("Title", "title", table);
		setMetadata("AccessCount", "accessCount", table);
		setMetadata("DateAdded", "dateAdded", table);
		setMetadata("DateModified", "dateModified", table);
		setMetadata("ModeratedYetString", "moderatedYet", table);
		setMetadata("Summary", "summary", table);
		setMetadata("Quality", "quality", table);
		setMetadata("ExpDate", "expDate", table);
		setMetadata("LastAccessed", "lastAccessed", table);
		setMetadata("ModMsg", "modMsg", table);
		setMetadata("Keywords", "keywords", table);
		setMetadata("Url", "url", table);
		setMetadata("Detail", "detail", table);
		setMetadata("Language", "language", table);
		setMetadata("Version", "version", table);
		setMetadata("Author", "author", table);
		setMetadata("Submitter", "submitter", table);
		setMetadata("Contact", "contact", table);
		setMetadata("Rating", "rating", table);

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
}