<% 	
	String thePage = "home"; 
	if(request.getParameter("appType") != null && request.getParameter("appType").equals("impact")){
		session.putValue("ssurl", "/hr_si/themes/hr_si_impact.css");
		session.putValue("imgurl", "/hr_ms/images/impactheader.gif");
		session.putValue("hpurl", "http://put an url here");
		session.putValue("appType", "impact");
	}
	
%>
<script language="JavaScript"><!--
    var timeOutClockDisabled = 1;
// --></script>
<%@ include file="/hr_si/homePageHeader.jspf" %>
<%@ page import="org.alt60m.servlet.*, org.alt60m.hr.si.servlet.dbio.*" %>
<%
	String siLoginPage = "/servlet/AccountController?action=goToPage&url=/hr_si/applicant/login.jsp";
	String siRegPage = "/servlet/AccountController?action=goToPage&page=register&loginPage=/hr_si/applicant/login.jsp";
%>

<STRONG>Welcome to the <b><%=SIUtil.CURRENT_SI_YEAR_INT%>-<%=SIUtil.CURRENT_SI_YEAR_INT+1%></b> STINT/Internship application!</STRONG>
<P>
Thank you for your interest in joining us on a STINT or Internship!  We welcome your application for the <b><%=SIUtil.CURRENT_SI_YEAR_INT%>-<%=SIUtil.CURRENT_SI_YEAR_INT+1%></b> year. To get started with a new application please register, or if you are returning, just login to access your existing application. 
<BR>

<P><STRONG>The STINT/Internship Application will not be available until November 1st.</STRONG></P>
<!-- 
<A CLASS="button" HREF="<%=siLoginPage%>" CLASS="button">Register/Login</A>
<A CLASS="button" HREF="<%=siRegPage%>" CLASS="button">First Time Users</A>
-->

<P>For more information about a STINT or Internship, please go to our <a href="/hr_si/dbio/contactUs.jsp"><b>Contact Us</b></a> section.  If you have questions about the site, please <a href="/general/feedback.jsp" target="_blank">send us feedback</a> or call 407-826-2948.</font>

<!-- <P>Note: The STINT/Internship Tool works best with Internet Explorer.  If you are using another browser and are experiencing difficulties, we recommend using Internet Explorer to apply.  If you do not have Internet Explorer on your computer, you can download it <a HREF="http://www.microsoft.com/windows/ie/default.asp" target="_blank"><b>here</b></a>. -->

<!-- <P>If you are using a Mac, you will probably experience problems with the short answer questions. These problems may prevent the person who reviews your application from being able to read it. We suggest that you use a PC while filling out the application. --> 

<%@ include file="/hr_si/homePageFooter.jspf" %>
