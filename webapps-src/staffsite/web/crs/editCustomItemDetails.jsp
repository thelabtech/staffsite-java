<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	CustomItem ci = (CustomItem)ar.getObject("item");
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}

	String pageTitle = "Edit Additional Information Details";
	Conference conference = new Conference();
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action, buttonname){
		var form = document.theForm;
		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		} else {
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.submit();
			}
		}
	}

//-->
</SCRIPT>
<%@ include file="/crs/e_header.jspf"%>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(0)%></TD>
		<TD VALIGN="TOP">
		<FORM
			NAME='theForm'
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action"
			VALUE="saveCustomItem"> <INPUT
			TYPE=hidden
			NAME="CustomItemID"
			VALUE="<%=ci.getCustomItemID()%>"> <INPUT
			TYPE=hidden
			NAME="ConferenceID"
			VALUE="<%=session.getValue("eventLoggedIn")%>">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Additional Conference Information Details</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Title</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="Title"
					size=30
					maxlength=50
					value="<%=ci.getTitle()%>"> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('Heading for Additional Information.  Example: Items to Pack');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Text</TD>
				<TD CLASS="cell"><TEXTAREA
					COLS="60"
					ROWS="4"
					NAME="Text"
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					onKeyDown="textCounter(this.form.Text,this.form.remLenText,1000);"
					onKeyUp="textCounter(this.form.Text,this.form.remLenText,1000);"
					><%=ci.getText()%></TEXTAREA>
					<% int tmpLength = 1000 - ci.getText().length(); %>
					<div class="small" align="right">Characters remaining: <input type="text" name="remLenText" size="4" disabled="disabled" maxlength="4" value="<%=tmpLength%>"></div></TD>
					</TD>
			</TR>
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=listCustomItems"
					CLASS="button">Cancel</A></TD>
				<TD
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: goNext('saveCustomItem', 'save')"
					NAME="save"
					CLASS="button">Save</A></TD>
			</TR>
		</TABLE>
		</FORM>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader"><IMG SRC="/crs/images/info.gif"> Instructions</TD>
			</TR>
			<TR>
				<TD CLASS="cell">In the title field type a word or phrase to sum up
				the content you want to add. For example, if your guest speaker is
				John Piper, you could add "Guest Speaker" as the title, and "John
				Piper" as the text. If your text has multiple paragraphs (for
				example, if you were going to include John Piper's biography), you
				should separate paragraphs with a &lt;P&gt; tag.
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
