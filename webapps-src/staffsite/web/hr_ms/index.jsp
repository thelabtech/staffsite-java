<% 	
	String thePage = "home"; 
	if(request.getParameter("appType") != null && request.getParameter("appType").equals("impact")){
		session.putValue("ssurl", "/hr_si/themes/hr_si_impact.css");
		session.putValue("imgurl", "/hr_ms/images/impactheader.gif");
		session.putValue("hpurl", "http://put an url here");
		session.putValue("appType", "impact");
	}
	
%>
<%@ include file="/hr_ms/homePageHeader.jspf" %>
<%@ page import="org.alt60m.servlet.*" %>
<%
	String msLoginPage = "/servlet/AccountController?action=goToPage&url=/hr_ms/applicant/login.jsp";
	String msRegPage =  "/servlet/AccountController?action=goToPage&page";
	msRegPage += "=register&loginPage=/hr_ms/applicant/login.jsp";
	
%>


&nbsp;<br><STRONG>Welcome to the Summer Projects Online Application.</strong>
<!--<A CLASS="button" HREF="JavaScript:alert('Sorry! Come back after November 1 for the new application!')" CLASS="button">Registration closed until November 1</A>-->
<A CLASS="button" HREF="<%=msLoginPage%>" CLASS="button">Register/Login</A>
<A CLASS="button" HREF="<%=msRegPage%>" CLASS="button">First Time Users</A>
<p>Apply here for an unforgettable summer experience. Join thousands of other college students this summer as they give their summer to God.</p>
 <blockquote>"I gave my summer to God, and He gave me so much more than I could have imagined…"- Matthew Clark, UNC Chapel Hill<br>
"Project has made this summer the most challenging, fun and spiritually rewarding summer of my life." - Mark Vergo, University of Nebraska of Omaha<br>
"I have learned so much about prayer, evangelism and drawing closer to God. This summer prepared me to be a leader…"- Heather Womack, Meredith College</blockquote>

<p>If this is your first visit to the site, please register with us by <A HREF="<%=msRegPage%>"><b>clicking here</b></a>. After you register, you can begin your online application. Before beginning, we suggest you review the Instructions page. </p>
<p>If you need any assistance with our online application process, please <a href="/general/feedback.jsp" target="_blank"><b>contact us</b></a>.

<p>Note: The Summer Project Tool works best with Internet Explorer.  If you are using another browser and are experiencing difficulties, we recommend using Internet Explorer to apply.  If you do not have Internet Explorer on your computer, you can download it <a HREF="http://www.microsoft.com/windows/ie/default.asp" target="_blank"><b>here</b></a>.

<p>If you are using a Mac, you will probably experience problems with the short answer questions.  These problems may prevent the person who reviews your application from being able to read it.  We suggest that you use a PC while filling out the application.  Also, if you are unable to apply online, you can <a href="/wsnsp/pdfforms/summerprojectapplication.pdf" target="_blank"><b>click here</b></a> to download the Summer Project Paper Application.

<%@ include file="/hr_ms/homePageFooter.jspf" %>