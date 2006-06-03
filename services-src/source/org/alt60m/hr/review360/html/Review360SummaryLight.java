package  org.alt60m.hr.review360.html;

import java.util.*;
import org.alt60m.ministry.model.dbio.Staff;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class Review360SummaryLight implements java.io.Serializable
{
	private static Log log = LogFactory.getLog(Review360SummaryLight.class);
	
	private String leadershipLevel = "";
	private String q1 = "";
	private String q2 = "";
	private String q3 = "";
	private String q4 = "";
	private String q5 = "";
	private String q6 = "";
	private String q7 = "";
	private String q8 = "";
	private String q9 = "";
	private String info = "";
	private int size;

	String bgcolorG = " BGCOLOR='#DDDDDD'";
	String bgcolorW = " BGCOLOR='#FFFFFF'";
	String fontB = "<FONT FACE=\"Arial\" SIZE=\"2\" COLOR=\"#336699\">";

	public Review360SummaryLight() {}
	
	public Review360SummaryLight(Hashtable _review)
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

			q1 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q1") + "<BR>";
			q2 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q2") + "<BR>";
			q3 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q3") + "<BR>";
			q4 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q4") + "<BR>";
			q5 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q5") + "<BR>";
			q6 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q6") + "<BR>";
			q7 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q7") + "<BR>";
			q8 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q8") + "<BR>";
			q9 += "&nbsp;&nbsp;&nbsp;&nbsp;" +size + ") " + (String)_review.get("Q9") + "<BR>";
			
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

	public void setQ2(String _str){
		try{
			q2 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ2(){
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

	public void setQ8(String _str){
		try{
			q8 = _str;
		}
		catch(Exception e){
		}
	}

	public String getQ8(){
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
		sb.append("q3= " + q3 + ", ");
		sb.append("q4= " + q4 + ", ");
		sb.append("q5= " + q5 + ", ");
		sb.append("q6= " + q6 + ", ");
		sb.append("q7= " + q7 + ", ");
		sb.append("q8= " + q8 + ", ");
		sb.append("q9= " + q9 + ", ");
		sb.append("info= " + info + ", ");
		sb.append("size= " + size + ", ");
		return sb.toString();	
	}

}
