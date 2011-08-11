<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<jsp:useBean id="lanes" class="org.alt60m.html.SelectLane" />
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
  Hashtable teamTable = ar.getHashtable("team");
	String teamName = (String)teamTable.get("Name");
	String teamNote = (String)teamTable.get("Note");
	String teamRegion = (String)teamTable.get("Region");
	String teamID = (String)teamTable.get("LocalLevelId");
	String teamPhone = (String)teamTable.get("Phone");
	String teamEmail = (String)teamTable.get("Email");
	String teamUrl = (String)teamTable.get("Url");
	if(!teamUrl.equals("")) 
	{
		if(!teamUrl.startsWith("http")){
			teamUrl="http://"+teamUrl;
		}
	}
	String teamLane = (String)teamTable.get("Lane");
	lanes.setCurrentValue(teamLane);
	teamLane=lanes.display();
	String title="";
	if(Arrays.asList(
			"Campus Field Ministry", 
			"Ethnic Field Ministry",
			"Destino",
    		"Epic",
    		"Impact",
    		"Nations",
			"Worldwide Student Network", "Bridges Int'l"
			).contains(teamLane)){
		title="Missional Team Info";
		
	}else{
		title="Team Info";
	}
	String teamAddress = (String)teamTable.get("Address1");
	String teamAddress2 = (String)teamTable.get("Address2");
	String teamCity = (String)teamTable.get("City");
	String teamState = (String)teamTable.get("State");
	String teamZip = (String)teamTable.get("Zip");
	String teamCountry = (String)teamTable.get("Country");
	if (!teamAddress.equals(""))
	{
		if (!teamAddress2.equals(""))
			teamAddress = teamAddress + "<br>" + teamAddress2;
		if (!teamCity.equals(""))
			teamAddress = teamAddress + "<br>" + teamCity;
		if (!teamState.equals(""))
			teamAddress = teamAddress + ", " + teamState;
		if (!teamZip.equals(""))
			teamAddress = teamAddress + " " + teamZip;
		if (!teamCountry.equals(""))
			teamAddress = teamAddress + "<br>" + teamCountry;
	}
	String teamRegionName = (String)teamTable.get("RegionName");
	Boolean tempActive = (Boolean)teamTable.get("IsActive");
	String teamActive;
	if(tempActive.booleanValue())
		teamActive = "Yes";
	else
		teamActive = "No";
%>
<html>
<head>
<script type="text/javascript">
var lastOpen="";
function show(personID){
	hide();
	document.getElementById(personID+"_leader_status").style.display='inline';
	lastOpen=personID;
}
function hide(){
	if (lastOpen!==""){
	document.getElementById(lastOpen+"_leader_status").style.display='none';
	}
}
</script>
<title><%=teamName%>&nbsp;Details</title>
</head>

<% String pageTitle = teamName; %>
<%@ include file="/infobase/ibheader.jspf" %>
				<form name=bookmarkForm action='/servlet/InfoBaseController' method='post'>
				    <input type=hidden name="action" value="changeBookmark">
						<input type=hidden name="displayname" value="<%= teamName %>">
						<input type=hidden name="type" value="locallevel">
						<input type=hidden name="locallevelid" value="<%= teamID %>">
						<input type=hidden name="value" value="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= teamID %>">
						<% 
								String mode;
								if(!ar.getValue("bookmarkID").equals("")) {
									mode = "remove";
								} else {
										mode = "add";
									}
							%>
						<INPUT TYPE=hidden name="bookmarkid" value="<%= ar.getValue("bookmarkID") %>"> 
						<INPUT TYPE=hidden name="mode" value="<%= mode %>">
				</form>
<% box.setWidth("100%");%>
<% box.setTitleAlign("LEFT");%>
<% box.setStyle("classic");%>
<% box.setTitleColor("#FFFFFF");%>
<% box.setTitle(""); %>
<% box.setColor("#D0DDEA");%>
<%=box.printTop() %>



<TABLE WIDTH="100%" BORDER="0"><TR><TD WIDTH="50%" ALIGN="LEFT"><%= font %>[<A HREF="/servlet/InfoBaseController?action=createReport&locallevelid=<%= teamID %>&type=locallevel">Success Criteria Reporter</A>]</FONT></TD><TD WIDTH="50%" ALIGN="RIGHT"><%= font %><A HREF="javascript: document.bookmarkForm.submit();"><% if(mode == "remove") { %>Un-<% } %>Bookmark this team</A></FONT></TD></TR></TABLE>
<%=box.printBottom() %>
	<table width="100%" border=0><tr><td WIDTH="30%" ALIGN="CENTER" VALIGN="TOP">
