<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	RegistrationType rt = (RegistrationType)ar.getObject("RegistrationType");
	int typeID = rt.getRegistrationTypeID();
	String typeLabel = rt.getLabel();	
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	boolean newRegType = session.getValue("newRegType") != null && ((String)session.getValue("newRegType")).equals("true");
	boolean onlyOneRegType = session.getValue("onlyOneRegType") != null && ((String)session.getValue("onlyOneRegType")).equals("true");

	String pageTitle = "Additional Expenses" + (newEvent&&onlyOneRegType?"":(" for "+typeLabel));
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNextWithRedirect(action,nextAction, buttonname){
		var form = document.merchandise;
		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		} else {
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.nextAction.value = nextAction;
				form.submit();
			}
		}
	}
		
	function goNext(action, buttonname){
		goNextWithRedirect(action, "", buttonname);
	}
	function emptyfunction(){
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
			WIDTH="150"><%=toolsMenu.display(0)%>
		<P><%=newEvent ? creationMenu.display(3) : conferenceMenu.display(8)%>
		</TD>
		<TD VALIGN="TOP">
		<FORM
			NAME='merchandise'
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action"
			VALUE="updateMerchandiseOrder"><INPUT TYPE=hidden NAME="nextAction">
			<INPUT
			TYPE=hidden
			NAME="RegistrationTypeID"
			VALUE="<%=typeID%>"> <INPUT
			TYPE=hidden
			NAME="orderCol"
			VALUE="<%=ar.getValue("orderCol")%>"> <INPUT
			TYPE=hidden
			NAME="order"
			VALUE="<%=ar.getValue("order")%>">

		<TABLE
			BORDER="0"
			CELLSPACING="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<%
		if(ar.getCollection("Merchandise").size() > 0){		
			Iterator options = ar.getCollection("Merchandise").iterator();

			formatter.setHeaderNames(new String[] {"Order", "Name", "Item Price", "", ""});
			formatter.setHeaderSorts(new boolean[] {true, true, true, false, false});
			formatter.setHeaderWidths(new String[] {"12%", "*", "15%", "7%", "7%"});
			formatter.setHeaderAligns(new String[] {"LEFT", "LEFT", "CENTER", "", ""});
%>
			<%=formatter.displayHeader( ar.getValue("orderCol"), ar.getValue("order"), "Merchandise Table", "/servlet/CRSAdmin?action=listRegTypeMerchandise")%>
			<INPUT
				TYPE="hidden"
				NAME="merchandiseSize"
				Value="<%=ar.getCollection("Merchandise").size()%>">
			<%
			for(int i = 0; options.hasNext(); i++){
				Merchandise m = (Merchandise)options.next();
%>
			<INPUT
				TYPE="hidden"
				NAME="<%=i%>MerchandiseID"
				Value="<%=m.getMerchandiseID()%>">
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
					value="<%=m.getDisplayOrder()%>"></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="<%=(m.getAmount()== 0) ? "CENTER" : "LEFT" %>"><B><%=m.getName()%></B><BR>
				<%=m.getNote()%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="RIGHT"><%=(m.getAmount()== 0) ? "" : "$" + (formatter.formatDecimal(m.getAmount()))%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><A
					CLASS="button"
					HREF="/servlet/CRSAdmin?action=editMerchandiseDetails&merchandiseID=<%=m.getMerchandiseID()%>">Edit</A></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><A
					CLASS="button"
					HREF="/servlet/CRSAdmin?action=deleteMerchandise&merchandiseID=<%=m.getMerchandiseID()%>"
					onMouseOver="return overlib('<B>WARNING!</B><BR>This is not undoable!');"
					onMouseOut="return nd();">Delete</A></TD>
			</TR>
			<%
			}
		} else {
%>
			<TR>
				<TD
					CLASS="cell"
					ALIGN="CENTER"
					COLSPAN="7">There aren't any items to display</TD>
			</TR>
			<%
		}
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="7">
				<TABLE
					CELLSPACING="0"
					CELLPADDING="0"
					BORDER="0"
					WIDTH="100%">
					<%
					//	if(newEvent && newRegType){ //why new reg type AND new event?  why not just new reg type?
					if(newRegType){				// replaced 5/9/05 S.Paulis

%>
					<TR>
						<TD
							CLASS="button"
							ALIGN="LEFT"><A
							HREF="/servlet/CRSAdmin?action=editFinancialDetails"
							CLASS="button">&lt;&lt; Back</A></TD>
						<%
					if(ar.getCollection("Merchandise").size() > 1){
%>
						<TD
							CLASS="button"
							ALIGN="CENTER"><A
							HREF="javascript: document.merchandise.submit()"
							CLASS="button">Rearrange Additional Expenses</A></TD>
						<%
					}
%>
						<TD
							CLASS="button"
							ALIGN="CENTER"><A
							HREF="/servlet/CRSAdmin?action=newMerchandise"
							CLASS="button">New Additional Expense</A></TD>
						<TD
							CLASS="button"
							ALIGN="RIGHT"
							COLSPAN="2"><A
							HREF="javascript: goNext('saveMerchandise', 'save')"
							NAME="save"
							CLASS="button">Next &gt;&gt;</A></TD>
					</TR>
					<% 
			} else{
%>
			<TR>
				<!--removed - not necessary
				<TD COLSPAN="3" CLASS="button" ALIGN="LEFT">
				
				<TD 
					CLASS="button" 
					ALIGN="LEFT"><A 
					HREF="/servlet/CRSAdmin?action=listRegistrationTypes" 
					CLASS="button">Cancel & List Types</A></TD>
				-->	
				<% 
				if(ar.getCollection("Merchandise").size() > 1){
				%>
					
					<TD
						CLASS="button"
						ALIGN="LEFT"><A
						HREF="javascript: document.merchandise.submit()"
						CLASS="button">Rearrange Additional Expenses</A></TD>
					<TD
						CLASS="button"
						ALIGN="CENTER"
				<%
				}
				else
				{
				%>
					<TD
						CLASS="button"
						ALIGN="LEFT"
				<%}%>
					><A
						HREF="/servlet/CRSAdmin?action=newMerchandise"
						CLASS="button">New Additional Expense</A></TD>
			
					<TD 
						CLASS="button" 
						ALIGN="RIGHT"><A 
						HREF="javascript: goNext('saveMerchandise', 'save')" 
						NAME="save" 
						CLASS="button">Save Changes</A></TD>
				
				</TR>
				<TR>
					<TD COLSPAN="7" CLASS="button" >
						<TABLE WIDTH="100%"><TR>
							<TD CLASS="button" ALIGN="CENTER">
							
								<A HREF="javascript: goNextWithRedirect('saveMerchandise','editRegistrationType', 'rt')" CLASS="button" NAME="rt">Edit Registrant Type</A><br><br>
								<A HREF="javascript: goNextWithRedirect('saveMerchandise','editFinancialDetails', 'financial')" CLASS="button" NAME="financial">Edit Financial Details</A><br><br>
								<A HREF="javascript: emptyfunction('saveMerchandise','editFinancialDetails', 'financial')"CLASS="inactivebutton" NAME="merchandise">Edit Additional Expenses</A><br><br>
								<A HREF="javascript: goNextWithRedirect('saveMerchandise','editProfileQuestions', 'profile')" CLASS="button" NAME="profile">Edit Profile Questions</A><br><br>
								<A HREF="javascript: goNextWithRedirect('saveMerchandise','listRegTypeQuestions', 'questions')" CLASS="button" NAME="questions">Edit Custom Questions</A></TD>
								
						</TR></TABLE>
					</TD>
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
				<TD CLASS="cell">The Edit Additional Expenses page allows
				administrators to add expenses to the conference's registration
				cost. This page can be used to offer anything from a conference
				T-shirt to an optional ski trip.
				<P>If you wish to add additional expenses, click "New Additional Expense."
				<P><B>NOTE:  If you add an expense with an amount equal to $0.00, it will
				be considered a SECTION HEADER.  The Name and Note you enter will be centered
				and the dollar amount will disappear from the right side.</B>
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
