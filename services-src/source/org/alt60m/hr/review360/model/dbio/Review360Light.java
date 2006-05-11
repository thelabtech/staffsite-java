/* Generated by Together */

package org.alt60m.hr.review360.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

import org.alt60m.ministry.model.dbio.Staff;

import java.util.Date;

/**
 * @persistent 
 * @table hr_review360_Review360Light
 * @cache-type none
 * @access shared
 * @key-generator UUID
 */
public class Review360Light  extends DBIOEntity {


	/**
     * @primary-key
     */
    private String review360LightId = "";
    
    private int fkSessionLightId = 0;

	private String reviewedById = "";
	
	private String reviewedByTitle = "";
	private String reviewedByFirstName = "";
	private String reviewedByLastName = "";
	private String reviewedByEmail = "";
	//private String reviewedByIsMale = "";
	//private boolean reviewedByIsStaff = false;
	
	private Date dateStarted = null;
	private Date dateCompleted = null;
	private Date dateDue = null;

	/**
     * @sql-type varchar
     * @sql-size 128
     */
	private String currentPosition = "";
	/**
     * @sql-type varchar
     * @sql-size 128
     */
	private String leadershipLevel = "";
	private String relationship = "";
	private String q1 = "";
	private String q2;
	private String q3 = "";
	private String q4 = "";
	private String q5 = "";
	private String q6 = "";
	private String q7 = "";
	private String q8;
	private String q9 = "";
	
	public Review360Light() { }
	public Review360Light(String id)
	{ 
		review360LightId = id;
		select();
	}

	public boolean isPKEmpty() { return this.review360LightId.equals(""); }
	
	public void localinit() throws DBIOEntityException {
			
			String table = "hr_review360_Review360Light";

			setMetadata("Review360LightId","Review360LightID","IDENTITY");

			setMetadata("ReviewedById","reviewedByID",table);
			
			setMetadata("ReviewedByTitle","reviewedByTitle",table);
			setMetadata("ReviewedByFirstName","reviewedByFirstName",table);
			setMetadata("ReviewedByLastName","reviewedByLastName",table);
			setMetadata("ReviewedByEmail","reviewedByEmail",table);
			//setMetadata("ReviewedByIsStaff","reviewedByIsStaff",table);
			//setMetadata("ReviewedByIsMale","reviewedByIsMale",table);
			
			setMetadata("FkSessionLightId","fk_ReviewSessionLightID",table);

			setMetadata("DateStarted","dateStarted",table);
			setMetadata("DateCompleted","dateCompleted",table);
			setMetadata("DateDue","dateDue",table);
			setMetadata("CurrentPosition","currentPosition",table);
			setMetadata("LeadershipLevel","leadershipLevel",table);
			setMetadata("Relationship","relationship",table);
		
			setMetadata("Q1","q1",table);
			setMetadata("Q2","q2",table);
			setMetadata("Q3","q3",table);
			setMetadata("Q4","q4",table);
			setMetadata("Q5","q5",table);
			setMetadata("Q6","q6",table);
			setMetadata("Q7","q7",table);
			setMetadata("Q8","q8",table);
			setMetadata("Q9","q9",table);

			setAutodetectProperties(false);
	}

    public String getReview360LightId() { return review360LightId; }
	public int getReview360LightIdInt() {  
    	if(review360LightId != null && !review360LightId.equals(""))
			return Integer.parseInt(review360LightId);
    	else
    		return -1;
    }
	   
	public void setReview360LightId(String review360LightId) { this.review360LightId = review360LightId; }
	public void setReview360LightId(int review360LightId) { this.review360LightId = Integer.toString(review360LightId); }
	
	
	// encodes the object's review360Id and returns it.
	// used for emailing the review360Id as a hyperlink.
	public String encodeReview360LightID() {
		long coefficient = 2125551212L;  // largest integer is: 214 748 3647
		long revID = (long) getReview360LightIdInt();
		Long result = new Long (coefficient * revID);
		return result.toString();
	}

