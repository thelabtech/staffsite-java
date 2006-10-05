<%@ page
	import="org.alt60m.servlet.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<%@page import="org.apache.commons.logging.LogFactory"%>
<%@page import="org.apache.commons.logging.Log"%>
<jsp:useBean
	id="selState"
	class="org.alt60m.html.SelectState"
	scope="request" />
<jsp:useBean
	id="selYIS"
	class="org.alt60m.html.SelectYearInSchool"
	scope="request" />
<%
Log log = LogFactory.getLog("org.alt60m.jsp.crs.registration.askSpouseQuestions");
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Registration registration = (Registration)ar.getObject("registration");
	Person spouse = (Person)ar.getObject("spouse");
	Conference conference = (Conference)ar.getObject("conference");
	RegistrationType regType = registration.getRegistrationType();
	Vector regTypesV = (Vector)ar.getObject("RegistrationTypes");
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));
	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String pageTitle = "Spouse Registration Information";
%>
<%@ include file="/crs/e_user_header.jspf"%>
<%formatter.setNoDate("");%>
<%
	registrationMenu.setActives(new boolean[]{
		true,
		true,
		true,
		true,
		true,
		true,
		true,
		true,
		false,
		true
	});

otherOptionsMenu.setActives(new boolean[]{
		true,
		true,
		true
	});
	

	accountManagementMenu.setActives(new boolean[]{
		true
	});
%>
<script LANGUAGE="JavaScript">
	<!--
		function goNext(action){
			var form = document.theForm;
			form.action.value = action;
			form.submit();
		}
	//-->
</script>
<table
	WIDTH="100%"
	align="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<tr>
		<td
			Valign="TOP"
			WIDTH="150"
			ROWSPAN="3"><%=registrationMenu.display(0)%>
			<p>
			<%=otherOptionsMenu.display(0)%>
			<p>
		<table
			class="box"
			WIDTH="100%"
			CELLSPACING="0"
			CELLPADDING="0">
			<tr>
				<td class="subboxheader">Key</td>
			</tr>
			<tr>
				<td class="cell"><input
					class="required"
					VALUE="Required Fields"></td>
			</tr>
			<tr>
				<td class="cell"><input
					class="empty"
					VALUE="Optional Fields"></td>
			</tr>
		</table>
		<p><%=accountManagementMenu.display(0)%>
		</td>
		<td
			Valign="TOP"
			COLSPAN="2">
		<form
			NAME="theForm"
			ACTION="/servlet/CRSRegister"
			METHOD="post"><input
			type="hidden"
			NAME="action"> <input
			type="hidden"
			NAME="spouseReg"
			value="T">
		<table
			border="0"
			CELLSPACING="0"
			WIDTH="100%"
			class="box">
			<tr>
				<td
					class="boxheader"
					COLSPAN="2">Spouse Registration Type</td>
			</tr>
			<tr>
				<td
					class="cell"
					COLSPAN="2">
				<div class="question">You indicated that your spouse will be attending this event. Our records show that your spouse is <strong><%=spouse.getEmail()%></strong>.
				If this is incorrect, please contact the event's contact person listed in the "help" section below.</div>
				<div class="question">Please choose your spouse's registration type from the list below. You have registered as a <B><%=regType.getLabel()%></B>.
				</div>
				<div class="answer">
				<% /* iterate over all RegistrationTypes */
				Iterator regTypes = regTypesV.iterator();
				for(int i = 0; regTypes.hasNext(); i++){
					Vector v = (Vector)regTypes.next();
					String typeID = (String)v.get(0);
					String typeLabel = (String)v.get(1);
					String typeDescription = (String)v.get(2);
					%>
				<input type="radio"	name="spouseRegTypeID" value="<%=typeID%>"
				<% if (regType.getLabel().equals(typeLabel)){%>	checked="checked"<%}%>
					>
					<strong><%=typeLabel%></strong>	- <%=typeDescription%><br />					
				<%}%>
				
				</div>
				</td>
			</tr>
			<tr>
				<td
					class="button"
					align="LEFT"><a
					HREF="/servlet/CRSRegister?action=editPersonDetails"
					class="button">&lt; &lt; Back</a></td>
				<td
					class="button"
					align="RIGHT"><a
					HREF="javascript: goNext('saveSpouseQuestions')"
					class="button">Next &gt; &gt;</a></td>
			</tr>
		</table>
		<P>
		<!-- Removed 10/28 by S Paulis ***************
		<TABLE
			BORDER="0"
			CELLPADDING="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Instructions</TD>
			</TR>
			<TR>
				<TD
					CLASS="cell"
					COLSPAN="2"></TD>
			</TR>
		</TABLE>
		*******************************************-->
		
		</form>
		</td>
	</tr>
</table>
<%@ include file="/crs/e_user_footer.jspf"%>
<%
} catch (Exception e) {
	log.error(e, e);
	throw e;
}
%>
