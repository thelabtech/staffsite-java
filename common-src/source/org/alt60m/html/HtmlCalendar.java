package org.alt60m.html;
import java.util.*;

public class HtmlCalendar implements java.io.Serializable {

    private static final String VERSION = "ver. 1.0";
    private static final String CPR = "&copy; alt.60M 2000 ";
    private static String NEWLINE = "\n";
    public static final int MONDAY_FIRST = 1;
    public static final int SUNDAY_FIRST = 2;
    private Hashtable cnf;
    private static final String Mnth[] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
    private static final String wkdays[] = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
    private int year;
    private int month;
    private int style;
     private String jspPage;
   private String sFont;

    public HtmlCalendar() {
        GregorianCalendar myCalendar = new GregorianCalendar();
        cnf = new Hashtable();
        NEWLINE = System.getProperty("line.separator");
        style = 2;
        month = myCalendar.get(Calendar.MONTH)+1; //month digits as we know them
        year = myCalendar.get(Calendar.YEAR);
    }

    public void setYear(int i) {
        if(i > 0) {
            year = i;
			cnf.clear();
        }
    }
   
	public void setFont(String s) { sFont = s; }

	public void setJspPage(String s) { jspPage = s; }

	public int getYear() { return year; }

    public void setMonth(int i) {
        if(i >= 1 && i <= 12) {
            month = i;
            cnf.clear();
        }
    }

    public int getMonth() { return month; }

    public void setStyle(int i) {style = i;}

    public int getStyle() {return style;}

    private int getDay(Calendar calendar) {
        if(style == 2) return (calendar.get(Calendar.DAY_OF_WEEK)-1)%7;// + 1;
        else return (calendar.get(Calendar.DAY_OF_WEEK) + 6) % 7;
    }

    public void setActions(String s, String s1) {
        for(int i = 1; i <= 31; i++) setAction(i, s, s1);
    }

    public void setAction(int i, String s, String s1) {
        if(s != null) {
            cnf.put(String.valueOf(i), s);
            if(s1 != null && s1.length() > 0) cnf.put(i + "target", s1);
        }
    }

    private String stringDate(Calendar calendar) {
        String s = String.valueOf(calendar.get(Calendar.YEAR));
        return s + twoDigits(calendar.get(Calendar.MONTH) + 1) + twoDigits(calendar.get(Calendar.DATE));
    }

    private String twoDigits(int i) {
        String s = String.valueOf(i);
        if(s.length() == 1) return "0" + s;
        else return s;
    }

    private String formatObject(String s, Object obj) {
        String s1 = "";
        if(obj != null) s1 = String.valueOf(obj);
        if(s == null) return s1;
        else return s + s1 + "</font>";
    }
	
	public String getHtml()
    {
        GregorianCalendar myCalendar = new GregorianCalendar(year, month - 1, 1);
        int i = month - 1;
        StringBuffer sb = new StringBuffer("");
        sb.append("<table><tr>" + NEWLINE);
        if(style == 2)
        {
            sb.append("<th align=right>" + formatObject(sFont, wkdays[0]) + "</th>" + NEWLINE);
            for(int j = 1; j < 7; j++)
                sb.append("<th align=right>" + formatObject(sFont, wkdays[j]) + "</th>" + NEWLINE);

        } else
        {
            sb.append("<th align=right>" + formatObject(sFont, wkdays[1]) + "</th>" + NEWLINE);
            for(int k = 2; k < 8; k++)
                sb.append("<th align=right>" + formatObject(sFont, wkdays[k % 7]) + "</th>" + NEWLINE);

        }
        sb.append("  </tr>" + NEWLINE);
        int l = 0;
        if(getDay(myCalendar) > 0)
        {
            sb.append("  <tr>");
            for(; l < getDay(myCalendar); l++)
            {
                sb.append("<td align=right>");
                if(sFont != null)
                    sb.append(sFont + "</font>");
                sb.append("</td>" + NEWLINE);
            }

        }
        for(; myCalendar.get(Calendar.MONTH) == i; myCalendar.add(Calendar.DATE, 1))
        {
            int myDate = myCalendar.get(Calendar.DATE);
            int myWeek = (l + myDate) % 7;
            if(myWeek == 1)
                sb.append("  <tr>" + NEWLINE);
            sb.append("<td align=right>");
            if(sFont != null)
                sb.append(sFont);
            String s;
            if((s = (String)cnf.get(String.valueOf(myDate))) != null)
            {
                sb.append("<a href=\"");
                if(s.toUpperCase().startsWith("HTT") || s.indexOf(".") > 0)
                {
                    sb.append(s);
                    if(s.indexOf("?") < 0)
                        sb.append("?date=" + stringDate(myCalendar));
                    else
                        sb.append("&date=" + stringDate(myCalendar));
                } else
                {
                    sb.append("javascript:" + s + "('" + stringDate(myCalendar) + "');");
                }
                sb.append("\"");
                if((s = (String)cnf.get(myDate + "target")) != null)
                    sb.append(" target=\"" + s + "\"");
                sb.append(">");
                sb.append(myCalendar.get(Calendar.DATE));
                sb.append("</a>" + NEWLINE);
            } else
            {
                sb.append(String.valueOf(myDate));
            }
            if(sFont != null)
                sb.append("</font>");
            sb.append("</td>" + NEWLINE);
            if(myWeek == 0)
                sb.append("  </tr>" + NEWLINE);
        }

        l = (myCalendar.get(Calendar.DATE) - 1) + l;
        if(l % 7 != 0)
        {
            for(; l % 7 != 0; l++)
            {
                sb.append("<td align=right>");
                if(sFont != null)
                    sb.append(sFont + "</font>");
                sb.append("</td>" + NEWLINE);
            }

            sb.append("  </tr>" + NEWLINE);
        }
        sb.append("</table>" + NEWLINE);
        return sb.toString();
    }

