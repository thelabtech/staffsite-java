package org.alt60m.html;

public class Box implements java.io.Serializable {

	String width = "100%";
  String title = "";
	String content = "";
	String titleColor = "#336699";
	String titleAlign = "CENTER";
	String titleFontSize = "2";
	String bodyFontSize = "1";
	String titleFont = "<FONT FACE=\"Arial\" COLOR=\"#FFFFFF\">";
	String bodyFont = "<FONT FACE=\"Arial\" COLOR=\"#336699\">";
	String borderColor = "#336699";
	String bodyColor = "#cccc99";
	String color = "#ffffff";
	String superPad = "1";
	String superSpace = "0";
	String subPad = "5";
	String subSpace = "0";
	String screenAlign = "left";	//for gradient boxes gradient1L/gradient1R...
	String style = "rounded";  //options are: rounded, box, gradient...
	String intHeight = "";
	boolean tableInside = false;

    public Box() {}
    public Box(String _title) {
		title = _title;
	}
	public void setTitleAlign(String aValue) { titleAlign = aValue; }
	public void setTitle(String aValue) { title = aValue; }
	public void setTitleColor(String aValue) { titleColor = aValue; }
	public void setTitleFont(String aValue) { titleFont = aValue; }
	public void setTitleFontSize(String aValue) { titleFontSize = aValue; }
	public void setBodyFont(String aValue) { bodyFont = aValue; }
	public void setBodyFontSize(String aValue) { bodyFontSize = aValue; }
	public void setWidth(String aValue) { width = aValue; }
	public void setBorderColor(String aValue) { borderColor = aValue; }
	public void setColor(String aValue) { color = aValue; }
	public void setBodyColor(String aValue) { bodyColor = aValue; }
	public void setContent(String aValue) { content=aValue; }
	public void setSubPad(String aValue) { subPad=aValue; }
	public void setSuperPad(String aValue) { superPad=aValue; }
	public void setSubSpace(String aValue) { subSpace=aValue; }
	public void setSuperSpace(String aValue) { superSpace=aValue; }
	public void setTableInside(boolean aValue) { tableInside=aValue; }
	public void setStyle(String aValue) { style = aValue; }
	public void setScreenAlign(String aValue) { screenAlign = aValue; }
	public void setIntHeight(String aValue) { intHeight = aValue; }

