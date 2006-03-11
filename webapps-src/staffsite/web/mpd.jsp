<!-- 11/14/05 Change made by: Scott Welch
	Changed the MPD Online link from www.mpdonline.org to 
	http://staffweb.ccci.org/mpd/index.aspx. In addition, I formatted the HTML code
	to make it more readable, so that one does not have to scroll very far to the
	 right to read the code.-->
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<% 
	ActionResults ar; 
	ar = ActionResults.getActionResults(session);
%>

<HTML>
<HEAD>
<TITLE>MPD</TITLE>
</HEAD>
<% int curr_tab = 2; %>
<%@ include file="/header.jspf"%>

<% 
	box.setStyle("rounded");
	box.setColor(color3);
	box.setTitleFontSize("5");
	box.setTitle("MPD Tools");
	box.setWidth("100%");
%>
<%=box.printTop()%>
<table width='100%' border=0>
<tr>
	<td width='65%'>
	<%=fontText%>
	<p>We all want to do a good job of building rich, long term relationships with our Ministry Partners. In order to do this, it's important to have a plan. Here are the available tools and resources to help you create and carry out your MPD strategy.</p>
	<p>The account balance displayed below is updated once daily. For a more up-to-the-minute report from the Staff Web, please click "Staff Account Information" below. If your balance displayed on this page does not change for days on end and you think there might be a problem, please <a href="mailto:help@campuscrusadeforchrist.com&subject=Possible problem with account balance on MPD page">contact us</a> and we will look into it.</p>
	
		<ul>
		<table>
			<tr>
				<td>
					<%=font%>Acct Balance
				</td>
				<td>
					<%=fontTextS%>(listed to the right, updated every day)</font>
				</td>
			</tr>
			<tr>
				<td>
					<%=font%><a href='https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=../servlet/SaiServlet' target='_blank'>Staff Account Information</A>
				</td>
				<td>
					<%=fontTextS%>(view Donor Addresses, Donation Information, Staff Expense Report)</font>
				</td>
			</tr>
			<tr>
				<td>
					<%=font%><A HREF="https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=../servlet/ReimbServlet" target="_blank">Reimbursements</A></td><td>  <%=fontTextS%>(personal ministry reimbursements) </font>
				</td>
			</tr>
			<tr>
				<td>
					<%=font%><A HREF="http://staffweb.ccci.org/mpd/index.aspx" target='_blank'>mpdonline.org</A>
				</td>
				<td>
					<%=fontTextS%>(Corporate Crusade MPD site)</font>
				</td
			</tr>
			<tr>
				<td>
					<%=font%><A HREF="http://home.ccci.org/wolbrink/tntmpd/" target='_blank'>TntMPD</A> </td><td> <%=fontTextS%>(an offline program for managing your MPD)</font>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					&nbsp;
				</td>
			</tr>
			<!-- <tr><td><%=font%><A HREF="/servlet/StaffController?action=showSetupPS" 
			target="_blank"><%=fontB%>PeopleSoft setup</FONT></a></td><td><%=fontTextS%>Allows you to save your PeopleSoft username and password (or change the username and password that you have already saved) on this site. The PeopleSoft information is required for access to your Staff Account information and online reimbursements.</font></td></tr> -->
		</table>
		</ul>
	</td>
	<td align=center width='45%'>
			<%	box.setTitle("&nbsp; Staff Account Balance &nbsp;");
				box.setTitleFontSize("2");
				box.setStyle("classic");
				box.setColor(color3);
				box.setWidth("20%");%>
				<%=box.printTop()%>
				<center><%=fontB%>
				<%
				if(!ar.getValue("balance").equals("N/A")) { 
					out.print("$");
				}
				out.print(ar.getValue("balance")); %>

				</font>
				</center>
			<%=box.printBottom()%>


	</td>
</tr>
</table>
<% box.setStyle("rounded");%>
<%=box.printBottom()%>

<%@ include file="/footer.jspf" %>
</BODY>
</HTML>