	public String getPickHtml()
    {
        GregorianCalendar myCalendar = new GregorianCalendar(year, month - 1, 1);
        int i = month - 1;
        StringBuffer sb = new StringBuffer("");
        sb.append("<table>" + NEWLINE);
		sb.append("<FORM ACTION='" + jspPage + "' NAME='caldate'><tr><th align=center colspan=7>");
		sb.append("<SELECT onChange='document.caldate.submit()' NAME='date'>");
		for(int x = 0; x < Mnth.length; x++){
			sb.append("<OPTION VALUE='" + (x + 1) + "/1/" + year + "' ");
			if(x == i)
				sb.append("SELECTED");
			sb.append(">" + Mnth[x] + "</OPTION>");
		}
		sb.append("</SELECT></FORM>" + NEWLINE);
		sb.append("<FORM ACTION='" + jspPage + "' NAME='caldate2'><SELECT onChange='document.caldate2.submit()' NAME='date'>");
		for(int x = year - 90; x < year + 90; x++){
			sb.append("<OPTION VALUE='" + month + "/1/" + x + "' ");
			if(x == year)
				sb.append("SELECTED");
			sb.append(">" + x + "</OPTION>");
		}
		sb.append("</SELECT></th></tr></FORM>" + NEWLINE);
		sb.append("<tr>" + NEWLINE);
        if(style == 2) {
            sb.append("<th align=right>" + formatObject(sFont, wkdays[0]) + "</th>" + NEWLINE);
            for(int j = 1; j < 7; j++) sb.append("<th align=right>" + formatObject(sFont, wkdays[j]) + "</th>" + NEWLINE);
        } else {
            sb.append("<th align=right>" + formatObject(sFont, wkdays[1]) + "</th>" + NEWLINE);
            for(int k = 2; k < 8; k++) sb.append("<th align=right>" + formatObject(sFont, wkdays[k % 7]) + "</th>" + NEWLINE);
        }
        sb.append("  </tr>" + NEWLINE);
        int l = 0;
        if(getDay(myCalendar) > 0) {
            sb.append("  <tr>");
            for(; l < getDay(myCalendar); l++) {
                sb.append("<td align=right>");
                if(sFont != null)
                    sb.append("</font>");
                sb.append("</td>" + NEWLINE);
            }
        }
        for(; myCalendar.get(Calendar.MONTH) == i; myCalendar.add(Calendar.DATE, 1)) {
            int myDate = myCalendar.get(Calendar.DATE);
            int myWeek = (l + myDate) % 7;
            if(myWeek == 1) sb.append("  <tr>" + NEWLINE);
            sb.append("<td align=right>");
            if(sFont != null) sb.append(sFont);
            sb.append("<a href='javascript:selectdate(\""+twoDigits(month)+"/"+twoDigits(myDate)+"/"+year+"\")'>"+String.valueOf(myDate)+"</a>");
            if(sFont != null) sb.append("</font>");
            sb.append("</td>" + NEWLINE);
            if(myWeek == 0) sb.append("  </tr>" + NEWLINE);
        }

		l = (myCalendar.get(Calendar.DATE) - 1) + l;
        if(l % 7 != 0) {
            for(; l % 7 != 0; l++) {
                sb.append("<td align=right>");
                if(sFont != null) sb.append("</font>");
                sb.append("</td>" + NEWLINE);
            }
            sb.append("  </tr>" + NEWLINE);
        }
        sb.append("</table>" + NEWLINE);
        return sb.toString();
    }
}
