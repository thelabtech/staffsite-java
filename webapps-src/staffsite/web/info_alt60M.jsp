<HTML>
<HEAD>
<TITLE>Feedback</TITLE>
<% int curr_tab = 1; %>
<% String pageTitle = "&nbsp;";%>
<%@ include file="/header.jspf" %>

<% box.setStyle("rounded");	//will set it for all the following boxes until we call it again
 box.setTitle("Send Us Feedback");	
 box.setColor(color2);
 box.setBodyColor(color2); %>

<%=box.printTop()%>

<basefont size=2 face="verdana,arial,helvetica, sans-serif">
<table width="755" Border=0 cellpadding=5 cellspacing=5>
	<tr>
		<td>
		  <%=font3%>Email suggestions and feedback to us at:<br><BR>
		  <a href="mailto:help@campuscrusadeforchrist.com"><%=font3%>help@campuscrusadeforchrist.com</font></a><br><br>
		  <font size=2>*Please include the name of the page or the section of the site you are commenting&nbsp;on.<br><br>
		  <font size=2>Thank you.<br>		  
		</td>
	</tr>
</table>

<%=box.printBottom()%>
<p>

<% box.setStyle("classic");	//will set it for all the following boxes until we call it again%>
<% box.setTitle("");	%>
<% box.setColor(color2);	%>
<%=box.printTop()%>

  <table border="0" cellspacing=1 cellspacing=1>
	<tr>
		<td <%=bgcolorL%>>
    <table cellpadding=5 cellspacing=5>
		<tr>
			<td>
	  <%=font%>
	  <i>This site was produced by the Information Solutions Team of the Campus Ministry.</i><p>
	  <h3>Design Philosophy</h3>
	  <b>Compatibility</b>: This site was developed to work on the vast majority of browsers that are being used today. Specifically, 
	   Internet Explorer 5.0-5.5 and Netscape Navigator 4.x-4.08. You can download these recommended browsers here :<br>
   	  <center><a href="http://www.netscape.com/download/index.html"><img src="/images/netscape.gif" border=1></a>
	  <a href="http://www.microsoft.com/ie/download"><img src="/images/ie.gif" border=1></a></center><p>
	   <b>Ease of Use</b>: The easiest, most efficient way of doing things is always kept as a design objective. If you have 
	   any suggestions of how we can make this site easier to use (or more pleasant), please let us know. <p>
	   <b>Stability</b>: We don't like bugs. We want to do everything possible to make certain that our&nbsp;systems and solutions 
	   work -- and continue working.<p>
	   <b>Productivity</b>: We are about producing information solutions that make our 
		ministry more effective. With both the Internet and the Campus Ministry 
		changing and growing rapidly, we may need to introduce a solution that 
		isn't perfect so increased effectiveness can be realized. This may 
		cause our sites to adapt and change more often than other sites you may 
		be familiar with. <p>
	   <b>Integration</b>: We leverage existing systems -- both our own and our partner's systems. We don't relish the idea 
	   of reinventing the wheel and we understand efficiency (and thus effectiveness) diminishes with the addition of redundant systems.<p>
	   <b>Innovation</b>: We're not afraid to think out of the box. Perhaps the solution to increasing&nbsp;effectiveness is to write a note on a piece of cardboard. Perhaps, we may need to 
	   implement a multi-national, broadband eBusiness solution to increase&nbsp;effectiveness. We want to do what it takes to reach the 
	   60 million. So don't be afraid to shoot us an e-mail containing your wildest, most innovative, off-the-wall ideas, either.<p>
		</font>
	</td></tr></table>
  </td></tr></table>

<%=box.printBottom()%>

<br>
<%@ include file="/footer.jspf" %>
</body>
</html>
