<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<%
	int conferenceID = (request.getParameter("conferenceID") == null || request.getParameter("conferenceID").equals("")) ? 0 : Integer.parseInt(request.getParameter("conferenceID"));
	Conference c = new Conference();
	c.setConferenceID(conferenceID);
	c.select();
	c.setForegroundColor(c.getForegroundColor().equals("") ? "#000000" : "#" + c.getForegroundColor());
	c.setBackgroundColor(c.getBackgroundColor().equals("") ? "#FFFFFF" : "#" + c.getBackgroundColor());
	c.setBackgroundColor2(c.getBackgroundColor2().equals("") ? "#EEEEEE" : "#" + c.getBackgroundColor2());
	c.setBackgroundColor3(c.getBackgroundColor3().equals("") ? "#E5E5CC" : "#" + c.getBackgroundColor3());
	c.setHighlightColor(c.getHighlightColor().equals("") ? "#336699" : "#" + c.getHighlightColor());
	c.setHighlightColor2(c.getHighlightColor2().equals("") ? "#D0DDEA" : "#" + c.getHighlightColor2());
	c.setRequiredColor(c.getRequiredColor().equals("") ? "#FFFF99" : "#" + c.getRequiredColor());
	c.setFontFace(c.getFontFace().equals("") ? "Arial, sans-serif" : c.getFontFace());
