<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	Conference conference = new Conference();
	Hashtable requestHash = ar.getHashtable("request") != null ? ar.getHashtable("request") : new Hashtable();
	String pageTitle = "Add a New Registration";
	String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
%>
<%@ include file="/crs/e_header.jspf"%>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(2)%></TD>
		<TD VALIGN="TOP">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="2"
					CLASS="boxheader"><%=ar.getValue("lookupMessage")%></TD>
			</TR>
			<FORM
				ACTION="/servlet/CRSAdmin"
				METHOD="POST"
				NAME="theForm"><INPUT
				TYPE="HIDDEN"
				NAME="nextAction"
				VALUE="<%=ar.getValue("nextAction")%>"> <INPUT
				TYPE="HIDDEN"
				NAME="nextVar"
				VALUE="<%=ar.getValue("nextVar")%>"> <INPUT
				TYPE="HIDDEN"
				NAME="lookupMessage"
				VALUE="<%=ar.getValue("lookupMessage")%>"> <INPUT
				TYPE="HIDDEN"
				NAME="action"
				VALUE="lookupPerson"> <%
		Enumeration requestE = requestHash.keys();
		String passThrough = "";
		while (requestE.hasMoreElements()) {
			String key = (String)requestE.nextElement();
			if(!key.equals("firstName") && !key.equals("lastName") && !key.equals("nextAction") && !key.equals("nextVar") && !key.equals("lookupMessage") && !key.equals("action") && !key.equals("offset") && !key.equals("size")){
				passThrough += key + "=" + (String)requestHash.get(key) + "&";
%> <INPUT
				TYPE="HIDDEN"
				NAME="<%=key%>"
				VALUE="<%=(String)requestHash.get(key)%>"> <%
			}
		}
%>
			<TR>
				<TD
					ALIGN="RIGHT"
					CLASS="hl"
					WIDTH="20%">First Name</TD>
				<TD
					ALIGN="LEFT"
					CLASS="cell"><INPUT
					WIDTH="20"
					NAME="firstName"
					VALUE="<%=ar.getValue("firstName") != null ? ar.getValue("firstName") : ""%>"></TD>
			</TR>
			<TR>
				<TD
					ALIGN="RIGHT"
					CLASS="hl">Last Name</TD>
				<TD
					ALIGN="LEFT"
					CLASS="cell"><INPUT
					WIDTH="20"
					NAME="lastName"
					VALUE="<%=ar.getValue("lastName") != null ? ar.getValue("lastName") : ""%>"></TD>
			</TR>
			<TR>
				<TD
					ALIGN="RIGHT"
					CLASS="button"
					COLSPAN="2"><A
					HREF="javascript: document.theForm.submit()"
					CLASS="button">Search</A></TD>
			</TR>
			<TR>
				<TD
					ALIGN="RIGHT"
					CLASS="hl">Quick Links</TD>
				<TD
					ALIGN="LEFT"
					CLASS="button"><%
			char[] letters = alphabet.toCharArray();
			for(int i = 0; i < letters.length; i++){
%> <A
					CLASS="button"
					HREF="/servlet/CRSAdmin?action=lookupPerson&lookupMessage=<%=ar.getValue("lookupMessage")%>&nextAction=<%=ar.getValue("nextAction")%>&nextVar=<%=ar.getValue("nextVar")%>&<%=passThrough%>lastName=<%=letters[i]%>"><%=letters[i]%></A>
				<%
				if(i == 12){
%> <BR>
				<BR>
				<%
				}
			}
%></TD>
			</TR>
			</FORM>
		</TABLE>
		<P>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<%
	if(ar.getCollection("persons") != null){
		Iterator persons = ar.getCollection("persons").iterator();
		String passURL = "&lastName=" + ar.getValue("lastName") + "&firstName=" + ar.getValue("firstName") + "&lookupMessage=" + ar.getValue("lookupMessage") + "&nextAction=" + ar.getValue("nextAction") + "&nextVar=" + ar.getValue("nextVar") + "&" + passThrough;
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="4"
					CLASS="boxheader">Your search returned <%=ar.getValue("maxSize")%>
				people</TD>
			</TR>
			<%
		if(persons.hasNext()){		
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="2"
					CLASS="pager"><%=formatter.displayPager( ar.getValue("offset"), ar.getValue("size"), ar.getValue("maxSize"), "People", "/servlet/CRSAdmin?action=lookupPerson" + passURL)%>
				</TD>
			</TR>
			<%
			formatter.setHeaderNames(new String[] {"FirstName", "LastName"});
			formatter.setHeaderSorts(new boolean[] {true, true});
			formatter.setHeaderWidths(new String[] {"", ""});
			formatter.setHeaderAligns(new String[] {"LEFT", "LEFT"});
%>
			<%=formatter.displayHeader( ar.getValue("orderCol"), ar.getValue("order"), "Persons Table", "/servlet/CRSAdmin?action=lookupPerson" + passURL)%>
			<%
			for(int i = 0; persons.hasNext(); i++){
				Person person = (Person)persons.next();
%>
			<TR>
				<TD
					CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>"
					VALIGN="TOP"
					COLSPAN="2"><A
					CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>"
					HREF="/servlet/CRSAdmin?action=<%=ar.getValue("nextAction")%>&<%=ar.getValue("nextVar")%>=<%=person.getPersonID()%>&<%=passThrough%>"><%=person.getFirstName()%>
				<%=person.getLastName()%></A></TD>
			</TR>
			<%
			}
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="2"
					CLASS="smallpager"><%=formatter.displaySmallPager( ar.getValue("offset"), ar.getValue("size"), ar.getValue("maxSize"), "People", "/servlet/CRSAdmin?action=lookupPerson" + passURL)%>
				</TD>
			</TR>
			<%
		} else {
%>
			<TR>
				<TD
					CLASS="cell"
					ALIGN="CENTER"
					COLSPAN="4">There aren't any people who match <B>'<%=ar.getValue("firstName")%>
				<%=ar.getValue("lastName")%>'</B></TD>
			</TR>
			<%
		}
	}
%>
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
				<TD CLASS="cell">From this page, you may search all the existing
				Campus Crusade for Christ login accounts for the name of the person
				you want to register. Type all or part of their first or last name
				in the appropriate field, and hit the "search" button. This will
				pull up a list of all existing login accounts that have the name you
				typed in, and you can choose the person that you want to register.
				You may also use the quick links to find all existing users whose
				last name begins with a certain letter of the alphabet. However, be
				aware that these lists will be very long, and only 10 names will be
				displayed per page.
				<P>If the person you are looking for does not appear in the list,
				this is probably because they do not have a Campus Crusade for
				Christ login account. To get one, they should go to the registration
				website for this conference and click "Create a new login" from the
				login page.
				<P>At this time, there isn't a way for you to register someone who
				does NOT have a Campus Crusade for Christ login account. Creating a
				login account is a one-time process which they will need to complete
				themselves.
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
