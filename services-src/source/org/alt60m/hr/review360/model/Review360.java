/* Generated by Together */

package org.alt60m.hr.review360.model;

import java.util.Date;
import java.util.Calendar;

/**
 * @persistent 
 * @table hr_review360_Review360
 * @cache-type none
 * @access shared
 * @key-generator UUID
 */
public class Review360 {
	/**
     * @field-type org.alt60m.hr.review360.model.ReviewSession
     * @sql-type varchar
     * @sql-size 64
     * @sql-name fk_ReviewSessionID
     * @sql-index
     * @set-method assocReviewSession
     * @get-method getReviewSession
     */
    private ReviewSession session;

	/**
     * @sql-type varchar
     * @sql-size 64
     * @primary-key
     */
    private String Review360ID = "";

	/**
     * @sql-type varchar
     * @sql-size 64
     */
	private String reviewedByID = "";
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
	/**
     * @sql-type varchar
     * @sql-size 128
     */
	private String relationship = "";
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q1 = "";
	private int q2;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q3 = "";
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q4 = "";
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q5 = "";
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q6 = "";
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q7 = "";
	private int q8;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q9 = "";
	private int q10;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q11 = "";
	private int q12;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q13 = "";
	private int q14;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q15 = "";
	private int q16;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q17 = "";
	private int q18;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q19 = "";
	private int q20;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q21 = "";
	private int q22;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q23 = "";
	private int q24;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q25 = "";
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q26 = "";
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q27 = "";
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q28f1 = "";
	private int q28f2;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q28l1 = "";
	private int q28l2;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q28o1 = "";
	private int q28o2;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q28a1 = "";
	private int q28a2;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q28t1 = "";
	private int q28t2;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q28s1 = "";
	private int q28s2;
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q29 = "";
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q30 = "";
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q31 = "";
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q32 = "";
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q33 = "";
	/**
     * @Xsql-type varchar
     * @Xsql-size 2048
     */
	private String q34 = "";

    public String getReview360ID() {
		return Review360ID;
    }

