<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selRegion"
	class="org.alt60m.html.SelectRegion"
	scope="request" />
<jsp:useBean
	id="selState"
	class="org.alt60m.html.SelectState"
	scope="request" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	// Help Text
	String pageTitle = "Edit " + conference.getName() + " Details";
	String helpText_LF = "Click the pick link to pick a color. Click SAVE or NEXT to preview the results in the boxes on the right.";
	String helpText_leaveBlank = "Leave this blank if it is not required.";
	String helpText_Font = "Select which font you want from the menu to the left.";
	String helpText_CMS = "If you are using a CRS-generated Home Page, you can display your event’s logo, if one is available.  Upload the image in the Resource Center of Campus Crusade for Christ’s Staff Site under the ‘Conferences’ category and ‘Images’ subcategory.  The file will be assigned an ID number.  Enter the number and extension (gif/jpg) in this field.  Example:00000059082.gif";
	String helpText_Splash = "If your event has its own promotional website, use this URL to link students into the registration process. This will skip the CRS-generated Home Page.";

	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");

%>
<%@ include file="/crs/e_header.jspf"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action, buttonname){
		var form = document.theForm;
		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue. If you don't want to choose a color scheme click \"Default Colors\" and one will be provided for you.");
		} 
		/*else if(form.SplashPageURL.value!=""&&!validURLhttp(form.SplashPageURL.value))
		{
			alert("You must enter a valid URL (ex: http://www.uscm.org)");
			form.SplashPageURL.focus();
		}*/
		else if(!validHex(form.BackgroundColor.value)){
			alert("You must enter 6 characters for a color, 0-9 or a-f");
			form.BackgroundColor.focus();
		} else if(!validHex(form.BackgroundColor2.value)){
			alert("You must enter 6 characters for a color, 0-9 or a-f");
			form.BackgroundColor2.focus();
		} else if(!validHex(form.ForegroundColor.value)){
			alert("You must enter 6 characters for a color, 0-9 or a-f");
			form.ForegroundColor.focus();
		} else if(!validHex(form.BackgroundColor2.value)){
			alert("You must enter 6 characters for a color, 0-9 or a-f");
			form.HighlightColor.focus();
		} else if(!validHex(form.BackgroundColor2.value)){
			alert("You must enter 6 characters for a color, 0-9 or a-f");
			form.HighlightColor.focus();
		} else if(!validHex(form.HighlightColor2.value)){
			alert("You must enter 6 characters for a color, 0-9 or a-f");
			form.HighlightColor2.focus();
		} else if(!validHex(form.RequiredColor.value)){
			alert("You must enter 6 characters for a color, 0-9 or a-f");
			form.RequiredColor.focus();
		} else{
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.submit();
			}
		}
	}

	function displayPreview(){
		popupWindow('/crs/displayPreview.jsp?BackgroundColor=' + document.theForm.BackgroundColor.value+ '&BackgroundColor2=' + document.theForm.BackgroundColor2.value + '&BackgroundColor3=' + document.theForm.BackgroundColor3.value + '&ForegroundColor=' + document.theForm.ForegroundColor.value + '&HighlightColor=' + document.theForm.HighlightColor.value + '&HighlightColor2=' + document.theForm.HighlightColor2.value + '&RequiredColor=' + document.theForm.RequiredColor.value + '&FontFace=' + document.theForm.FontFace.value, 'DisplayPreview', 'height=300,width=780,dependent=yes,scrollbars=no,resizable');
	}

	function showDefaultColors(){
		document.theForm.BackgroundColor.value = "FFFFFF";
		document.theForm.BackgroundColor2.value = "EEEEEE";
		document.theForm.BackgroundColor3.value = "E5E5CC";
		document.theForm.ForegroundColor.value = "000000";
		document.theForm.HighlightColor.value = "336699";
		document.theForm.HighlightColor2.value = "D0DDEA";
		document.theForm.RequiredColor.value = "FFFF99";
		document.theForm.FontFace.value = "Arial, sans-serif";
		UnHighlightAll();
	}
