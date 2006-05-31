package org.alt60m.wsn.sp.model.dbio;

import java.util.Date;
import com.kenburcham.framework.dbio.DBIOEntity;
//import com.kenburcham.framework.dbio.DBIOEntityException;

public class WsnEvaluation extends DBIOEntity {
	public boolean isPKEmpty() {
		return evalID == 0;
	}
	public WsnEvaluation() {
	}
	public WsnEvaluation(String id) {
		evalID = (new Integer(id)).intValue();
		select();
	}
	public WsnEvaluation(int id) {
		evalID = id;
		select();
	}
	
	public void localinit() {
		String table = "wsn_sp_wsnevaluation";
		
		setMetadata("EvalID", "evalID", "IDENTITY");
		setMetadata("ApplicantNotified", "applicantNotified", table);
		setMetadata("_Qual1", "_Qual1", table);
		setMetadata("_Qual2", "_Qual2", table);
		setMetadata("_Qual3", "_Qual3", table);
		setMetadata("_Qual4", "_Qual4", table);
		setMetadata("_Qual5", "_Qual5", table);
		setMetadata("_Qual6", "_Qual6", table);
		setMetadata("_Qual7", "_Qual7", table);
		setMetadata("_Qual8", "_Qual8", table);
		setMetadata("_DeQual1", "_DeQual1", table);
		setMetadata("_DeQual2", "_DeQual2", table);
		setMetadata("_DeQual3", "_DeQual3", table);
		setMetadata("_DeQual4", "_DeQual4", table);
		setMetadata("_DeQual5", "_DeQual5", table);
		setMetadata("_DeQual6", "_DeQual6", table);
		setMetadata("Score", "score", table);
		setMetadata("Comment", "comment", table);
		setMetadata("Fk_WsnApplicationID", "fk_WsnApplicationID", table);
		setMetadata("Parent_dateCreated", "parent_dateCreated", table);
		setMetadata("Parent_haveDiscussed", "parent_haveDiscussed", table);
		setMetadata("Parent_advice", "parent_advice", table);
		setMetadata("Parent_adviceReason", "parent_adviceReason", table);
		setMetadata("Parent_name", "parent_name", table);
		setMetadata("Parent_signature", "parent_signature", table);
		setMetadata("Parent_dateSigned", "parent_dateSigned", table);
		
		setAutodetectProperties(false);
	}

    //Evaluator Summary Info
    private int evalID;
    private boolean applicantNotified;
    private int _Qual1;
    private int _Qual2;
    private int _Qual3;
    private int _Qual4;
    private int _Qual5;
    private int _Qual6;
    private int _Qual7;
    private int _Qual8;
    private boolean _DeQual1;
    private boolean _DeQual2;
    private boolean _DeQual3;
    private boolean _DeQual4;
    private boolean _DeQual5;
    private boolean _DeQual6;
    private int score;
    private String comment;
    private int fk_WsnApplicationID = 0;

    //Parent's Letter Info
    private Date parent_dateCreated;
    private boolean parent_haveDiscussed;
    private int parent_advice;
    private String parent_adviceReason;
    private String parent_name;
    private String parent_signature;
    private Date parent_dateSigned;


    //Evaluator Summary Info
	public String getEvalID(){ return (new Integer(evalID)).toString(); }
	public void setEvalID(String newValue){
		if (newValue != null && !newValue.equals("")) {
			evalID = (new Integer(newValue)).intValue();
		} else {
			evalID = -1;
		}
	}
	public int getEvalIDInt(){ return evalID; }
	public void setEvalIDInt(int newValue){ evalID = newValue; }

    public boolean getApplicantNotified(){ return applicantNotified; }
    public void setApplicantNotified(boolean newValue){ this.applicantNotified = newValue; }

    public int get_Qual1(){ return _Qual1; }
    public void set_Qual1(int newValue){ _Qual1 = newValue; }

    public int get_Qual2(){ return _Qual2; }
    public void set_Qual2(int newValue){ _Qual2 = newValue; }

    public int get_Qual3(){ return _Qual3; }
    public void set_Qual3(int newValue){ _Qual3 = newValue; }

    public int get_Qual4(){ return _Qual4; }
    public void set_Qual4(int newValue){ _Qual4 = newValue; }

    public int get_Qual5(){ return _Qual5; }
    public void set_Qual5(int newValue){ _Qual5 = newValue; }

    public int get_Qual6(){ return _Qual6; }
    public void set_Qual6(int newValue){ _Qual6 = newValue; }

    public int get_Qual7(){ return _Qual7; }
    public void set_Qual7(int newValue){ _Qual7 = newValue; }

    public int get_Qual8(){ return _Qual8; }
    public void set_Qual8(int newValue){ _Qual8 = newValue; }

    public boolean get_DeQual1(){ return _DeQual1; }
    public void set_DeQual1(boolean newValue){ _DeQual1 = newValue; }

    public boolean get_DeQual2(){ return _DeQual2; }
    public void set_DeQual2(boolean newValue){ _DeQual2 = newValue; }

    public boolean get_DeQual3(){ return _DeQual3; }
    public void set_DeQual3(boolean newValue){ _DeQual3 = newValue; }

    public boolean get_DeQual4(){ return _DeQual4; }
    public void set_DeQual4(boolean newValue){ _DeQual4 = newValue; }

    public boolean get_DeQual5(){ return _DeQual5; }
    public void set_DeQual5(boolean newValue){ _DeQual5 = newValue; }

    public boolean get_DeQual6(){ return _DeQual6; }
    public void set_DeQual6(boolean newValue){ _DeQual6 = newValue; }

    public int getScore(){ return score; }
    public void setScore(int newValue){ score = newValue; }

    public String getComment(){ return comment; }
    public void setComment(String newValue){ comment = newValue; }

    public String getFk_WsnApplicationID(){ return String.valueOf(fk_WsnApplicationID); }
    public void setFk_WsnApplicationID(int newValue){ fk_WsnApplicationID = newValue; }
    public void setFk_WsnApplicationIDStr(String newValue){
    	if (newValue != null && !newValue.equals("") && !newValue.equals(" ")) {
    		fk_WsnApplicationID = Integer.parseInt(newValue);
    	}
    }

    //Parent's Letter Info
    public Date getParent_dateCreated(){ return parent_dateCreated; }
    public void setParent_dateCreated(Date newValue){ parent_dateCreated = newValue; }

    public boolean getParent_haveDiscussed(){ return parent_haveDiscussed; }
    public void setParent_haveDiscussed(boolean newValue){ parent_haveDiscussed = newValue; }

    public int getParent_advice(){ return parent_advice; }
    public void setParent_advice(int newValue){ parent_advice = newValue; }

    public String getParent_adviceReason(){ return parent_adviceReason; }
    public void setParent_adviceReason(String newValue){ parent_adviceReason = newValue; }

    public String getParent_name(){ return parent_name; }
    public void setParent_name(String newValue){ parent_name = newValue; }

    public String getParent_signature(){ return parent_signature; }
    public void setParent_signature(String newValue){ parent_signature = newValue; }

    public Date getParent_dateSigned(){ return parent_dateSigned; }
    public void setParent_dateSigned(Date newValue){ parent_dateSigned = newValue; }

}