	public String printTop() {
		if(style==null)
			style="rounded";
		StringBuffer sb = new StringBuffer();
		if (style.equalsIgnoreCase("rounded")){
			sb.append("<TABLE WIDTH='"+width+"' BORDER='0' BGCOLOR='"+borderColor+"' CELLSPACING='"+superSpace+"' CELLPADDING='0'>");
			sb.append("<TR><td align=left valign=top><img src='/images/box_tl.gif'></td><TD ALIGN='"+titleAlign+"' HEIGHT=7 NOWRAP>\n");
			if(!title.equals("")){
				sb.append(titleFont+"<font size='"+ titleFontSize +"'><b>"+title+"</b></font></font>");
				sb.append("</TD>");
			}
			sb.append("<td align=right valign=top><img src='/images/box_tr.gif'></td></TR>\n");
			sb.append("<tr><TD BGCOLOR='"+color+"' colspan=3>");
			sb.append("<TABLE WIDTH='100%' CELLSPACING='"+subSpace+"' CELLPADDING='"+subPad+"' BORDER='0'>");
			if(!tableInside){
				sb.append("<TR>");
				sb.append("<TD>");
			}
			sb.append("" + bodyFont +"<font size='"+ bodyFontSize +"'>");
		}
		else if (style.equalsIgnoreCase("flashline")){
			sb.append("<TABLE WIDTH='160' BORDER='0' CELLSPACING='0' CELLPADDING='0'>");
			sb.append("<TR><TD ALIGN='CENTER' HEIGHT=7 NOWRAP colspan=3>\n");
			sb.append("<OBJECT classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0\" ID=box1 WIDTH=160 HEIGHT=18>");
			sb.append("<PARAM NAME=movie VALUE=\"/images/flashline.swf?text=" + title + "\">");
			sb.append("<PARAM NAME=quality VALUE=high>");
			sb.append("<PARAM NAME=scale VALUE=exactfit>");
			sb.append("<PARAM NAME=wmode VALUE=transparent> ");
			sb.append("<EMBED src=\"/images/flashline.swf\" quality=high scale=exactfit WIDTH=160 HEIGHT=18 TYPE=\"application/x-shockwave-flash\" PLUGINSPAGE=\"http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash\" wmode=transparent></EMBED>");
			sb.append("</OBJECT>");
			sb.append("</TD>");
			sb.append("</TR>\n");
			sb.append("<tr><TD BGCOLOR='"+color+"' colspan=3>");
			sb.append("<TABLE WIDTH='100%' CELLSPACING='"+subSpace+"' CELLPADDING='"+subPad+"' BORDER='0'>");
			if(!tableInside){
				sb.append("<TR>");
				sb.append("<TD>");
			}
			sb.append("" + bodyFont +"<font size='"+ bodyFontSize +"'>");
		}
		else if (style.equalsIgnoreCase("simple")){
			sb.append("<TABLE WIDTH='"+width+"' BORDER='1' bordercolorlight='"+bodyColor+"' CELLSPACING='2' CELLPADDING='2'>\n");
			sb.append("<TR><TD HEIGHT=7 NOWRAP align='"+titleAlign+"'>\n");
			if(!title.equals("")){
				sb.append(titleFont+"<font size='"+ titleFontSize +"' color='"+ titleColor+"'><b>"+title+"</b></font></font><hr color=\"#cccc99\" noshade size=1>\n");
			}
			sb.append("" + bodyFont +"<font size='"+ bodyFontSize +"'>");
		}
		else if (style.equalsIgnoreCase("gradient1")){
			if (screenAlign.equalsIgnoreCase("left")){	//gradient from blue/beige to white 
				sb.append("<TABLE WIDTH='"+width+"' BORDER='0' CELLPADDING=0 CELLSPACING=0>\n");
				if(!title.equals("")){
					sb.append("<TR><TD COLSPAN=2 NOWRAP BGCOLOR=#FFFFFF ALIGN='LEFT'  style=\"background-image:url('/images/box_grad_left_h.gif');background-repeat:repeat-y\">\n");
					sb.append(titleFont+"<font size='"+ titleFontSize +"' color='#FFFFFF'><b>"+title+"</b></font></font>\n</TD></TR>");
				}
				else{
					sb.append("<TR><TD COLSPAN=2 NOWRAP ALIGN='left'><IMG SRC=\"/images/box_grad_left_h.gif\" HEIGHT=1></TD></TR>\n");
				}
				sb.append("<TR>\n <TD WIDTH=1 BGCOLOR='#CCCC99' VALIGN=TOP><IMG SRC=\"/images/box_grad_vt.gif\" WIDTH=1 HEIGHT=20 BORDER=0></TD>");
				sb.append("<TD ROWSPAN=3 style=\"background-image:url('/images/box_grad_left_body.gif');background-repeat:repeat-y\">");
				sb.append("" + bodyFont +"<font size='"+ bodyFontSize +"'>");
			}
			else {	//gradient from white to blue/beige
				sb.append("<TABLE WIDTH='"+width+"' BORDER='0' CELLPADDING=0 CELLSPACING=0>\n");
				if(!title.equals("")){
					sb.append("<TR><TD COLSPAN=2 NOWRAP BGCOLOR=#FFFFFF ALIGN='RIGHT' style=\"background-image:url('/images/box_grad_right_h.gif');background-repeat:repeat-y;\">\n");
					sb.append(titleFont+"<font size='"+ titleFontSize +"' color='#FFFFFF'><b>"+title+"</b></font></font>\n</TD></TR>");
				}
				else{
					sb.append("<TR><TD COLSPAN=2 NOWRAP ALIGN='left'><IMG SRC=\"/images/box_grad_right_h.gif\" HEIGHT=1></TD></TR>\n");
				}
				sb.append("<TR>\n");
				sb.append("<TD ROWSPAN=3 BGCOLOR=#CCCC99 style=\"background-image:url('/images/box_grad_right_body.gif');background-repeat:repeat-y;\">");
				sb.append("" + bodyFont +"<font size='"+ bodyFontSize +"'>");
			}
			// end gradient 1
		}
		else{
			sb.append("<TABLE WIDTH='"+width+"' BORDER='0' BGCOLOR='"+borderColor+"' CELLSPACING='"+superSpace+"' CELLPADDING='"+superPad+"'>");
			if(!title.equals("")){
				sb.append("<TR>");
				sb.append("<TD ALIGN='"+titleAlign+"' HEIGHT=7 NOWRAP BGCOLOR='"+titleColor+"'>");
				sb.append(titleFont+"<font size='"+ titleFontSize +"'><b>"+title+"</b></font></font>");
				sb.append("</TD>");
				sb.append("</TR>");
			}
			sb.append("<TR>");
			sb.append("<TD BGCOLOR='"+borderColor+"'>");
			sb.append("<TABLE WIDTH='100%' CELLSPACING='"+subSpace+"' CELLPADDING='"+subPad+"' BORDER='0'>");
			if(!tableInside){
				sb.append("<TR>");
				sb.append("<TD HEIGHT='" + intHeight + "' BGCOLOR='"+color+"'>");
			}
			sb.append("" + bodyFont +"<font size='"+ bodyFontSize +"'>");
		}
		return sb.toString();

    }

