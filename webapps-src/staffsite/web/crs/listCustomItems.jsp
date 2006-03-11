<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	String pageTitle = "Additional Conference Information";
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action, buttonname){
		var form = document.customItem;
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
<%
	if(newEvent){
		creationMenu.setActives(new boolean[]{
			true,
			true, 
			false, 
			false
		});
	}
%><TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(0)%>
		<P><%=newEvent ? creationMenu.display(2) : conferenceMenu.display(7)%>
		</TD>
		<TD VALIGN="TOP">
		<FORM
			NAME='customItem'
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action"
			VALUE="updateCustomItemOrder"> <INPUT
			TYPE=hidden
			NAME="orderCol"
			VALUE="<%=ar.getValue("orderCol")%>"> <INPUT
			TYPE=hidden
			NAME="order"
			VALUE="<%=ar.getValue("order")%>">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="4">Edit Additional Conference Information</TD>
			</TR>
			<%
		if(ar.getCollection("Items").size() > 0){		
			Iterator items = ar.getCollection("Items").iterator();

			formatter.setHeaderNames(new String[] {"Order", "Title", "", ""});
			formatter.setHeaderSorts(new boolean[] {true, true,  false, false});
			formatter.setHeaderWidths(new String[] {"7%", "*", "7%", "7%"});
			formatter.setHeaderAligns(new String[] {"LEFT", "LEFT", "", ""});
%>
			<%=formatter.displayHeader( ar.getValue("orderCol"), ar.getValue("order"), "Items Table", "/servlet/CRSAdmin?action=listCustomItems")%>
			<INPUT
				TYPE="hidden"
				NAME="itemSize"
				Value="<%=ar.getCollection("Items").size()%>">
			<%
			for(int i = 0; items.hasNext(); i++){
				CustomItem item = (CustomItem)items.next();
%>
			<INPUT
				TYPE="hidden"
				NAME="<%=i%>CustomItemID"
				Value="<%=item.getCustomItemID()%>">
			<TR>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="<%=i%>DisplayOrder"
					size=2
					maxlength=3
					value="<%=item.getDisplayOrder()%>"></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"><B><%=item.getTitle()%></B></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><A
					CLASS="button"
					HREF="/servlet/CRSAdmin?action=editCustomItem&customItemID=<%=item.getCustomItemID()%>">Edit</A></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><A
					CLASS="button"
					HREF="/servlet/CRSAdmin?action=deleteCustomItem&customItemID=<%=item.getCustomItemID()%>"
					onMouseOver="return overlib('<B>WARNING!</B><BR>This is not undoable!');"
					onMouseOut="return nd();">Delete</A></TD>
			</TR>
			<TR>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="TOP">&nbsp;</TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					COLSPAN="3"><%=formatter.crToBR(item.getText())%></TD>
			</TR>
			<%
			}
		} else {
%>
			<TR>
				<TD
					CLASS="cell"
					ALIGN="CENTER"
					COLSPAN="4">There aren't any items to display</TD>
			</TR>
			<%
		}
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="4">
				<TABLE
					CELLSPACING="0"
					CELLPADDING="0"
					BORDER="0"
					WIDTH="100%">
					<%
		if(newEvent){
%>
					<TR>
						<TD
							CLASS="button"
							ALIGN="LEFT"><A
							HREF="/servlet/CRSAdmin?action=editConferenceDetails"
							CLASS="button">&lt;&lt; Back</A></TD>
						<%
				if(ar.getCollection("Items").size() > 1){
%>
						<TD
							CLASS="button"
							ALIGN="CENTER"><A
							HREF="javascript: document.customItem.submit()"
							NAME="rearrange"
							CLASS="button">Rearrange Items</A></TD>
						<%
				}
%>
						<TD
							CLASS="button"
							ALIGN="CENTER"><A
							HREF="/servlet/CRSAdmin?action=newCustomItem"
							CLASS="button">New Item</A></TD>
						<TD
							CLASS="button"
							ALIGN="RIGHT"
							COLSPAN="2"><A
							HREF="javascript: goNext('saveCustomItems', 'save')"
							NAME="save"
							CLASS="button">Next &gt;&gt;</A></TD>
					</TR>
					<% 
		} else{
%>
					<TR>
						<TD
							CLASS="button"
							ALIGN="LEFT"><A
							HREF="/servlet/CRSAdmin?action=showConference"
							CLASS="button">Cancel</A></TD>
						<%
				if(ar.getCollection("Items").size() > 1){
%>
						<TD
							CLASS="button"
							ALIGN="CENTER"><A
							HREF="javascript: document.customItem.submit()"
							NAME="rearrange"
							CLASS="button">Rearrange Items</A></TD>
						<%
				}
%>
						<TD
							CLASS="button"
							ALIGN="CENTER"><A
							HREF="/servlet/CRSAdmin?action=newCustomItem"
							CLASS="button">New Item</A></TD>
						<TD
							CLASS="button"
							ALIGN="RIGHT"><A
							HREF="javascript: goNext('saveCustomItems', 'save')"
							NAME="save"
							CLASS="button">Save Changes</A></TD>
					</TR>
					<% 
		}
%>
				</TABLE>
				</TD>
			</TR>
		</TABLE>
		</FORM>
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
				<TD CLASS="cell">If your event has its own promotional/informational
				website, you can skip this page. However, if you plan to use the
				CRS-generated home page, you can use this screen to provide more
				detailed content about your event (such as speakers, housing
				information, directions, etc.). The items that you enter here will
				be listed, along with the general conference information that you
				entered in Step 1 (conference info), on the CRS-generated home page.
				Once you have added all the items you want, you can arrange items by
				typing numbers in the boxes to the left or click "Rearrange Items."
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