//-->
</SCRIPT>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(0)%>
		<P><%=newEvent ? creationMenu.display(4) : conferenceMenu.display(9)%>
		</TD>
		<TD VALIGN="TOP">
		<FORM
			NAME='theForm'
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action"> <INPUT
			TYPE=hidden
			NAME="ConferenceID"
			VALUE="<%=conference.getConferenceID()%>">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="4">Display Options</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Background Color <B>(A)</B></TD>
				<TD
					CLASS="cell"
					COLSPAN="3"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="BackgroundColor"
					size=6
					maxlength=6
					value="<%=conference.getBackgroundColor()%>"> <a
					href='javascript:pickColor(document.theForm.BackgroundColor)'
					CLASS="button">Choose Color</a></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Background Color 2 <B>(B)</B></TD>
				<TD
					CLASS="cell"
					COLSPAN="3"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="BackgroundColor3"
					size=6
					maxlength=6
					value="<%=conference.getBackgroundColor3()%>"> <a
					href='javascript:pickColor(document.theForm.BackgroundColor3)'
					CLASS="button">Choose Color</a></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Background Color 3 <B>(C)</B></TD>
				<TD
					CLASS="cell"
					COLSPAN="3"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="BackgroundColor2"
					size=6
					maxlength=6
					value="<%=conference.getBackgroundColor2()%>"> <a
					href='javascript:pickColor(document.theForm.BackgroundColor2)'
					CLASS="button">Choose Color</a></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Text Color</TD>
				<TD
					CLASS="cell"
					COLSPAN="3"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="ForegroundColor"
					size=6
					maxlength=6
					value="<%=conference.getForegroundColor()%>"> <a
					href='javascript:pickColor(document.theForm.ForegroundColor)'
					CLASS="button">Choose Color</a></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Title Box <B>(D)</B></TD>
				<TD
					CLASS="cell"
					COLSPAN="3"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="HighlightColor"
					size=6
					maxlength=6
					value="<%=conference.getHighlightColor()%>"> <a
					href='javascript:pickColor(document.theForm.HighlightColor)'
					CLASS="button">Choose Color</a></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Title Box Text <B>(D)</B></TD>
				<TD
					CLASS="cell"
					COLSPAN="3"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="HighlightColor2"
					size=6
					maxlength=6
					value="<%=conference.getHighlightColor2()%>"> <a
					href='javascript:pickColor(document.theForm.HighlightColor2)'
					CLASS="button">Choose Color</a></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Required Color <B>(E)</B></TD>
				<TD
					CLASS="cell"
					COLSPAN="3"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="RequiredColor"
					size=6
					maxlength=6
					value="<%=conference.getRequiredColor()%>"> <a
					href='javascript:pickColor(document.theForm.RequiredColor)'
					CLASS="button">Choose Color</a></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Font</TD>
				<TD
					CLASS="cell"
					COLSPAN="3">
				<div align="left"><select name="FontFace">
					<option value="<%=conference.getFontFace()%>"><%=conference.getFontFace()%></option>
					<option value="Algerian, serif">Algerian</option>
					<option value="Arial, sans-serif">Arial</option>
					<option value="Arial Black, sans-serif">Arial Black</option>
					<option value="Book Antiqua, serif">Book Antiqua</option>
					<option value="Bradley Hand ITC, cursive">Bradley Hand ITC</option>
					<option value="Broadway, sans-serif">Broadway</option>
					<option value="Caecilia Light, serif">Caecilia Light</option>
					<option value="Century Gothic, sans-serif">Century Gothic</option>
					<option value="Chiller, cursive">Chiller</option>
					<option value="Comic Sans MS, sans-serif">Comic Sans MS</option>
					<option value="Footlight MT Light, serif">Footlight MT Light</option>
					<option value="Geneva, sans-serif">Geneva</option>
					<option value="Georgia, serif">Georgia</option>
					<option value="Harrington, serif">Harrington</option>
					<option value="High Tower Text, serif">High Tower Text</option>
					<option value="Kristen ITC, cursive">Kristen ITC</option>
					<option value="Monotype Corsiva, cursive">Monotype Corsiva</option>
					<option value="Old English Text MT, cursive">Old English Text MT</option>
					<option value="Palatino Linotype, serif">Palatino Linotype</option>
					<option value="Papyrus, serif">Papyrus</option>
					<option value="Rage Italic, cursive">Rage Italic</option>
					<option value="Ravie, serif">Ravie</option>
					<option value="Showcard Gothic, sans-serif">Showcard Gothic</option>
					<option value="Tahoma, sans-serif">Tahoma</option>
					<option value="Tempus Sans ITC, serif">Tempus Sans ITC</option>
					<option value="Times New Roman, serif">Times New Roman</option>
					<option value="Trebuchet MS, sans-serif">Trebuchet MS</option>
					<option value="Verdana, sans-serif">Verdana</option>
					<option value="Viner Hand ITC, cursive">Viner Hand ITC</option>
				</select> <!--
				<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="FontFace"size=35 maxlength=64 value="<%=conference.getFontFace()%>">
				--> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_Font%>');"
					onMouseOut="return nd();"></div>
				</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Home Page Address</TD>
				<TD
					CLASS="cell"
					COLSPAN="3"><INPUT
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="SplashPageURL"
					size=35
					maxlength=127
					value="<%=conference.getSplashPageURL()%>"> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_Splash%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Event Logo</TD>
				<TD
					CLASS="cell"
					COLSPAN="3"><INPUT
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="ConfImageID"
					size=35
					maxlength=60
					value="<%=conference.getConfImageID()%>"> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_CMS%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<% 
		if(newEvent){
%>
			<TR>
				<TD
					WIDTH="25%"
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=listRegistrationTypes"
					CLASS="button">&lt;&lt; Back</A></TD>
				<TD
					WIDTH="25%"
					CLASS="button"
					ALIGN="CENTER"><a
					href="JavaScript: displayPreview()"
					CLASS="button">Preview</a></TD>
				<TD
					WIDTH="25%"
					CLASS="button"
					ALIGN="CENTER"><a
					href="JavaScript: showDefaultColors()"
					CLASS="button">Default Colors</a></TD>
				<TD
					WIDTH="25%"
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: goNext('saveDisplayOptions', 'save')"
					NAME="save"
					CLASS="button">Finish</A></TD>
			</TR>
			<% 
		} else{
%>
			<TR>
				<TD
					WIDTH="25%"
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=showConference"
					CLASS="button">Cancel</A></TD>
				<TD
					WIDTH="25%"
					CLASS="button"
					ALIGN="CENTER"><a
					href="JavaScript: displayPreview()"
					CLASS="button">Preview</a></TD>
				<TD
					WIDTH="25%"
					CLASS="button"
					ALIGN="CENTER"><a
					href="JavaScript: showDefaultColors()"
					CLASS="button">Default Colors</a></TD>
				<TD
					WIDTH="25%"
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: goNext('saveDisplayOptions', 'save')"
					NAME="save"
					CLASS="button">Save Changes</A></TD>
			</TR>
			<%
		}
