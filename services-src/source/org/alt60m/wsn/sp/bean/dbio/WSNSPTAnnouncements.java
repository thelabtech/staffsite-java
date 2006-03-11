package org.alt60m.wsn.sp.bean.dbio;

import java.util.*;
import org.alt60m.util.*;
import org.alt60m.cms.model.*;

public class WSNSPTAnnouncements implements java.io.Serializable {

	String titleFont = "<FONT FACE=\"Arial\" SIZE=\"3\" COLOR=\"#336699\">";
	String dateFont = "<FONT FACE=\"Arial\" SIZE=\"1\" COLOR=\"#00000\">";
	String authorFont = "<FONT FACE=\"Arial\" SIZE=\"2\" COLOR=\"#336699\">";
	String bodyFont = "<FONT FACE=\"Arial\" SIZE=\"2\" COLOR=\"#000000\">";
	String hr = "<hr color=#336699 size=1>";
	String numOfArticles = "1";
	String categoryId = "00000000355";

    public WSNSPTAnnouncements() {}

	public void setNumOfArticles(String num) {
		numOfArticles = num;
	}
	public void setCategoryId(String num) {
		categoryId = num;
	}
	public String print(String num) {
		setNumOfArticles(num);
		return print();
	}

	public String print() {
		
		String stringBuffer = "";//"<!--  --------------------Recent Articles MODULE ------------------- --> ";
		Hashtable tub = new Hashtable();
		String query = "";
		int numToDisplay;

		//grab the files
		try {
			File file = new File();
			file.changeTargetTable("cms_viewCategoryIDFiles");
			Collection catFiles = ObjectHashUtil.list(file.selectList("CmsCategoryID = '"+categoryId +"' order by dateAdded DESC"));
		
			Iterator iter = catFiles.iterator();
			if (numOfArticles.equals("all"))	{
				numToDisplay=catFiles.size();
			}
			else {
				numToDisplay = new Integer(numOfArticles).intValue();
			}

			for(int i=0; i<numToDisplay && iter.hasNext(); i++) {
				Hashtable recent = (Hashtable) iter.next();
				stringBuffer = stringBuffer + "			<b>" + titleFont + recent.get("Title") + "</font></b>";
				stringBuffer = stringBuffer + "				<br><br>\n" + bodyFont + recent.get("Summary") + "</font>";
				stringBuffer = stringBuffer + hr + "<br>";
			}
		} catch (Exception e) {
			// should handle better!
			e.printStackTrace();
		}
		return stringBuffer;
	}

}