	public void setReview360ID(String Review360ID) {
		this.Review360ID = Review360ID; 
	}
	public String getReviewedByID() {
		return reviewedByID; 
	}
	public void setReviewedByID(String reviewedByID) {
		this.reviewedByID = reviewedByID; 
	}
	public Date getDateStarted() {
		return dateStarted; 
	}
	public void setDateStarted(Date dateStarted) {
	    if (dateStarted != null) {
		Calendar cin = Calendar.getInstance();
		Calendar cout = Calendar.getInstance();
		cin.setTime(dateStarted);
		cout.clear();
		cout.set(cin.get(Calendar.YEAR), cin.get(Calendar.MONTH), cin.get(Calendar.DATE));
		this.dateStarted = cout.getTime();
	    } else {
		this.dateStarted = dateStarted;
	    }	    
	}
	public Date getDateCompleted() {
		return dateCompleted; 
	}
	public void setDateCompleted(Date dateCompleted) {
	    if (dateCompleted != null) {
		Calendar cin = Calendar.getInstance();
		Calendar cout = Calendar.getInstance();
		cin.setTime(dateCompleted);
		cout.clear();
		cout.set(cin.get(Calendar.YEAR), cin.get(Calendar.MONTH), cin.get(Calendar.DATE));
		this.dateCompleted = cout.getTime();
	    } else {
		this.dateCompleted = dateCompleted;
	    }	    
	}
	public Date getDateDue() {
		return dateDue; 
	}
	public void setDateDue(Date dateDue) {
	    if (dateDue != null) {
		Calendar cin = Calendar.getInstance();
		Calendar cout = Calendar.getInstance();
		cin.setTime(dateDue);
		cout.clear();
		cout.set(cin.get(Calendar.YEAR), cin.get(Calendar.MONTH), cin.get(Calendar.DATE));
		this.dateDue = cout.getTime();
	    } else {
		this.dateDue = dateDue;
	    }	    
	}
	public String getCurrentPosition() {
		return currentPosition; 
	}
	public void setCurrentPosition(String currentPosition) {
		this.currentPosition = currentPosition; 
	}
	public String getLeadershipLevel() {
		return leadershipLevel; 
	}
	public void setLeadershipLevel(String leadershipLevel) {
		this.leadershipLevel = leadershipLevel; 
	}
	public String getRelationship() {
		return relationship; 
	}
	public void setRelationship(String relationship) {
		this.relationship = relationship; 
	}
	public String getQ1() {
		return q1; 
	}
	public void setQ1(String q1) {
		this.q1 = q1; 
	}
	public int getQ2() {
		return q2;
	}
	public void setQ2(int q2) {
		this.q2 = q2;
	}
	public String getQ3() {
		return q3; 
	}
	public void setQ3(String q3) {
		this.q3 = q3; 
	}
	public String getQ4() {
		return q4; 
	}
	public void setQ4(String q4) {
		this.q4 = q4; 
	}
	public String getQ5() {
		return q5; 
	}
	public void setQ5(String q5) {
		this.q5 = q5; 
	}
	public String getQ6() {
		return q6; 
	}
	public void setQ6(String q6) {
		this.q6 = q6; 
	}
	public String getQ7() {
		return q7; 
	}
	public void setQ7(String q7) {
		this.q7 = q7; 
	}
	public int getQ8() {
		return q8;
	}
	public void setQ8(int q8) {
		this.q8 = q8;
	}
	public String getQ9() {
		return q9; 
	}
	public void setQ9(String q9) {
		this.q9 = q9; 
	}
	public int getQ10() {
		return q10;
	}
	public void setQ10(int q10) {
		this.q10 = q10; 
	}
	public String getQ11() {
		return q11; 
	}
	public void setQ11(String q11) {
		this.q11 = q11; 
	}
	public int getQ12() {
		return q12; 
	}
	public void setQ12(int q12) {
		this.q12 = q12; 
	}
	public String getQ13() {
		return q13; 
	}
	public void setQ13(String q13) {
		this.q13 = q13; 
	}
	public int getQ14() {
		return q14;
	}
	public void setQ14(int q14) {
		this.q14 = q14;
	}
	public String getQ15() {
		return q15; 
	}
	public void setQ15(String q15) {
		this.q15 = q15; 
	}
	public int getQ16() {
		return q16;
	}
	public void setQ16(int q16) {
		this.q16 = q16;
	}
	public String getQ17() {
		return q17; 
	}
	public void setQ17(String q17) {
		this.q17 = q17; 
	}
	public int getQ18() {
		return q18; 
	}
	public void setQ18(int q18) {
		this.q18 = q18;
	}
	public String getQ19() {
		return q19; 
	}
	public void setQ19(String q19) {
		this.q19 = q19; 
	}
	public int getQ20() {
		return q20;
	}
	public void setQ20(int q20) {
		this.q20 = q20;
	}
	public String getQ21() {
		return q21; 
	}
	public void setQ21(String q21) {
		this.q21 = q21; 
	}
	public int getQ22() {
		return q22; 
	}
	public void setQ22(int q22) {
		this.q22 = q22;
	}
	public String getQ23() {
		return q23; 
	}
	public void setQ23(String q23) {
		this.q23 = q23; 
	}
	public int getQ24() {
		return q24; 
	}
	public void setQ24(int q24) {
		this.q24 = q24; 
	}
	public String getQ25() {
		return q25; 
	}
	public void setQ25(String q25) {
		this.q25 = q25; 
	}
	public String getQ26() {
		return q26; 
	}
	public void setQ26(String q26) {
		this.q26 = q26; 
	}
	public String getQ27() {
		return q27; 
	}
	public void setQ27(String q27) {
		this.q27 = q27; 
	}
	public String getQ28f1() {
		return q28f1; 
	}
	public void setQ28f1(String q28f1) {
		this.q28f1 = q28f1; 
	}
	public int getQ28f2() {
		return q28f2; 
	}
	public void setQ28f2(int q28f2) {
		this.q28f2 = q28f2; 
	}
	public String getQ28l1() {
		return q28l1; 
	}
	public void setQ28l1(String q28l1) {
		this.q28l1 = q28l1; 
	}
	public int getQ28l2() {
		return q28l2; 
	}
	public void setQ28l2(int q28l2) {
		this.q28l2 = q28l2; 
	}
	public String getQ28o1() {
		return q28o1; 
	}
	public void setQ28o1(String q28o1) {
		this.q28o1 = q28o1; 
	}
	public int getQ28o2() {
		return q28o2; 
	}
	public void setQ28o2(int q28o2) {
		this.q28o2 = q28o2; 
	}
	public String getQ28a1() {
		return q28a1; 
	}
	public void setQ28a1(String q28a1) {
		this.q28a1 = q28a1; 
	}
	public int getQ28a2() {
		return q28a2; 
	}
	public void setQ28a2(int q28a2) {
		this.q28a2 = q28a2; 
	}
	public String getQ28t1() {
		return q28t1; 
	}
	public void setQ28t1(String q28t1) {
		this.q28t1 = q28t1; 
	}
	public int getQ28t2() {
		return q28t2; 
	}
	public void setQ28t2(int q28t2) {
		this.q28t2 = q28t2; 
	}
	public String getQ28s1() {
		return q28s1; 
	}
	public void setQ28s1(String q28s1) {
		this.q28s1 = q28s1; 
	}
	public int getQ28s2() {
		return q28s2; 
	}
	public void setQ28s2(int q28s2) {
		this.q28s2 = q28s2; 
	}
	public String getQ29() {
		return q29; 
	}
	public void setQ29(String q29) {
		this.q29 = q29; 
	}
	public String getQ30() {
		return q30; 
	}
	public void setQ30(String q30) {
		this.q30 = q30; 
	}
	public String getQ31() {
		return q31; 
	}
	public void setQ31(String q31) {
		this.q31 = q31; 
	}
	public String getQ32() {
		return q32; 
	}
	public void setQ32(String q32) {
		this.q32 = q32; 
	}
	public String getQ33() {
		return q33; 
	}
	public void setQ33(String q33) {
		this.q33 = q33; 
	}
	public String getQ34() {
		return q34; 
	}
	public void setQ34(String q34) {
		this.q34 = q34; 
	}

    public ReviewSession getReviewSession(){
            return session;
        }

    public void dissocReviewSession(){
		this.session = null;
    }
	public void assocReviewSession(ReviewSession session){
		this.session = session;
    }

}