<% box.setTitleColor("#336699");%>
<% box.setColor("#FFFFFF");%>
<% box.setTitle("&nbsp;"+title);%>
<% box.setWidth("98%");%>
<%=box.printTop()%>
				<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<% if(!teamLane.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Strategy: </B></FONT></TD><TD><%= font %><%= teamLane %></TD></TR><% } %>
				<% if(!teamRegion.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Region: </B></FONT></TD><TD><%= font %><%= teamRegionName %></TD></TR><% } %>
				<% if(!teamAddress.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Address: </B></FONT></TD><TD style="padding-bottom:5px;"><%= fontS %><%= teamAddress  %></TD></TR><% } %>
				<% if(!teamPhone.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Phone: </B></FONT></TD><TD><%= font %><%= teamPhone %></TD></TR><% } %>
				<% if(!teamEmail.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>E-mail: </B></FONT></TD><TD><%= font %><A HREF="mailto: <%= teamEmail %>"><%= teamEmail %></A></TD></TR><% } %>
				<% if(!teamUrl.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Website: </B></FONT></TD><TD><%= font %><A HREF="<%= teamUrl %>"><%= teamUrl %></A></TD></TR><% } %>
				<% if(!teamActive.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Active? </B></TD><TD><%= font %><%= teamActive %></TD></TR><% } %>
				<% if(!teamNote.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Note: </B></TD><TD><%= font %><%= teamNote %></TD></TR><% } %>
				</TABLE>
				<P ALIGN="CENTER">
			<A HREF="/servlet/InfoBaseController?action=editTeam&mode=update&locallevelid=<%= teamID %>"><%= font %>Update</FONT></A><BR><%= fontS %>(Click update to add or change team contact info, web address, note, etc.)