%>
BODY { margin: 10px; padding: 0px; color:
<%=c.getForegroundColor()%>
; background:
<%=c.getBackgroundColor()%>
; scrollbar-3dlight-color:
<%=c.getBackgroundColor3()%>
; scrollbar-highlight-color:
<%=c.getHighlightColor()%>
; scrollbar-shadow-color:
<%=c.getHighlightColor()%>
; scrollbar-darkshadow-color:
<%=c.getBackgroundColor3()%>
; scrollbar-face-color:
<%=c.getHighlightColor2()%>
; scrollbar-arrow-color:
<%=c.getHighlightColor()%>
; scrollbar-track-color:
<%=c.getBackgroundColor3()%>
; } .main{ color:
<%=c.getForegroundColor()%>
; background:
<%=c.getBackgroundColor3()%>
; border: 1px solid
<%=c.getHighlightColor()%>
; } A:active, A:visited, A:link { color:
<%=c.getHighlightColor()%>
; text-decoration: none; } A:hover { color:
<%=c.getHighlightColor()%>
; background:
<%=c.getRequiredColor()%>
; text-decoration: none; cursor: hand; } TD { font-family:
<%=c.getFontFace()%>
; font-size: 12px; } HR { color:
<%=c.getHighlightColor()%>
; height: 1; } UL { margin: 0px 20px; } INPUT, TEXTAREA, SELECT{
font-family:
<%=c.getFontFace()%>
; font-size: 11px; background:
<%=c.getBackgroundColor2()%>
; color:
<%=c.getHighlightColor()%>
; border: solid 1px
<%=c.getHighlightColor()%>
; } .header{ color:
<%=c.getHighlightColor2().equals(c.getBackgroundColor()) ? c.getHighlightColor2() : c.getHighlightColor()%>
; background:
<%=c.getHighlightColor2().equals(c.getBackgroundColor()) ? c.getHighlightColor() : c.getHighlightColor2()%>
; border-bottom: 2px dashed
<%=c.getHighlightColor()%>
; font-family:
<%=c.getFontFace()%>
; font-size: 18px; padding: 5px 10px; font-weight: bold; } .box{ color:
<%=c.getForegroundColor()%>
; background:
<%=c.getBackgroundColor()%>
; border-width: 1px 2px 2px 1px; border-style: solid; border-color:
<%=c.getHighlightColor()%>
; } .migrate{ padding: 10px; margin: 10px; color:
<%=c.getForegroundColor()%>
; background:
<%=c.getBackgroundColor()%>
; border-width: 1px 2px 2px 1px; border-style: solid; border-color:
<%=c.getHighlightColor()%>
; } .boxheader{ color:
<%=c.getHighlightColor2().equals(c.getBackgroundColor()) ? c.getHighlightColor2() : c.getHighlightColor()%>
; background:
<%=c.getHighlightColor2().equals(c.getBackgroundColor()) ? c.getHighlightColor() : c.getHighlightColor2()%>
; border-bottom: 2px dashed
<%=c.getHighlightColor()%>
; font-family:
<%=c.getFontFace()%>
; font-size: 14px; padding: 5px 3px; font-weight: bold; } .subboxheader{
color:
<%=c.getHighlightColor2().equals(c.getBackgroundColor()) ? c.getHighlightColor2() : c.getHighlightColor()%>
; background:
<%=c.getHighlightColor2().equals(c.getBackgroundColor()) ? c.getHighlightColor() : c.getHighlightColor2()%>
; border-bottom: 1px dashed
<%=c.getHighlightColor()%>
; font-family:
<%=c.getFontFace()%>
; font-size: 11px; padding: 5px 3px; font-weight: bold; } .boxfooter{
color:
<%=c.getHighlightColor()%>
; border-top: 2px dashed
<%=c.getHighlightColor()%>
; background:
<%=c.getHighlightColor2()%>
; font-family:
<%=c.getFontFace()%>
; font-size: 12px; padding: 2px 0px; } TD.button{ color:
<%=c.getHighlightColor()%>
; background:
<%=c.getHighlightColor2()%>
; font-family:
<%=c.getFontFace()%>
; font-size: 11px; padding: 5px 3px; white-space: nowrap } .hl{
font-family:
<%=c.getFontFace()%>
; font-size: 11px; color:
<%=c.getForegroundColor()%>
; background:
<%=c.getHighlightColor2()%>
; border-bottom: 1px solid
<%=c.getBackgroundColor()%>
; padding: 3px; } .cell{ font-family:
<%=c.getFontFace()%>
; font-size: 12px; color:
<%=c.getForegroundColor()%>
; background:
<%=c.getBackgroundColor()%>
; padding: 3px; } .cell2{ font-family:
<%=c.getFontFace()%>
; font-size: 12px; color:
<%=c.getForegroundColor()%>
; background:
<%=c.getBackgroundColor2()%>
; padding: 3px; } .small{ font-size: 10px; } .error{ font-weight: bold;
color: #FF0000; background: #FFFFFF; padding: } TD.menuactive { padding:
0px; width: 150px; border-top: 1px solid
<%=c.getHighlightColor()%>
; border-bottom: 1px solid
<%=c.getHighlightColor()%>
; font-size: 11px; } TD.menuinactive { padding: 4px; width: 150px;
border-bottom: 1px solid
<%=c.getBackgroundColor2()%>
; font-size: 11px; background:
<%=c.getBackgroundColor()%>
; } TD.menu { padding: 0px; width: 150px; border-bottom: 1px solid
<%=c.getBackgroundColor2()%>
; font-size: 11px; } A.menu:link, A.menu:active, A.menu:visited {
padding: 4px; color:
<%=c.getHighlightColor()%>
; background:
<%=c.getBackgroundColor()%>
; text-decoration: none; width: 150px; display: block; }
A.menuactive:link, A.menuactive:active, A.menuactive:visited { padding:
4px; color:
<%=c.getHighlightColor()%>
; background:
<%=c.getBackgroundColor2()%>
; text-decoration: none; width: 150px; font-weight: bold; font-size:
11px; display: block; } A.menuactive:hover{ background:
<%=c.getRequiredColor()%>
; padding: 4px; color:
<%=c.getHighlightColor()%>
; text-decoration: none; cursor: hand; width: 150px; font-weight: bold;
font-size: 11px; display: block; } A.menu:hover{ background:
<%=c.getRequiredColor()%>
; padding: 3px 4px; color:
<%=c.getHighlightColor()%>
; text-decoration: none; cursor: hand; width: 150px; border-width: 1px
0px; border-style: solid; border-color:
<%=c.getHighlightColor()%>
; display: block; } TD.tabactive { padding: 0px; text-align: center;
background:
<%=c.getHighlightColor()%>
; font-size: 11px; border-width: 1px 1px 0px 1px; border-style: solid;
border-color:
<%=c.getHighlightColor()%>
; } TD.tab { padding: 0px; text-align: center; background:
<%=c.getBackgroundColor2()%>
; font-size: 11px; border-width: 1px 1px 0px 1px; border-style: solid;
border-color:
<%=c.getHighlightColor()%>
; } .pager { padding: 0px; text-align: center; background:
<%=c.getBackgroundColor2()%>
; font-size: 11px; border-bottom:
<%=c.getHighlightColor()%>
solid 1px; } .smallpager { padding: 0px; text-align: center; background:
<%=c.getBackgroundColor2()%>
; font-size: 11px; border-top:
<%=c.getHighlightColor()%>
solid 1px; } A.tab:link, A.tab:active, A.tab:visited { padding: 3px
10px; color:
<%=c.getHighlightColor()%>
; background:
<%=c.getBackgroundColor()%>
; text-decoration: none; width: 100%; display: block; }
A.tabactive:link, A.tabactive:active, A.tabactive:visited { padding: 3px
10px; color:
<%=c.getBackgroundColor()%>
; background:
<%=c.getHighlightColor()%>
; text-decoration: none; width: 100%; font-weight: bold; font-size:
11px; display: block; } A.tabactive:hover{ background: #85A35C; padding:
3px 10px; color:
<%=c.getBackgroundColor()%>
; text-decoration: none; cursor: hand; width: 100%; font-weight: bold;
font-size: 11px; display: block; } A.tab:hover{ background:
<%=c.getRequiredColor()%>
; padding: 3px, 10px; color:
<%=c.getHighlightColor()%>
; text-decoration: none; cursor: hand; width: 100%; display: block; }
TD.sortactive { padding: 0px; font-size: 11px; border-width: 0px 1px 1px
1px; border-style: solid; border-color:
<%=c.getHighlightColor()%>
; } TD.sort { padding: 0px; border-bottom: 1px solid
<%=c.getHighlightColor()%>
; font-size: 11px; } TD.nosort { padding: 2px 4px; border-bottom: 1px
solid
<%=c.getHighlightColor()%>
; font-size: 11px; } A.sort:link, A.sort:active, A.sort:visited {
padding: 2px 4px; color:
<%=c.getHighlightColor()%>
; background:
<%=c.getBackgroundColor()%>
; text-decoration: none; width: 100%; display: block; }
A.sortactive:link, A.sortactive:active, A.sortactive:visited { padding:
2px 4px; color:
<%=c.getHighlightColor()%>
; background:
<%=c.getBackgroundColor2()%>
; text-decoration: none; width: 100%; font-weight: bold; font-size:
11px; display: block; } A.sortactive:hover{ background:
<%=c.getRequiredColor()%>
; padding: 2px 4px; color:
<%=c.getHighlightColor()%>
; text-decoration: none; cursor: hand; width: 100%; font-weight: bold;
font-size: 11px; display: block; } A.sort:hover{ background:
<%=c.getRequiredColor()%>
; padding: 2px 4px; color:
<%=c.getHighlightColor()%>
; text-decoration: none; cursor: hand; width: 100%; display: block; }
TD.linkcell{ font-family:
<%=c.getFontFace()%>
; font-size: 12px; color:
<%=c.getForegroundColor()%>
; background:
<%=c.getBackgroundColor()%>
; padding: 0px; } TD.linkcell2{ font-family:
<%=c.getFontFace()%>
; font-size: 12px; color:
<%=c.getForegroundColor()%>
; background:
<%=c.getBackgroundColor2()%>
; padding: 0px; } A.linkcell2:link, A.linkcell2:active,
A.linkcell2:visited, A.linkcell:link, A.linkcell:active,
A.linkcell:visited { padding: 4px; width: 100%; color:
<%=c.getHighlightColor()%>
; text-decoration: none; display: block; } A.linkcell:hover { padding:
3px; width: 100%; color:
<%=c.getHighlightColor()%>
; background:
<%=c.getRequiredColor()%>
; text-decoration: none; border: 1px solid
<%=c.getHighlightColor()%>
; display: block; } A.linkcell2:hover { padding: 3px; width: 100%;
color:
<%=c.getHighlightColor()%>
; background:
<%=c.getRequiredColor()%>
; text-decoration: none; border: 1px solid
<%=c.getHighlightColor()%>
; display: block; } A.button:link, A.button:active, A.button:visited {
padding: 1px 5px; color:
<%=c.getHighlightColor()%>
; background:
<%=c.getBackgroundColor()%>
; text-decoration: none; border-width: 1px 2px 2px 1px; border-style:
solid; border-color:
<%=c.getHighlightColor()%>
; text-align: center; font-size: 11px; font-weight: bold; }
A.button:hover { padding: 1px 5px; color:
<%=c.getHighlightColor()%>
; background:
<%=c.getRequiredColor()%>
; text-decoration: none; cursor: hand; border-width: 2px 1px 1px 2px;
border-style: solid; border-color:
<%=c.getHighlightColor()%>
; text-align: center; font-size: 11px; font-weight: bold; } .required{
background:
<%=c.getRequiredColor()%>
; } .reqfilled, .empty{ background:
<%=c.getBackgroundColor2()%>
; } .reqactive, .active{ background:
<%=c.getHighlightColor2()%>
; } .question{ padding: 2px 7px; } .answer{ padding: 5px 15px;
border-bottom: dashed 1p
<%=c.getHighlightColor()%>
; } .indent { margin-left: 15px; }