%>
		</TABLE>
		</FORM>
		<P>
		<TABLE
			BORDER="0"
			CELLPADDING="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader">Display Key</TD>
			</TR>
			<TR>
				<TD><IMG
					SRC="/crs/images/CRS-preview.gif"
					onMouseOver="return overlib('This is a preview picture.  To see your selected colors, click the above Preview button.');"
					onMouseOut="return nd();"></TD>
			</TR>
		</TABLE>
		<P>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader"><IMG SRC="/crs/images/info.gif"> Instructions</TD>
			</TR>
			<TR>
				<TD CLASS="cell"><% 
			if (newEvent){
%> This wizard will step you through the process of setting up
				conference registration.
				<P><%
			}
%> This page allows you to select colors, fonts, and graphics for your
				CRS-generated Home Page. You may preview your selections by clicking
				the "preview" button. Clicking the "default colors" button will make
				your page white, blue and sawgrass like this page. <a
					href="JavaScript: popupWindow('/crs/images/pic.jsp?pic=sampleUserView.gif', 'UserManual', 'height=777,width=777,dependent=yes,scrollbars=no,resizable')"
					CLASS="button">View a Sample Home Page</a>
				<P>Hover over the blue question marks <img
					src='/crs/images/info.gif'
					height=15
					width=15
					onmouseover="return overlib('Hi!');"
					onmouseout="return nd();"> for additional information
				</TD>
			</TR>
		</TABLE>
		<%@ include file="/crs/e_footer_help.jspf"%>
		</TD>
	</TR>
</TABLE>
<%@ include file="/crs/e_footer.jspf"%>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