	// Given an encoded review360Id, decodes it back to a form that can be used for query on review360Id field
	public String decodeReview360LightID(String encRevID) {
		long coefficient = 2125551212L;  // largest integer is: 214 748 3647
		long revID = Long.valueOf(encRevID).longValue();
		Long result = new Long (revID/ coefficient);
		return result.toString();
	}

	
	public String getReviewedById() { return reviewedById; }
	public void setReviewedById(String reviewedById) { this.reviewedById = reviewedById; }
	public Staff getReviewedBy(){ return new Staff(reviewedById); }
	public void setReviewedBy(Staff s) { this.reviewedById = s.getAccountNo(); }
	public void assocReviewedBy(Staff s) { setReviewedBy(s); }
	public void dissocReviewedBy(Staff s) { setReviewedById(""); }
	
	
	public String getReviewedByTitle() { return reviewedByTitle; }
	public void setReviewedByTitle(String reviewedByTitle) { this.reviewedByTitle = reviewedByTitle; }
	public String getReviewedByFirstName() { return reviewedByFirstName; }
	public void setReviewedByFirstName(String reviewedByFirstName) { this.reviewedByFirstName = reviewedByFirstName; }
	public String getReviewedByLastName() { return reviewedByLastName; }
	public void setReviewedByLastName(String reviewedByLastName) { this.reviewedByLastName = reviewedByLastName; }
	public String getReviewedByEmail() { return reviewedByEmail; }
	public void setReviewedByEmail(String reviewedByEmail) { this.reviewedByEmail = reviewedByEmail; }
	
	//public String getReviewedByIsMale() { return reviewedByIsMale; }
	//public void setReviewedByIsMale(String reviewedByIsMale) { this.reviewedByIsMale = reviewedByIsMale; }
	//public boolean getReviewedByIsStaff() { return reviewedByIsStaff; }
	//public void setReviewedByIsStaff(boolean reviewedByIsStaff) { this.reviewedByIsStaff = reviewedByIsStaff; }
	
	
	public Date getDateStarted() { return dateStarted; }
	public void setDateStarted(Date dateStarted) { this.dateStarted = org.alt60m.util.DateUtils.clearTimeFromDate(dateStarted); }
	
	public Date getDateCompleted() { return dateCompleted; }
	public void setDateCompleted(Date dateCompleted) { this.dateCompleted = org.alt60m.util.DateUtils.clearTimeFromDate(dateCompleted); }
	
	public Date getDateDue() { return dateDue; }
	public void setDateDue(Date dateDue) { this.dateDue = org.alt60m.util.DateUtils.clearTimeFromDate(dateDue); }
	
	public String getCurrentPosition() { return currentPosition; }
	public void setCurrentPosition(String currentPosition) { this.currentPosition = currentPosition; }
	
	public String getLeadershipLevel() { return leadershipLevel; }
	public void setLeadershipLevel(String leadershipLevel) { this.leadershipLevel = leadershipLevel; }
	
	public String getRelationship() { return relationship; }
	public void setRelationship(String relationship) { this.relationship = relationship; }
	
	public String getQ1() { return q1; }
	public void setQ1(String q1) { this.q1 = q1; }
	
	public String getQ2() { return q2; }
	public void setQ2(String q2) { this.q2 = q2; }
	
	public String getQ3() { return q3; }
	public void setQ3(String q3) { this.q3 = q3; }
	
	public String getQ4() { return q4; }
	public void setQ4(String q4) { this.q4 = q4; }
	
	public String getQ5() { return q5; }
	public void setQ5(String q5) { this.q5 = q5; }
	
	public String getQ6() { return q6; }
	public void setQ6(String q6) { this.q6 = q6; }
	
	public String getQ7() { return q7; }
	public void setQ7(String q7) { this.q7 = q7; }
	
	public String getQ8() { return q8; }
	public void setQ8(String q8) { this.q8 = q8; }
	
	public String getQ9() { return q9; }
	public void setQ9(String q9) { this.q9 = q9; }

	
	
	
	public int getFkSessionLightId() {
		return fkSessionLightId;
	}
	public void setFkSessionLightId(int fkSessionLightId) {
		this.fkSessionLightId = fkSessionLightId;
	}
	
	public String getReviewSessionId(){ return String.valueOf(getFkSessionLightId()); }
	public void setReviewSessionId(String sessionLightId) { setFkSessionLightId(Integer.parseInt(sessionLightId)); }
	public String getReviewSessionLightId(){ return getReviewSessionId(); }
	public void setReviewSessionLightId(String sessionLightId) { setReviewSessionId(sessionLightId); }
	public ReviewSessionLight getReviewSessionLight(){ return new ReviewSessionLight(getReviewSessionId()); }
	public void setReviewSessionLight(ReviewSessionLight session) { setReviewSessionLightId(session.getReviewSessionLightId()); }
	
	
	public void dissocReviewSessionLight(){ setFkSessionLightId(0); }
	public void assocReviewSessionLight(ReviewSessionLight session){ setReviewSessionLight(session); }

}
