<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}

	Merchandise m = (Merchandise)ar.getObject("merchandise");
	
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	boolean onlyOneRegType = (session.getValue("onlyOneRegType") != null && ((String)session.getValue("onlyOneRegType")).equals("true"))||(ar.getValue("onlyOneRegType") != null && ((String)ar.getValue("onlyOneRegType")).equals("true"));
	RegistrationType rt = (RegistrationType)ar.getObject("RegistrationType");

	String pageTitle = "Edit Additional Expenses";
	Conference conference = (Conference)ar.getObject("conference");
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action, buttonname){
		var form = document.theForm;
		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		} else if(!validMoney(form.Amount.value)){
			alert("You can enter only a number is this field");
			form.Amount.focus();
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
<%
if(newEvent){
	creationMenu.setActives(new boolean[]{
		true,
		true, 
		true, 
		false
	});
}
%>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(0)%><P>
			<%=newEvent ? creationMenu.display(3) : conferenceMenu.display(8)%>
		</TD>
		<TD VALIGN="TOP">
		<FORM
			NAME='theForm'
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action"
			VALUE="saveMerchandiseDetails"><INPUT
			TYPE=hidden
			NAME="MerchandiseID"
			VALUE="<%=m.getMerchandiseID()%>"> <INPUT
			TYPE=hidden
			NAME="view"
			VALUE="<%=rt.getRegistrationTypeID()%>">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Additional Expense Details<%=newEvent&&onlyOneRegType?"":" for "+rt.getLabel()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Name</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="Name"
					size=30
					maxlength=50
					value="<%=m.getName()%>"> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('Name of item.  Example: Conference T-shirt');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Item Price</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="Amount"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(m.getAmount())%>"> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('Item Price');"
					onMouseOut="return nd();"></TD>
			</TR>
			<%if(!onlyOneRegType){%>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Registration Type</TD>
				<TD CLASS="cell"><%=rt.getLabel()%></TD>
			</TR>
			<% 
		selBool.setLabels("Yes","No");
%>
			<%}%>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Note</TD>
				<TD CLASS="cell"><TEXTAREA
					COLS="60"
					ROWS="4"
					NAME="Note"
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					onKeyDown="textCounter(this.form.Note,this.form.remLen,200);"
					onKeyUp="textCounter(this.form.Note,this.form.remLen,200);"><%=m.getNote()%></TEXTAREA>
				<BR>
				<input
					readonly
					ALIGN="RIGHT"
					type=text
					name=remLen
					size=3
					maxlength=3
					value="200">/200 characters left</TD>
			</TR>
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=listRegTypeMerchandise"
					CLASS="button">Cancel</A></TD>
				<TD
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: goNext('saveMerchandiseDetails', 'save')"
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
				<TD CLASS="cell">In the Name box, type how you would like the
				additional expense to be labeled. Enter the price of the item in the
				Item Price box. <%if(!onlyOneRegType){%>The "Registration Type" pull down menu allows you to
				indicate the group to which this item is being offered. <%}%>Include any
				additional information in the box marked Note. This will appear
				beneath the item's name on the registration form. <%if(!onlyOneRegType){%><B>Note:</B> Once
				you set the Registration Type you cannot change it. This will hopefully
				be corrected in the future.<%}%>
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