	public String printBottom() {
		StringBuffer sb = new StringBuffer();
		sb.append("</font>");
		if (style.equalsIgnoreCase("rounded")){
			if(!tableInside){
				sb.append("</td></tr>");
			}
			sb.append("</table></td></tr>");
			sb.append("<tr bgcolor='" + bodyColor + "'><td align=left valign=bottom><img src='/images/box_bl.gif'></td><TD height=5>\n");
			sb.append("<font size=1> &nbsp; </TD><td align=right valign=bottom><img src='/images/box_br.gif'></td></TR>\n</table>");
			sb.append("");
		}
		else if (style.equalsIgnoreCase("flashline")){
			if(!tableInside){
				sb.append("</td></tr>");
			}
			sb.append("</table></td></tr>");
			sb.append("<tr bgcolor='" + bodyColor + "'><td align=left valign=bottom><img src='/images/box_bl.gif'></td><TD height=5>\n");
			sb.append("<font size=1> &nbsp; </TD><td align=right valign=bottom><img src='/images/box_br.gif'></td></TR>\n</table>");
			sb.append("");
		}
		else if (style.equalsIgnoreCase("simple")){
			if(!tableInside){
				sb.append("</td></tr>");
			}
			sb.append("</td></TR>\n</table>\n");
			sb.append("");
			return sb.toString();
		}
		else if (style.equalsIgnoreCase("gradient1")){
			if (screenAlign.equalsIgnoreCase("left")){
				sb.append("</font></font></TD></TR>\n<TR><TD WIDTH=1 BGCOLOR='#CCCC99'><IMG SRC=\"/images/blank.gif\" WIDTH=1 HEIGHT=1 BORDER=0></TD></TR>");
				sb.append("<TR><TD WIDTH=1 BGCOLOR='#CCCC99' VALIGN=BOTTOM><IMG SRC=\"/images/box_grad_vb.gif\" WIDTH=1 HEIGHT=20 BORDER=0></TD></TR>");
				sb.append("<TR><TD BGCOLOR='#FFFFFF' VALIGN=BOTTOM COLSPAN=2><IMG SRC=\"/images/box_grad_left_h.gif\" WIDTH=160 HEIGHT=1 BORDER=0></TD></TR>");
				sb.append("</TABLE>");
			}
			else{
				sb.append("</font></font></TD>\n");
				sb.append("<TD WIDTH=1 BGCOLOR='#CCCC99' ALLIGN=RIGHT VALIGN=TOP><IMG SRC=\"/images/box_grad_vt.gif\" WIDTH=1 HEIGHT=20 BORDER=0></TD></TR>");
				sb.append("<TR><TD WIDTH=1 BGCOLOR='#CCCC99'><IMG SRC=\"/images/blank.gif\" WIDTH=1 HEIGHT=1 BORDER=0></TD></TR>");
				sb.append("<TR><TD WIDTH=1 BGCOLOR='#CCCC99' ALIGN=RIGHT VALIGN=BOTTOM><IMG SRC=\"/images/box_grad_vb.gif\" WIDTH=1 HEIGHT=20 BORDER=0></TD></TR>");
				sb.append("<TR><TD BGCOLOR='#FFFFFF' ALIGN=RIGHT VALIGN=BOTTOM COLSPAN=2><IMG SRC=\"/images/box_grad_right_h.gif\" WIDTH=160 HEIGHT=1 BORDER=0></TD></TR>");
				sb.append("</TABLE>");
			}
		}
		else{
			if(!tableInside){
				sb.append("</td></tr>");
			}
			sb.append("</table></td></tr></table>");
			sb.append("");
		}
		return sb.toString();
    }


	public void reset() {
		width = "100%";
		title = "";
		content = "";
		titleColor = "#336699";
		titleAlign = "CENTER";
		titleFontSize = "2";
		bodyFontSize = "1";
		titleFont = "<FONT FACE=\"Arial\" COLOR=\"#FFFFFF\">";
		bodyFont = "<FONT FACE=\"Arial\" COLOR=\"#336699\">";
		borderColor = "#336699";
		bodyColor = "#cccc99";
		color = "#ffffff";
		superPad = "1";
		superSpace = "0";
		subPad = "5";
		subSpace = "0";
		style = "rounded";  //options are: rounded, box, ...
		intHeight = "";
	}

	public String print() {
		return print(content);
	}

	public String print(String myContent) {
		return printTop()+myContent+printBottom();
	}

}