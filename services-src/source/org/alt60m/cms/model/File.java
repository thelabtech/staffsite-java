package org.alt60m.cms.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

import java.util.Date;
import java.util.Vector;

public class File extends DBIOEntity {

	public File(String id) {
		FileId = id;
		if (!select()) {
			throw new IllegalArgumentException("A File with id " + id + " does not exist!" );
		}
	}
	public File() { }

	public boolean isPKEmpty() {
		return FileId.equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}

	public void localinit() throws DBIOEntityException {
		String table = "cms_cmsfile";

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

	protected String FileId = new String();
	protected String Mime = "";
	protected String Title = "";
	protected int AccessCount = 0;
	protected Date DateAdded;
	protected Date DateModified;
	protected String ModeratedYet = "";
	protected String Summary = "";
	protected String Quality = "";
	protected Date ExpDate;
	protected Date LastAccessed;
	protected String ModMsg = "";
	protected String Keywords = "";
	protected String Url = "";
	protected String Detail = "";
	protected String Language = "";
	protected String Version = "";
	protected String Author = "";
	protected String Submitter = "";
	protected String Contact = "";
	protected int Rating = 0;

	public String getFileId() { return FileId; }
	public void setFileId(String FileID) { this.FileId = FileID; }

	public String getMime() { return Mime; }
	public void setMime(String mime) { this.Mime = mime; }

	public String getTitle() { return Title; }
	public void setTitle(String title) { this.Title = title; }

	public int getAccessCount() { return AccessCount; }
	public void setAccessCount(int accessCount) { this.AccessCount = accessCount; }

	public Date getDateAdded() { return DateAdded; }
	public void setDateAdded(Date dateAdded) { this.DateAdded = org.alt60m.util.DateUtils.clearTimeFromDate(dateAdded); }

	public Date getDateModified() { return DateModified; }
	public void setDateModified(Date dateModified) { this.DateModified = org.alt60m.util.DateUtils.clearTimeFromDate(dateModified); }

	public boolean getModeratedYet() { return ModeratedYet != null && ModeratedYet.equals("T"); }
	public void setModeratedYet(boolean ModeratedYet) { this.ModeratedYet = ModeratedYet ? "T" : "F"; }
	public String getModeratedYetString() { return ModeratedYet; }
	public void setModeratedYetString(String ModeratedYet) { this.ModeratedYet = ModeratedYet; }

	public String getSummary() { return Summary; }
	public void setSummary(String summary) { this.Summary = summary; }

	public String getQuality() { return Quality; }
	public void setQuality(String quality) { this.Quality = quality; }

	public Date getExpDate() { return ExpDate; }
	public void setExpDate(Date expDate) { this.ExpDate = org.alt60m.util.DateUtils.clearTimeFromDate(expDate); }

	public Date getLastAccessed() { return LastAccessed; }
	public void setLastAccessed(Date lastAccessed) { this.LastAccessed = org.alt60m.util.DateUtils.clearTimeFromDate(lastAccessed); }

	public String getModMsg() { return ModMsg; }
	public void setModMsg(String ModMsg) { this.ModMsg = ModMsg; }

	public String getKeywords() { return Keywords; }
	public void setKeywords(String keywords) { this.Keywords = keywords; }

	public String getUrl() { return Url; }
	public void setUrl(String Url) { this.Url = Url; }

	public String getDetail() { return Detail; }
	public void setDetail(String Detail) { this.Detail = Detail; }

	public String getLanguage() { return Language; }
	public void setLanguage(String Language) { this.Language = Language; }

	public String getVersion() { return Version; }
	public void setVersion(String Version) { this.Version = Version; }

	public String getAuthor() { return Author; }
	public void setAuthor(String isSecure) { this.Author = isSecure; }

	public String getSubmitter() { return Submitter; }
	public void setSubmitter(String Submitter) { this.Submitter = Submitter; }

	public String getContact() { return Contact; }
	public void setContact(String Contact) { this.Contact = Contact; }

	public int getRating() { return Rating; }
	public void setRating(int Rating) { this.Rating = Rating; }

//	public void assocCategory(FileCategory fileCategory) {
//		assocCategory(fileCategory.getCategoryId());
//	}
	public void assocCategory(String CategoryId) {
		FileCategoryLink newFc = new FileCategoryLink();
		newFc.setFileId(this.getFileId());
		newFc.setCategoryId(CategoryId);
		newFc.insert();
	}

//	public void dissocCategory(FileCategory fileCategory) {
//		dissocCategory(fileCategory.getCategoryId());
//	}
	public void dissocCategory(String CategoryId) {
		FileCategoryLink nfc = new FileCategoryLink();
		nfc.setFileId(this.getFileId());
		nfc.setCategoryId(CategoryId);
		nfc.delete();
	}

	public Vector getCategories() {
		Category cat = new Category();
		String table = "cms_viewfileidcategories";
		cat.changeTargetTable(table);
		return cat.selectList("CmsFileID = '" + this.FileId + "'");
	}
}
