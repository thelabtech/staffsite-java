package  org.alt60m.hr.review360.html;

import java.util.*;
import org.alt60m.ministry.model.dbio.Staff;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class Review360Summary implements java.io.Serializable
{
	private static Log log = LogFactory.getLog(Review360Summary.class);
	
	private String leadershipLevel = "";
	private String q1 = "";
	private float q2;
	private float q2z;
	private String q3 = "";
	private String q4 = "";
	private String q5 = "";
	private String q6 = "";
	private String q7 = "";
	private float q8;
	private float q8z;
	private String q9 = "";
	private float q10;
	private float q10z;
	private String q11 = "";
	private float q12;
	private float q12z;
	private String q13 = "";
	private float q14;
	private float q14z;
	private String q15 = "";
	private float q16;
	private float q16z;
	private String q17 = "";
	private float q18;
	private float q18z;
	private String q19 = "";
	private float q20;
	private float q20z;
	private String q21 = "";
	private float q22;
	private float q22z;
	private String q23 = "";
	private float q24;
	private float q24z;
	private String q25 = "";
	private String q26 = "";
	private String q27 = "";
	private String q28f1 = "";
	private float q28f2;
	private float q28f2z;
	private String q28l1 = "";
	private float q28l2;
	private float q28l2z;
	private String q28o1 = "";
	private float q28o2;
	private float q28o2z;
	private String q28a1 = "";
	private float q28a2;
	private float q28a2z;
	private String q28t1 = "";
	private float q28t2;
	private float q28t2z;
	private String q28s1 = "";
	private float q28s2;
	private float q28s2z;
	private String q29 = "";
	private String q30 = "";
	private String q31 = "";
	private String q32 = "";
	private String q33 = "";
	private String q34 = "";
	private String info = "";
	private int size;

	String bgcolorG = " BGCOLOR='#DDDDDD'";
	String bgcolorW = " BGCOLOR='#FFFFFF'";
	String fontB = "<FONT FACE=\"Arial\" SIZE=\"2\" COLOR=\"#336699\">";

	public Review360Summary() {	}
	
	
	public Review360Summary(Hashtable _review)
	{	
		try{
			size = 1;
			leadershipLevel = (String)_review.get("LeadershipLevel");
			info = "<TR><TH " + bgcolorG + ">" + fontB + "Leadership Level</FONT></TH>" 
					+ "<TH " + bgcolorG + ">" + fontB + "Name</FONT></TH>"
					+ "<TH " + bgcolorG + ">" + fontB + "Current Position</FONT></TH>"
					+ "<TH " + bgcolorG + ">" + fontB + "Relationship</FONT></TH>"
					+ "</TR>";
			setAll(_review);
		}
		catch(Exception e){
		}
	}

	public void setAll(Hashtable _review)
	{
		try{
			// in case it's a non-staff reviewer, use the manually entered name fields before looking for the staff record
			String prefName= (String)_review.get("ReviewedByFirstName");
			String lastName= (String)_review.get("ReviewedByLastName");
			
			// if reviewer is a staff member get official names from staff record
			if(!((String)_review.get("ReviewedById")).equals("")){
				Staff so = new Staff((String)_review.get("ReviewedById"));
				prefName= so.getPreferredName();
				lastName= so.getLastName();
			}
			
			
			info += "<TR>";
			info += "<TD " + bgcolorG + ">" + fontB + leadershipLevel + " <B>" + size + ")</B></TD>";
			info += "<TD " + bgcolorW + ">" + fontB + prefName + " " + lastName + "</FONT></TD>";
			info += "<TD " + bgcolorW + ">" + fontB + (String)_review.get("CurrentPosition") + "</FONT></TD>";
			info += "<TD " + bgcolorW + ">" + fontB + (String)_review.get("Relationship") + "</FONT></TD>";
			info += "</TR>";

			q1 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q1") + "<B> (" + ((Integer)_review.get("Q2")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q2")).intValue() == 0){
				q2z++;
			} else{	
				q2 += ((Integer)_review.get("Q2")).intValue();
			}
			q3 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q3") + "<BR>";
			q4 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q4") + "<BR>";
			q5 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q5") + "<BR>";
			q6 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q6") + "<BR>";
			q7 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q7") + "<B> (" + ((Integer)_review.get("Q8")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q8")).intValue() == 0){
				q8z++;
			} else{	
				q8 += ((Integer)_review.get("Q8")).intValue();
			}
			q9 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q9") + "<B> (" + ((Integer)_review.get("Q10")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q10")).intValue() == 0){
				q10z++;
			} else{	
				q10 += ((Integer)_review.get("Q10")).intValue();
			}
			q11 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q11") + "<B> (" + ((Integer)_review.get("Q12")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q12")).intValue() == 0){
				q12z++;
			} else{	
				q12 += ((Integer)_review.get("Q12")).intValue();
			}
			q13 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q13") + "<B> (" + ((Integer)_review.get("Q14")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q14")).intValue() == 0){
				q14z++;
			} else{	
				q14 += ((Integer)_review.get("Q14")).intValue();
			}
			q15 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q15") + "<B> (" + ((Integer)_review.get("Q16")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q16")).intValue() == 0){
				q16z++;
			} else{	
				q16 += ((Integer)_review.get("Q16")).intValue();
			}
			q17 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q17") + "<B> (" + ((Integer)_review.get("Q18")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q18")).intValue() == 0){
				q18z++;
			} else{	
				q18 += ((Integer)_review.get("Q18")).intValue();
			}
			q19 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q19") + "<B> (" + ((Integer)_review.get("Q20")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q20")).intValue() == 0){
				q20z++;
			} else{	
				q20 += ((Integer)_review.get("Q20")).intValue();
			}
			q21 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q21") + "<B> (" + ((Integer)_review.get("Q22")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q22")).intValue() == 0){
				q22z++;
			} else{	
				q22 += ((Integer)_review.get("Q22")).intValue();
			}
			q23 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q23") + "<B> (" + ((Integer)_review.get("Q24")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q24")).intValue() == 0){
				q24z++;
			} else{	
				q24 += ((Integer)_review.get("Q24")).intValue();
			}
			q25 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q25") + "<BR>";
			q26 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q26") + "<BR>";
			q27 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q27") + "<BR>";
			q28f1 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q28f1") + "<B> (" + ((Integer)_review.get("Q28f2")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q28f2")).intValue() == 0){
				q28f2z++;
			} else{	
				q28f2 += ((Integer)_review.get("Q28f2")).intValue();
			}
			q28l1 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q28l1") + "<B> (" + ((Integer)_review.get("Q28l2")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q28l2")).intValue() == 0){
				q28l2z++;
			} else{	
				q28l2 += ((Integer)_review.get("Q28l2")).intValue();
			}
			q28o1 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q28o1") + "<B> (" + ((Integer)_review.get("Q28o2")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q28o2")).intValue() == 0){
				q28o2z++;
			} else{	
				q28o2 += ((Integer)_review.get("Q28o2")).intValue();
			}
			q28a1 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q28a1") + "<B> (" + ((Integer)_review.get("Q28a2")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q28a2")).intValue() == 0){
				q28a2z++;
			} else{	
				q28a2 += ((Integer)_review.get("Q28a2")).intValue();
			}
			q28t1 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q28t1") + "<B> (" + ((Integer)_review.get("Q28t2")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q28t2")).intValue() == 0){
				q28t2z++;
			} else{	
				q28t2 += ((Integer)_review.get("Q28t2")).intValue();
			}
			q28s1 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q28s1") + "<B> (" + ((Integer)_review.get("Q28s2")).intValue() + ")</B><BR>";
			if(((Integer)_review.get("Q28s2")).intValue() == 0){
				q28s2z++;
			} else{	
				q28s2 += ((Integer)_review.get("Q28s2")).intValue();
			}
			q29 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q29") + "<BR>";
			q30 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q30") + "<BR>";
			q31 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q31") + "<BR>";
			q32 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q32") + "<BR>";
			q33 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q33") + "<BR>";
			q34 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q34") + "<BR>";
			
		}
		catch(Exception e){
			log.error(e);
		}
	}

	public void setLeadershipLevel(String _str){
		try{
			leadershipLevel = _str;
		}
		catch(Exception e){
		}
	}

	public String getLeadershipLevel(){
		return leadershipLevel;
	}

	public String getInfo(){
		return info;
	}

	public void setQ1(String _str){
		try{
			q1 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ1(){
		return q1;
	}

	public void setQ2(float _flt){
		try{
			q2 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ2(){
		return q2;
	}

	public void setQ3(String _str){
		try{
			q3 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ3(){
		return q3;
	}

	public void setQ4(String _str){
		try{
			q4 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ4(){
		return q4;
	}

	public void setQ5(String _str){
		try{
			q5 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ5(){
		return q5;
	}

	public void setQ6(String _str){
		try{
			q6 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ6(){
		return q6;
	}

	public void setQ7(String _str){
		try{
			q7 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ7(){
		return q7;
	}

	public void setQ8(float _flt){
		try{
			q8 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ8(){
		return q8;
	}

	public void setQ9(String _str){
		try{
			q9 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ9(){
		return q9;
	}

	public void setQ10(float _flt){
		try{
			q10 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ10(){
		return q10;
	}

	public void setQ11(String _str){
		try{
			q11 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ11(){
		return q11;
	}

	public void setQ12(float _flt){
		try{
			q12 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ12(){
		return q12;
	}

	public void setQ13(String _str){
		try{
			q13 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ13(){
		return q13;
	}

	public void setQ14(float _flt){
		try{
			q14 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ14(){
		return q14;
	}

	public void setQ15(String _str){
		try{
			q15 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ15(){
		return q15;
	}

	public void setQ16(float _flt){
		try{
			q16 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ16(){
		return q16;
	}

	public void setQ17(String _str){
		try{
			q17 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ17(){
		return q17;
	}

	public void setQ18(float _flt){
		try{
			q18 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ18(){
		return q18;
	}

	public void setQ19(String _str){
		try{
			q19 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ19(){
		return q19;
	}

	public void setQ20(float _flt){
		try{
			q20 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ20(){
		return q20;
	}

	public void setQ21(String _str){
		try{
			q21 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ21(){
		return q21;
	}

	public void setQ22(float _flt){
		try{
			q22 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ22(){
		return q22;
	}

	public void setQ23(String _str){
		try{
			q23 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ23(){
		return q23;
	}

	public void setQ24(float _flt){
		try{
			q24 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ24(){
		return q24;
	}

	public void setQ25(String _str){
		try{
			q25 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ25(){
		return q25;
	}

	public void setQ26(String _str){
		try{
			q26 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ26(){
		return q26;
	}
	
	public void setQ27(String _str){
		try{
			q27 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ27(){
		return q27;
	}

	public void setQ28f1(String _str){
		try{
			q28f1 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ28f1(){
		return q28f1;
	}

	public void setQ28f2(float _flt){
		try{
			q28f2 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ28f2(){
		return q28f2;
	}

	public void setQ28l1(String _str){
		try{
			q28l1 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ28l1(){
		return q28l1;
	}

	public void setQ28l2(float _flt){
		try{
			q28l2 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ28l2(){
		return q28l2;
	}

	public void setQ28o1(String _str){
		try{
			q28o1 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ28o1(){
		return q28o1;
	}

	public void setQ28o2(float _flt){
		try{
			q28o2 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ28o2(){
		return q28o2;
	}

	public void setQ28a1(String _str){
		try{
			q28a1 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ28a1(){
		return q28a1;
	}

	public void setQ28a2(float _flt){
		try{
			q28a2 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ28a2(){
		return q28a2;
	}

	public void setQ28t1(String _str){
		try{
			q28t1 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ28t1(){
		return q28t1;
	}

	public void setQ28t2(float _flt){
		try{
			q28t2 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ28t2(){
		return q28t2;
	}

	public void setQ28s1(String _str){
		try{
			q28s1 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ28s1(){
		return q28s1;
	}

	public void setQ28s2(float _flt){
		try{
			q28s2 = _flt;
		}
		catch(Exception e){
		}
	}

	public float getQ28s2(){
		return q28s2;
	}

	public void setQ29(String _str){
		try{
			q29 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ29(){
		return q29;
	}

	public void setQ30(String _str){
		try{
			q30 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ30(){
		return q30;
	}

	public void setQ31(String _str){
		try{
			q31 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ31(){
		return q31;
	}

	public void setQ32(String _str){
		try{
			q32 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ32(){
		return q32;
	}

	public void setQ33(String _str){
		try{
			q33 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ33(){
		return q33;
	}

	public void setQ34(String _str){
		try{
			q34 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ34(){
		return q34;
	}

	public void calc(){
		q2 = q2/(size - q2z);
		q8 = q8/(size - q8z);
		q10 = q10/(size - q10z);
		q12 = q12/(size - q12z);
		q14 = q14/(size - q14z);
		q16 = q16/(size - q16z);
		q18 = q18/(size - q18z);
		q20 = q20/(size - q20z);
		q22 = q22/(size - q22z);
		q24 = q24/(size - q24z);
		q28f2 = q28f2/(size - q28f2z);
		q28l2 = q28l2/(size - q28l2z);
		q28o2 = q28o2/(size - q28o2z);
		q28a2 = q28a2/(size - q28a2z);
		q28t2 = q28t2/(size - q28t2z);
		q28s2 = q28s2/(size - q28s2z);
	}

	public void append(Hashtable _review)
	{
		size++;
		setAll(_review);
	}

	public String toString()
	{
		StringBuffer sb = new StringBuffer();		

		sb.append("leadershipLevel = " + leadershipLevel);
		sb.append("q1" + q1);
		sb.append("q2= " + q2 + ", ");
		sb.append("q2z= " + q2z + ", ");
		sb.append("q3= " + q3 + ", ");
		sb.append("q4= " + q4 + ", ");
		sb.append("q5= " + q5 + ", ");
		sb.append("q6= " + q6 + ", ");
		sb.append("q7= " + q7 + ", ");
		sb.append("q8= " + q8 + ", ");
		sb.append("q8z= " + q8z + ", ");
		sb.append("q9= " + q9 + ", ");
		sb.append("q10= " + q10 + ", ");
		sb.append("q10z= " + q10z + ", ");
		sb.append("q11= " + q11 + ", ");
		sb.append("q12= " + q12 + ", ");
		sb.append("q12z= " + q12z + ", ");
		sb.append("q13= " + q13 + ", ");
		sb.append("q14= " + q14 + ", ");
		sb.append("q14z= " + q14z + ", ");
		sb.append("q15= " + q15 + ", ");
		sb.append("q16= " + q16 + ", ");
		sb.append("q16z= " + q16z + ", ");
		sb.append("q17= " + q17 + ", ");
		sb.append("q18= " + q18 + ", ");
		sb.append("q18z= " + q18z + ", ");
		sb.append("q19= " + q19 + ", ");
		sb.append("q20= " + q20 + ", ");
		sb.append("q20z= " + q20z + ", ");
		sb.append("q21= " + q21 + ", ");
		sb.append("q22= " + q22 + ", ");
		sb.append("q22z= " + q22 + ", ");
		sb.append("q23= " + q23 + ", ");
		sb.append("q24= " + q24 + ", ");
		sb.append("q24z= " + q24z + ", ");
		sb.append("q25= " + q25 + ", ");
		sb.append("q26= " + q26 + ", ");
		sb.append("q27= " + q27 + ", ");
		sb.append("q28f1= " + q28f1 + ", ");
		sb.append("q28f2= " + q28f2 + ", ");
		sb.append("q28f2z= " + q28f2z + ", ");
		sb.append("q28l1= " + q28l1 + ", ");
		sb.append("q28l2= " + q28l2 + ", ");
		sb.append("q28l2z= " + q28l2z + ", ");
		sb.append("q28o1= " + q28o1 + ", ");
		sb.append("q28o2= " + q28o2 + ", ");
		sb.append("q28o2z= " + q28o2z + ", ");
		sb.append("q28a1= " + q28a1 + ", ");
		sb.append("q28a2= " + q28a2 + ", ");
		sb.append("q28a2z= " + q28a2z + ", ");
		sb.append("q28t1= " + q28t1 + ", ");
		sb.append("q28t2= " + q28t2 + ", ");
		sb.append("q28t2z= " + q28t2z + ", ");
		sb.append("q28s1= " + q28s1 + ", ");
		sb.append("q28s2= " + q28s2 + ", ");
		sb.append("q28s2z= " + q28s2z + ", ");
		sb.append("q29= " + q29 + ", ");
		sb.append("q30= " + q30 + ", ");
		sb.append("q31= " + q31 + ", ");
		sb.append("q32= " + q32 + ", ");
		sb.append("q33= " + q33 + ", ");
		sb.append("q34= " + q34 + ", ");
		sb.append("info= " + info + ", ");
		sb.append("size= " + size + ", ");
		return sb.toString();	
	}

}
