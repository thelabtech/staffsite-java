/* Generated by Together */

package org.alt60m.cms.model;
//import java.util.Set;
//import java.util.HashSet;
import java.util.Collection;
import java.util.Vector;
import java.util.Date;
import org.alt60m.util.DateUtils;

/**
 * @persistent 
 * @table cms_cmsfile
 * @cache-type none
 * @access shared
 * @key-generator UUID
 */
public class CmsFile {
    /**
     * @sql-type varchar
     * @sql-size 64
     * @primary-key
     */
    private String CmsFileID = "";
	/**
     * @sql-type varchar
     * @sql-size 128
     */
	private String mime = "";
	/**
     * @sql-type varchar
     * @sql-size 128
     */
	private String title = "";
    /**
     @sql-index
     */
	private int accessCount;
	private Date dateAdded = null;
	private Date dateModified = null;

    /**
    * @sql-type char[TF]
    */
	private boolean moderatedYet;
	/**
     * @sql-type varchar
     * @sql-size 128
     */
	private String summary = "";
	/**
     * @sql-type varchar
     * @sql-size 128
     */
	private String quality = "";
	private Date expDate = null;
	private Date lastAccessed = null;
	/**
     * @sql-type varchar
     * @sql-size 128
     */
    private String modMsg = "";
	/**
     * @sql-type varchar
     * @sql-size 128
     */
    private String keywords = "";
	/**
     * @sql-type varchar
     * @sql-size 128
     */
    private String url = "";
	/**
     * @sql-type varchar
     * @sql-size 128
     */
    private String detail = "";
	/**
     * @sql-type varchar
     * @sql-size 128
     */
    private String language = "";
	/**
     * @sql-type varchar
     * @sql-size 128
     */
    private String version = "";
	/**
     * @sql-type varchar
     * @sql-size 128
     */
    private String author = "";
	/**
     * @sql-type varchar
     * @sql-size 128
     */
    private String submitter = "";
	/**
     * @sql-type varchar
     * @sql-size 128
     */
    private String contact = "";
	private int rating;

    /**
     * @field-name categories
     * @field-type org.alt60m.cms.model.CmsCategory
	 * @many-table cms_assoc_filecategory
     * @sql-name CmsCategoryID
     * @many-key CmsFileID
     * @get-method getCategories
     * @set-method setCategories
     */
    private Collection lnkCmsCategories = new Vector();
	public String getCmsFileID() {
	        return CmsFileID;
	}
	public void setCmsFileID(String CmsFileID) {
	        this.CmsFileID = CmsFileID;
	}
	public String getMime() {
	        return mime;
	}
	public void setMime(String mime) {
	        this.mime = mime;
	}
	public String getTitle() {
	        return title;
	}
	public void setTitle(String title) {
	        this.title = title;
	}
	public int getAccessCount() {
	        return accessCount;
	}
	public void setAccessCount(int accessCount) {
	        this.accessCount = accessCount;
	}
	public Date getDateAdded() {
	        return dateAdded;
	}
	public void setDateAdded(Date dateAdded) {
	        this.dateAdded = DateUtils.clearTimeFromDate(dateAdded);
	}
	public Date getDateModified() {
	        return dateModified;
	}
	public void setDateModified(Date dateModified) {
	        this.dateModified = DateUtils.clearTimeFromDate(dateModified);
	}
	public boolean getModeratedYet() {
	        return moderatedYet;
	}
	public void setModeratedYet(boolean moderatedYet) {
	        this.moderatedYet = moderatedYet;
	}
	public String getSummary() {
	        return summary;
	}
	public void setSummary(String summary) {
	        this.summary = summary;
	}
	public String getQuality() {
	        return quality;
	}
	public void setQuality(String quality) {
	        this.quality = quality;
	}
	public Date getExpDate() {
	        return expDate;
	}
	public void setExpDate(Date expDate) {
	        this.expDate = DateUtils.clearTimeFromDate(expDate);
	}
	public Date getLastAccessed() {
	        return lastAccessed;
	}
	public void setLastAccessed(Date lastAccessed) {
	        this.lastAccessed = DateUtils.clearTimeFromDate(lastAccessed);
	}
	public String getModMsg() {
	        return modMsg;
	}
	public void setModMsg(String modMsg) {
	        this.modMsg = modMsg;
	}
	public String getKeywords() {
	        return keywords;
	}
	public void setKeywords(String keywords) {
	        this.keywords = keywords;
	}
	public String getUrl() {
	        return url;
	}
	public void setUrl(String url) {
	        this.url = url;
	}
	public String getDetail() {
	        return detail;
	}
	public void setDetail(String detail) {
	        this.detail = detail;
	}
	public String getLanguage() {
	        return language;
	}
	public void setLanguage(String language) {
	        this.language = language;
	}
	public String getVersion() {
	        return version;
	}
	public void setVersion(String version) {
	        this.version = version;
	}
	public String getAuthor() {
	        return author;
	}
	public void setAuthor(String author) {
	        this.author = author;
	}
	public String getSubmitter() {
	        return submitter;
	}
	public void setSubmitter(String submitter) {
	        this.submitter = submitter;
	}
	public String getContact() {
	        return contact;
	}
	public void setContact(String contact) {
	        this.contact = contact;
	}
	public int getRating() {
	        return rating;
	}
	public void setRating(int rating) {
	        this.rating = rating;
	}
	public Collection getCategories() {
	        return lnkCmsCategories;
	}
	public void setCategories(Collection categories) {
	        this.lnkCmsCategories = categories;
	}
	public void dissocCategory(CmsCategory cat) {
			getCategories().remove(cat);
	}
	public void assocCategory(CmsCategory cat) {
			getCategories().add(cat);
	}
}
