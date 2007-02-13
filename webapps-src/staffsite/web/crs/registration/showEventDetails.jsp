<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*" %>
<script type="text/javascript">
<!--
if (top.frames.length!=0) {
    if (window.location.href.replace)
        top.location.replace(self.location.href);
    else
        top.location.href=self.document.href;
}
// -->
</script>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){
		response.sendRedirect("/servlet/CRSRegister");
	}
	Conference conference = (Conference)ar.getObject("conference");
	Registration registration = (Registration)ar.getObject("registration");
	String pageTitle = conference.getName();
	Vector regTypesV = (Vector)ar.getObject("RegistrationTypes");
	String type = ar.getValue("type") != null ? ar.getValue("type") : "0";
	boolean isSpouse = false;
%>
<%@ include file="/crs/e_user_header.jspf" %>
<%
	registrationMenu.setActives(new boolean[]{
		true,
		true, 
		true, 
		true, 
		true, 
		true, 
		true,
		true
	});
	
	otherOptionsMenu.setActives(new boolean[]{
		true,
		true,
		true
	});
	

	int imgColSize = 0;
	if(conference.getOnsiteCost() > 0)
		imgColSize++;
	if(conference.getCommuterCost() > 0)
		imgColSize++;
	if(conference.getPreRegDeposit() > 0)
		imgColSize++;
	if(conference.getDiscountEarlyReg() > 0)
		imgColSize++;
	if(conference.getDiscountFullPayment() > 0)
		imgColSize++;

%>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<TD VALIGN="TOP" WIDTH="150">
		<%=registrationMenu.display(0)%>
		<p>
		<%=otherOptionsMenu.display(1)%>
	</TD>

	
	<TD VALIGN="TOP">
	<TABLE WIDTH="100%" CLASS="box" CELLSPACING="0">
		<% if(!"".equals(conference.getTheme())) { %>
		<TR>
			<TD COLSPAN="3" CLASS="boxheader"><%=conference.getTheme()%></TD>
		</TR>
		<% } %>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP" WIDTH="20%">Description</TD>
			<TD CLASS="cell" VALIGN="TOP"><%=conference.getBriefDescription()%></TD>
			<TD CLASS="cell" VALIGN="TOP" ALIGN="RIGHT" ROWSPAN="<%=ar.getCollection("items").size() + 2 + imgColSize%>">
<%
			if(!"".equals(conference.getConfImageID())){
%>
				<IMG SRC="/cms/content/<%=conference.getConfImageID()%>">
<%
			}
%>
			</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Online Registration Dates</TD>
			<TD CLASS="cell" VALIGN="TOP"><%=formatter.formatDate(conference.getPreRegStart())%> through <%=formatter.formatDate(conference.getPreRegEnd())%></TD>
		</TR>
<%
		/*if(conference.getOnsiteCost() > 0){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" WIDTH="25%">Full Cost</TD>
				<TD CLASS="cell">$<%=formatter.formatDecimal(conference.getOnsiteCost())%></TD>
			</TR>
<%
		}
		if(conference.getCommuterCost() > 0){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT">Commuter Cost</TD>
				<TD CLASS="cell">$<%=formatter.formatDecimal(conference.getCommuterCost())%></TD>
			</TR>
<%
		}
		if(conference.getPreRegDeposit() > 0){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT">Registration Deposit</TD>
				<TD CLASS="cell">$<%=formatter.formatDecimal(conference.getPreRegDeposit())%></TD>
			</TR>
<%
		}
		if(conference.getDiscountEarlyReg() > 0){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT">Early Registration Discount</TD>
				<TD CLASS="cell">$<%=formatter.formatDecimal(conference.getDiscountEarlyReg())%>
<%
				if(!formatter.formatDate(conference.getDiscountEarlyRegDate()).equals("No Date")){
%>
					by midnight EST/EDT <%=formatter.formatDate(conference.getDiscountEarlyRegDate())%></TD>
<%
				}
%>
			</TR>
<%
		}
		if(conference.getDiscountFullPayment() > 0){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT">Full Payment Discount</TD>
				<TD CLASS="cell">$<%=formatter.formatDecimal(conference.getDiscountFullPayment())%></TD>
			</TR>
<%
		}*/
		if(ar.getCollection("items").size() > 0){		
			Iterator items = ar.getCollection("items").iterator();
			for(int i = 0; items.hasNext(); i++){
				CustomItem item = (CustomItem)items.next();
%>
				<TR>
					<TD CLASS="hl" VALIGN="TOP" ALIGN="RIGHT"><%=item.getTitle()%></TD>
					<TD CLASS="cell" VALIGN="TOP"><%=formatter.crToBR(item.getText())%></TD>
				</TR>
<%
			}
		}
%>

		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Contact Info</TD>
			<TD CLASS="cell">
			<STRONG><%=conference.getContactName()%></STRONG><BR>
			<%=conference.getContactAddress1()%><BR>
<%
			if(conference.getContactAddress2() != null && !conference.getContactAddress2().equals("")){
%>
				<%=conference.getContactAddress2()%><BR>
<%
			}
%>
			<%=conference.getContactCity()%>, <%=conference.getContactState()%> <%=conference.getContactZip()%> <BR>
			<%=conference.getContactPhone()%> <BR>
			<A HREF="mailto:<%=conference.getContactEmail()%>"><%=conference.getContactEmail()%></A>
			</TD>
		</TR>
	</TABLE>
	</TD>
</TR>
</TABLE>
<%@ include file="/crs/e_user_footer.jspf" %>
<%
		} catch (Exception e) {
			e.printStackTrace();
            throw new Exception(e);
        }
%>