<%=box.printBottom()%>
<BR>
<% box.setTitle("&nbsp;Member Info");%>
<% box.setBodyFontSize("2");%>
<%=box.printTop()%>
<% Iterator targetStaffI = ar.getCollection("staff").iterator();
	Boolean present=false;
  String emailList = "";
  while(targetStaffI.hasNext()) {
		org.alt60m.ministry.model.dbio.Contact staffMember = (org.alt60m.ministry.model.dbio.Contact)targetStaffI.next();
    String staffName = "";
	if((staffMember.getPreferredName()!=null)&&
			(!((String)staffMember.getPreferredName()).equals(""))&&
			(!((String)staffMember.getPreferredName()).equals(" ")))
					{
					staffName+=( (String)staffMember.getPreferredName());
					}
		else
					{
					staffName+=((String)staffMember.getFirstName());
					}
		staffName+=" "+(String)staffMember.getLastName() ;
		String staffEmail = (String)staffMember.getEmail();
		String personID = staffMember.getPersonID()+"";
		if (personID.equals(ar.getValue("personID"))){present=true;}
		if(!staffEmail.equals("")) {
			emailList = emailList + staffEmail + "; ";
		}
	
		%>
		 <%if(!staffMember.getIsPeopleSoft()&&((session.getValue("isHR").equals("true"))||personID.equals(ar.getValue("personID"))||ar.getValue("isRD").equals("true"))){ %>
		<A style="border:none;"
					HREF="/servlet/InfoBaseController?action=removeTeamMember&accountNo=<%=staffMember.getAccountNo()%>&personID=<%= personID %>&locallevelid=<%= teamID %>&teamID=<%= teamID %>&view=team">
				<img alt="Remove" style="border:none;height:10px;width:10px;" src="/infobase/images/reddot.gif"></A>
	
		<%} %>
 
		<A HREF="/servlet/InfoBaseController?action=showPersonInfo&accountNo=<%=staffMember.getAccountNo()%>&personID=<%= personID %>"><%=staffName%></A>
   <%if(staffMember.getIsLeader()){ %>
		<img alt="Missional Team Leader" onMouseOver="show('<%=staffMember.getPersonID() %>');" id="<%=staffMember.getPersonID() %>_leader_hover" style="border:none;" src="/infobase/images/leader.gif"><%} else {%>
		<img alt="Missional Team Member" onMouseOver="show('<%=staffMember.getPersonID() %>');" id="<%=staffMember.getPersonID() %>_leader_hover" style="border:none;" src="/infobase/images/member.gif"><%} %>
   
			 
<div id="<%=staffMember.getPersonID() %>_leader_status" >
<i>
<%if(staffMember.getIsLeader()){ %>
Team Leader
<%} else { %>
Team Member
<%} %>
<%if(!staffMember.getIsPeopleSoft()&&((session.getValue("isHR").equals("true"))||ar.getValue("isRD").equals("true"))){ %>
<br>
<%if(staffMember.getIsLeader()){ %>		
<A style="border:none;"
					HREF="/servlet/InfoBaseController?action=removeTeamLeader&accountNo=<%=staffMember.getAccountNo()%>&personID=<%= personID %>&locallevelid=<%= teamID %>&teamID=<%= teamID %>&view=team">
			 Change <%=staffName%> to Member</A>
		<%} else {%>
		<A style="border:none;"
					HREF="/servlet/InfoBaseController?action=saveTeamLeader&accountNo=<%=staffMember.getAccountNo()%>&personID=<%= personID %>&locallevelid=<%= teamID %>&teamID=<%= teamID %>&view=team">
			Change <%=staffName%> to Leader</A>
		<%}} %>
	
</i>	</div>
<script type="text/javascript" language="javascript">
document.getElementById('<%=staffMember.getPersonID() %>_leader_status').style.display='none';
</script>
<br>	<%}%>
<P ALIGN="CENTER">

		
		<% if(!emailList.equals("")) { %>
			<A HREF="mailto: <%= emailList %>">E-mail</A> all Missional Team members<br>
		<% } %>
		  <%if(session.getValue("isHR").equals("true")||ar.getValue("isRD").equals("true")){ %>
		<A HREF="/servlet/InfoBaseController?action=addMissionalTeamMember&teamID=<%=teamID %>&lastName=">Add a Missional Team Member</A><br>
		<%} %>
		<%if (!present){%>
		<A HREF="/servlet/InfoBaseController?action=saveTeamMember&teamID=<%=teamID %>&locallevelid=<%=teamID %>&personID=<%= ar.getValue("personID") %>">Join This Missional Team</A>
		<%} %>
	<%= box.printBottom()%>
	</TD>
	<TD VALIGN="TOP">
  <% Collection activeTargetCampusC = ar.getCollection("activetarget");
  Collection inactiveTargetCampusC = ar.getCollection("inactivetarget");
  Collection forerunnerTargetCampusC = ar.getCollection("forerunnertarget");
  Iterator activeTargetCampusI = activeTargetCampusC.iterator();
  Iterator inactiveTargetCampusI = inactiveTargetCampusC.iterator();
  Iterator forerunnerTargetCampusI = forerunnerTargetCampusC.iterator();
	   Hashtable row = null;
	%>
	<% if (activeTargetCampusC.size()>0) { %>
		<% box.setTitle("&nbsp;This Missional Team is currently responsible for the following Movements:");%>
		<% box.setSubPad("0"); %>
		<% box.setWidth("100%"); %>
		<%=box.printTop()%>
			<TABLE WIDTH="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
			<TR>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Ministry Location</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Strategy</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Status</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Update</B></FONT></TD>
			</TR>
			<% while(activeTargetCampusI.hasNext()) {
				   row = (Hashtable)activeTargetCampusI.next();
				   org.alt60m.ministry.model.dbio.Activity thisAct=new org.alt60m.ministry.model.dbio.Activity((String)row.get("ActivityId"));
				   Boolean isLink=thisAct.getSentTeamId()!=null;
				%>
				<TR>
					<TD><%=font%>
						<%if (!isLink){ %>
							<A HREF="/servlet/InfoBaseController?action=showTargetArea&targetareaid=<%=row.get("TargetAreaID")%>">
									<B><%=row.get("Name")%></B></A><%} else { %>
								<%org.alt60m.ministry.model.dbio.LocalLevel sentTeam=new org.alt60m.ministry.model.dbio.LocalLevel(thisAct.getSentTeamId()); %>
							<A href="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= sentTeam.getLocalLevelId() %>">
						Sent Team: <%=sentTeam.getName()%></A><%} %>

						</FONT></TD>
					<TD><%=font%><%=row.get("StrategyName")%></FONT></TD>
					<TD><%=font%><%=row.get("StatusName")%></FONT></TD>
					<TD><%=font%>[<A HREF="/servlet/InfoBaseController?action=editActivity&locallevelid=<%= teamID %>&referrer=locallevel&targetareaid=<%= row.get("TargetAreaID") %>&strategy=<%= row.get("Strategy") %>&activityid=<%= row.get("ActivityId") %>&status=<%= row.get("Status") %>&url=<%= row.get("Url") %>&facebook=<%= row.get("Facebook") %>">Update</A>]</FONT></TD>
				</TR>
			<% } %>
				</TABLE><P ALIGN="CENTER"><TABLE WIDTH="90%" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD>
				<%=font%>Add a Ministry Location to this team:<BR>
																<!--	FS ("Field Strategies"),-->
																<!--	IE ("Epic"),-->
																<!--	ID ("Destino"), -->
																<!--	II ("Impact"),-->
																<!--	IN ("Nations"),-->
																<!--	WS ("WSN"),-->
																<!--	BR ("Bridges"),-->
																<!--	AA ("Athletes In Action"),-->
																<!--	CL ("Faculty Commons"),-->
																<!--	KC ("Korea CCC"),-->
																<!--	GK ("Greek"),-->
																<!--	VL ("Valor"),-->
																<!--	EV ("Events"),-->
																<!--	OT ("Other")-->
					<%=font%>[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=FS">add FS</A>]  
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=BR">add BR</A>] 
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=ID">add EFM-D</A>] 
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=IE">add EFM-E</A>] 
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=II">add EFM-I</A>] 
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=IN">add EFM-N</A>] <BR>
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=AA">add AIA</A>] 
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=CL">add Faculty Commons</A>] 
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=KC">add KCCC</A>] 
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=GK">add Greek</A>] 
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=VL">add Valor</A>]<BR>
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=WS">add WSN Local Teams</A>] 
			</TD></TR></TABLE>

		<%=box.printBottom()%><P>
	<% } %>
	<% if (forerunnerTargetCampusC.size()>0) { %>
		<% box.setTitle("&nbsp;This Missional Team is trusting God to help them launch Movements at:");%>
		<% box.setSubPad("0"); %>
		<% box.setWidth("100%"); %>
		<%=box.printTop()%>
			<TABLE WIDTH="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
			<TR>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Ministry Location</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Strategy</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Status</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Update</B></FONT></TD>
			</TR>
			<% while(forerunnerTargetCampusI.hasNext()) {
				   row = (Hashtable)forerunnerTargetCampusI.next();
				%>
				<TR>
					<TD><%=font%><A HREF="/servlet/InfoBaseController?action=showTargetArea&targetareaid=<%=row.get("TargetAreaID")%>"><B><%=row.get("Name")%></B></A></FONT></TD>
					<TD><%=font%><%=row.get("StrategyName")%></FONT></TD>
					<TD><%=font%><%=row.get("StatusName")%></FONT></TD>
					<TD><%=font%>[<A HREF="/servlet/InfoBaseController?action=editActivity&locallevelid=<%= teamID %>&referrer=locallevel&targetareaid=<%= row.get("TargetAreaID") %>&strategy=<%= row.get("Strategy") %>&activityid=<%= row.get("ActivityId") %>&status=<%= row.get("Status") %>&url=<%= row.get("Url") %>&facebook=<%= row.get("Facebook") %>">Update</A>]</FONT></TD>
				</TR>
			<% } %>
				</TABLE><P ALIGN="CENTER"><TABLE WIDTH="90%" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD>
				<%=font%>Add a Ministry Location to this team:<BR>
					<%=font%>[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=FS">add Forerunner</A>]
			</TD></TR></TABLE>
		<%=box.printBottom()%><P>
	<% } %>
	<% if (inactiveTargetCampusC.size()>0) { %>
		<% box.setTitle("&nbsp;Movements this Missional Team has been responsible for in the past:");%>
		<% box.setSubPad("0"); %>
		<% box.setWidth("100%"); %>
		<%=box.printTop()%>
			<TABLE WIDTH="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
			<TR>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Ministry Location</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Strategy</B></FONT></TD>
				<!-- Commented out to eliminate the confusion about "inactive" might mean 
						and because everything here will be inactive anyway
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Status</B></FONT></TD>
				-->
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Update</B></FONT></TD>
			</TR>
			<% while(inactiveTargetCampusI.hasNext()) {
				   row = (Hashtable)inactiveTargetCampusI.next();
				%>
				<TR>
					<TD><%=font%><A HREF="/servlet/InfoBaseController?action=showTargetArea&targetareaid=<%=row.get("TargetAreaID")%>"><B><%=row.get("Name")%></B></A></FONT></TD>
					<TD><%=font%><%=row.get("StrategyName")%></FONT></TD>
					<!-- Commented out to eliminate the confusion about "inactive" might mean 
					and because everything here will be inactive anyway
					<TD><%=font%><%=row.get("StatusName")%></FONT></TD>
					-->
					<TD><%=font%>[<A HREF="/servlet/InfoBaseController?action=editActivity&locallevelid=<%= teamID %>&referrer=locallevel&targetareaid=<%= row.get("TargetAreaID") %>&strategy=<%= row.get("Strategy") %>&activityid=<%= row.get("ActivityId") %>&status=<%= row.get("Status") %>&url=<%= row.get("Url") %>&facebook=<%= row.get("Facebook") %>">Update</A>]</FONT></TD>
				</TR>
			<% } %>
				</TABLE>
		<%=box.printBottom()%>
	<% } %>
</TD></TR></TABLE>
	    <!--<%=fontB%><%=ar.toHTML()%></font> -->
<br>

<%@ include file="/infobase/ibfooter.jspf" %>
</html>