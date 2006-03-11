<%@ page import="org.alt60m.servlet.*" %>
<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion" />
<jsp:useBean id="states" class="org.alt60m.html.SelectState" />
<jsp:useBean id="countries"  class="org.alt60m.html.SelectCountry" />
<%
ActionResults ar = ActionResults.getActionResults(session);

String val = ar.getValue("admin");
boolean admin = (val != null && val.equalsIgnoreCase("true")) ? true : false;

%>

<% String pageTitle="Proposal for a New Campus"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>

<br>

<!-- Team Info table -->
<table width="75%" border="0" cellspacing="0" cellpadding=3 align=center <%=bgcolorL%>>
	<form method="post" action="/servlet/InfoBaseController">
	<input type=hidden name="action" value="submitNewTargetAreaRequest">
	<input type="hidden" name="to" value="Yvonne.Rivera@uscm.org">
	<input type="hidden" name="subject" value="New Campus Proposal">
	<input type="hidden" name="admin" value="<%=admin%>">
		<tr <%=bgcolorB%>><td colspan="2"><%=fontW3%><b>Campus Info:</b></font></td></tr>
		<tr <%=bgcolorL%>> 
			<td colspan="2"><%=fontText%>&nbsp;
<%= !admin		? 
				"This form will be submitted to an administrator who will email you when the campus has been added to the InfoBase."
				:
				"<B>Notice to Administrator</B>: <font color=red>Immediately</font> after submitting this form, the new campus will be available."
%>
			</font>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td>&nbsp; 
			</td>
			<td>
				<%=fontB1%>(* = Required field)</font>
			</td>
		</tr>
		<tr>
			<td><div align="right"><%=fontB%>*Campus Name:</font></div></td>
			<td width="65%"><input type="text" name="name" size="27" maxlength=100></td>
		</tr>
	<tr <%=bgcolorL%>> 
		<td> 
			<div align="right"><%=fontB%>Campus Address 1:</font></div>
		</td>
		<td>
			<input type="text" name="address1" size="27" maxlength=35>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td> 
			<div align="right"><%=fontB%>Campus Address 2:</font></div>
		</td>
		<td>
			<input type="text" name="address2" size="27" maxlength=35>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td> 
			<div align="right"><%=fontB%>*Campus City:</font></div>
		</td>
		<td>
			<input type="text" name="city" size="27" maxlength=30>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td> 
			<div align="right"><%=fontB%>Campus State:<br>(required if US)</font></div>
		</td>
		<td>
			<%
			states.setName("state");
			%>
			<%=states.print()%>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td> 
			<div align="right"><%=fontB%>Campus ZIP:</font></div>
		</td>
		<td>
			<input type="text" name="zip" size="10" maxlength=10>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td> 
			<div align="right"><%=fontB%>*Campus Country:</font></div>
		</td>
		<td>
			<%
			countries.setName("country");
			%>
			<%=countries.print()%>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td> 
			<div align="right"><%=fontB%>Campus Phone:</font></div>
		</td>
		<td>
			<input type="text" name="phone" size="27" maxlength=24>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td> 
			<div align="right"><%=fontB%>Campus Fax:</font></div>
		</td>
		<td>
			<input type="text" name="fax" size="27" maxlength=24>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td> 
			<div align="right"><%=fontB%>Campus Email:</a></font></div>
		</td>
		<td>
			<input type="text" name="email" size="27" maxlength=50>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td>
			<div align="right"><%=fontB%>Local Level Ministry URL:</a></font></div>
		</td>
		<td>
			<input type="text" name="url" size="27" maxlength=255>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td>
			<div align="right"><%=fontB%>Official School Website URL:</a></font></div>
		</td>
		<td>
			<input type="text" name="infoUrl" size="27" maxlength=255>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td>
			<div align="right"><%=fontB%>Campus Abbreviation:</a></font></div>
		</td>
		<td>
			<input type="text" name="abbrv" size="27" maxlength=50>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td>
			<div align="right"><%=fontB%>Campus Fice:</a></font></div>
		</td>
		<td>
			<input type="text" name="fice" size="27" maxlength=35>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td>
			<div align="right"><%=fontB%>Campus Population:</a></font></div>
		</td>
		<td>
			<input type="text" name="population" size="27" maxlength=35>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td>
			<div align="right"><%=fontB%>Campus Notes:</a></font></div>
		</td>
		<td>
			<input type="text" name="note" size="27" maxlength=1000>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td>
			<div align="right"><%=fontB%>Campus Alternate Name:</a></font></div>
		</td>
		<td>
			<input type="text" name="altName" size="27" maxlength=100>
		</td>
	</tr>

	<tr <%=bgcolorL%>> 
		<td> 
			<div align="right"><%=fontB%>*Is this campus secure/closed? </font></div>
		</td>
		<td><%=fontB%>
			 Yes<input type="radio" name="isSecure" value=true>&nbsp&nbsp No<input type="radio" name="isSecure" value=false>
			</font>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td> 
			<div align="right"><%=fontB%>Campus Region:</font></div>
		</td>
		<td>
			<%
			regions.setName("region");
			%>
			<%=regions.print()%>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td>
			<div align="right"><%=fontB%>Campus MPTA:</a></font></div>
		</td>
		<td>
			<input type="text" name="mpta" size="27" maxlength=35>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td>
			<div align="right"><%=fontB%>Campus AOA:</a></font></div>
		</td>
		<td>
			<input type="text" name="aoa" size="27" maxlength=35>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td>
			<div align="right"><%=fontB%>Campus AOA Priority:</a></font></div>
		</td>
		<td>
			<input type="text" name="aoaPriority" size="27" maxlength=35>
		</td>
	</tr>
	<tr <%=bgcolorL%>> 
		<td>
			<div align="right"><%=fontB%>CIA URL:</a></font></div>
		</td>
		<td>
			<input type="text" name="ciaUrl" size="27" maxlength=255>
		</td>
	</tr>
<%
if(!admin){
%>
	<tr <%=bgcolorL%>> 
		<td>
			<div align="right"><%=fontB%>*Your email address:</a></font></div>
		</td>
		<td>
			<input type="text" name="from" size="27" maxlength=50>
		</td>
	</tr>
<%
} else {
%>
	<input type="hidden" name="from" value="n/a">
<%
}
%>
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" value="<%=admin?"Create New Campus" :"Submit Proposal"%>"></td>
	</tr>


</table>
</form>


<%@ include file="/infobase/ibfooter.jspf" %>
</html>