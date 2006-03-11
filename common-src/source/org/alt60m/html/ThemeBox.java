package org.alt60m.html;

public class ThemeBox implements java.io.Serializable {

	String width = "100%";
	String title = "";
	String titleAlign = "CENTER";
	String superPad = "1";
	String superSpace = "0";
	String subPad = "5";
	String subSpace = "0";
	String outClass = "boxHeader";  //options are: rounded, box, gradient...
	String inClass = "box";  //options are: rounded, box, gradient...
	String align = "";

	boolean tableInside = false;

    public ThemeBox() {}
    public ThemeBox(String _title) {
		title = _title;
	}

	public void setWidth(String aValue) { width = aValue; }
	public void setTitle(String aValue) { title = aValue; }
	public void setOutClass(String aValue) { outClass = aValue; }
	public void setInClass(String aValue) { inClass = aValue; }
	public void setTitleAlign(String aValue) { titleAlign = aValue; }
	public void setAlign(String aValue) { align = aValue; }
	public void setTableInside(boolean aValue) {tableInside = aValue; }

	public String printTop() {
		StringBuffer sb = new StringBuffer();
		sb.append("\n<!-- Begin generated table [ " + title + " ] -->\n");
		sb.append("<TABLE WIDTH='"+width+"' CELLSPACING='0'");
		if (!align.equals("")) { sb.append(" align=\""+align+"\""); align=""; /* re-set align for next table */ }
		sb.append(">");
		if(!title.equals("")){
			sb.append("<TR><TD ALIGN='"+titleAlign+"' NOWRAP CLASS='" +outClass + "'>" + title + "</TD></TR>\n");
		}
		sb.append("<TR><TD CLASS='" +outClass + "'>\n");
		sb.append("<TABLE WIDTH='100%' CELLSPACING='"+subSpace+"' CLASS='" +inClass + "'>");
		if(!tableInside){
			sb.append("<TR><TD CLASS='" +inClass + "'>\n");
		}
 		return sb.toString();
   }

	public String printBottom() {
		StringBuffer sb = new StringBuffer();
		if(!tableInside){
			sb.append("</TD></TR>\n");
		}
		sb.append("</TABLE></TD></TR></TABLE>\n");
		sb.append("<!-- End generated table [ " + title + " ] -->\n");
		return sb.toString();
    }
}