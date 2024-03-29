/* Generated by Together */

package org.alt60m.hr.review360.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

import org.alt60m.ministry.model.dbio.Staff;

import java.util.Vector;
import java.util.Date;

/**
 * @persistent 
 * @table hr_review360_reviewsessionlight
 * @cache-type none
 * @access shared
 * @key-generator UUID
 */
public class ReviewSessionLight  extends DBIOEntity {

	/**
     * @sql-type varchar
     * @sql-size 64
     * @primary-key
     */
    private String reviewSessionLightId = "";
	/**
     * @sql-type varchar
     * @sql-size 80
     */
    private String name = "";
	/**
     * @sql-type varchar
     * @sql-size 255
     */
	private String purpose = "";


	private Date dateDue = null;
	private Date dateStarted = null;
	/**
     * @sql-type varchar
     * @sql-size 128
     */
    private String revieweeId = "";
		/**
     * @sql-type varchar
     * @sql-size 128
     */
    private String administratorId = "";
		/**
     * @sql-type varchar
     * @sql-size 128
     */
    private String requestedById = "";

    /** @associates <{Review360}>
     * @clientCardinality 1
     * @supplierCardinality 0..*
     * @undirected
     * @label theReviews
     * 
     * @field-type org.alt60m.hr.review360.model.Review360Light
     * @many-key fk_ReviewSessionID
     * @get-method getReview360Lights
     * @set-method setReview360Lights
     */
	
	public ReviewSessionLight() { }
	public ReviewSessionLight(String id) 
	{ 
		reviewSessionLightId = id; 
		select();
	}
    
	public boolean isPKEmpty() { return this.reviewSessionLightId.equals(""); }
	
	public void localinit() throws DBIOEntityException {
		String table = "hr_review360_reviewsessionlight";

		setMetadata("ReviewSessionLightId","ReviewSessionLightID","IDENTITY");

		setMetadata("RevieweeId","revieweeID",table);
		setMetadata("AdministratorId","administratorID",table);
		setMetadata("RequestedById","requestedByID",table);

		setMetadata("DateDue","dateDue",table);
		setMetadata("DateStarted","dateStarted",table);
		setMetadata("Name","name",table);
		setMetadata("Purpose","purpose",table);
	
		setAutodetectProperties(false);
	}

	public String getReviewSessiontId() { return reviewSessionLightId; }
	public void setReviewSessionId(String reviewSessionLightId) { this.reviewSessionLightId = reviewSessionLightId; }
	public String getReviewSessionLightId() { return reviewSessionLightId; }
	public void setReviewSessionLightId(String reviewSessionLightId) { this.reviewSessionLightId = reviewSessionLightId; }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public String getPurpose() { return purpose; }
	public void setPurpose(String purpose) { this.purpose = purpose; }
	
	public Date getDateDue() { return dateDue; }
	public void setDateDue(Date dateDue) { this.dateDue = org.alt60m.util.DateUtils.clearTimeFromDate(dateDue); }
	
	public Date getDateStarted() { return dateStarted; }
	public void setDateStarted(Date dateStarted) { this.dateStarted = org.alt60m.util.DateUtils.clearTimeFromDate(dateStarted); }
	
	public String getRevieweeId() { return revieweeId; }
	public void setRevieweeId(String revieweeId) { this.revieweeId = revieweeId; }
	public Staff getReviewee(){ return new Staff(revieweeId); }
	public void setReviewee(Staff s) { this.revieweeId = s.getAccountNo(); }
	public void assocReviewee(Staff s) { setReviewee(s); }
	public void dissocReviewee(Staff s) { setRevieweeId(""); }
	
	public String getAdministratorId() { return administratorId; }
	public void setAdministratorId(String administratorId) { this.administratorId = administratorId; }
	public Staff getAdministrator(){ return new Staff(administratorId); }
	public void setAdministrator(Staff s) { this.administratorId = s.getAccountNo(); }
	public void assocAdministrator(Staff s) { setAdministrator(s); }
	public void dissocAdministrator(Staff s) { setAdministratorId(""); }
	
	public String getRequestedById() { return requestedById; }
	public void setRequestedById(String requestedById) { this.requestedById = requestedById; }
	public Staff getRequestedBy(){ return new Staff(requestedById); }
	public void setRequestedBy(Staff s) { this.requestedById = s.getAccountNo(); }
	public void assocRequestedBy(Staff s) { setRequestedBy(s); }
	public void dissocRequestedBy(Staff s) { setRequestedById(""); }	

	public void assocReview360Light(Review360Light r) {
		r.setReviewSessionLightId(this.reviewSessionLightId);
		r.update();
	}
	public void dissocReview360Light(Review360Light r) {
		r.setReviewSessionLightId("0");
		r.update();
	}
	public Vector getReview360Lights(){ 
		Review360Light r = new Review360Light();
		r.setReviewSessionLightId(this.reviewSessionLightId);
		return r.selectList(); 
	}

}
