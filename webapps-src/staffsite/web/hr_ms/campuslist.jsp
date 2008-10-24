<%@ page import="org.alt60m.servlet.*, javax.xml.transform.*, java.net.*, java.util.*, javax.xml.transform.stream.*"%>
<% String state = request.getParameter("state"); %>
<html>
<!-- saved from url=(0022)http://internet.e-mail -->
<head>
<title>Campus Selector</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<SCRIPT LANGUAGE=JAVASCRIPT TYPE="TEXT/JAVASCRIPT">
<!--

function updateParent() {
    opener.document.appForm.UniversityFullName.value = document.entercampus.campusname.value;
    opener.document.appForm.UniversityState.value = '<%=state%>';
    self.close();
    return false;
}
function updateParent2(campusname) {
    opener.document.appForm.UniversityFullName.value = campusname;
    opener.document.appForm.UniversityState.value = '<%=state%>';
    self.close();
}

//-->
</script>
</head>


<body bgcolor="#FFFFFF" text="#000033" link="#ff6600">
<table width="450" border="0" cellpadding="0" align="center">
  <tr>
    <td>
      <table width="400" border="0" cellpadding="0" align="center">
        <tr>
          <td valign="top">
            <table border="0" cellpadding="0" cellspacing="0" width="400">
              <tr align=center valign=top>
                <td align=center valign=top width="557">

                  <table border="0" cellpadding="0" cellspacing="0" width="400" align="center">
				  <tr align=center><td>Use this window to select your campus</td></tr>
                    <tr align=center valign=top>
                      <td><font face="Arial, Verdana, helvetica, sans-serif" size="3"><b>Select Your State:</b></font></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
			<form name="selectcampus" method="post" action="campuslist.jsp">

	   <select name=state>
        <option value="">Choose State</option>
        <option value="AL"<%=state.equalsIgnoreCase("al")?" selected=\"selected\"":""%>>Alabama </option>
        <option value="AK"<%=state.equalsIgnoreCase("ak")?" selected=\"selected\"":""%>>Alaska </option>
        <option value="AZ"<%=state.equalsIgnoreCase("az")?" selected=\"selected\"":""%>>Arizona </option>
        <option value="AR"<%=state.equalsIgnoreCase("ar")?" selected=\"selected\"":""%>>Arkansas </option>
        <option value="CA"<%=state.equalsIgnoreCase("ca")?" selected=\"selected\"":""%>>California </option>
        <option value="CO"<%=state.equalsIgnoreCase("co")?" selected=\"selected\"":""%>>Colorado </option>
        <option value="CT"<%=state.equalsIgnoreCase("ct")?" selected=\"selected\"":""%>>Connecticut </option>
        <option value="DE"<%=state.equalsIgnoreCase("de")?" selected=\"selected\"":""%>>Delaware </option>
        <option value="FL"<%=state.equalsIgnoreCase("fl")?" selected=\"selected\"":""%>>Florida </option>
        <option value="GA"<%=state.equalsIgnoreCase("ga")?" selected=\"selected\"":""%>>Georgia </option>
        <option value="HI"<%=state.equalsIgnoreCase("hi")?" selected=\"selected\"":""%>>Hawaii </option>
        <option value="ID"<%=state.equalsIgnoreCase("id")?" selected=\"selected\"":""%>>Idaho </option>
        <option value="IL"<%=state.equalsIgnoreCase("il")?" selected=\"selected\"":""%>>Illinois </option>
        <option value="IN"<%=state.equalsIgnoreCase("in")?" selected=\"selected\"":""%>>Indiana </option>
        <option value="IA"<%=state.equalsIgnoreCase("ia")?" selected=\"selected\"":""%>>Iowa </option>
        <option value="KS"<%=state.equalsIgnoreCase("ks")?" selected=\"selected\"":""%>>Kansas </option>
        <option value="KY"<%=state.equalsIgnoreCase("ky")?" selected=\"selected\"":""%>>Kentucky </option>
        <option value="LA"<%=state.equalsIgnoreCase("la")?" selected=\"selected\"":""%>>Louisiana </option>
        <option value="ME"<%=state.equalsIgnoreCase("me")?" selected=\"selected\"":""%>>Maine </option>
        <option value="MD"<%=state.equalsIgnoreCase("md")?" selected=\"selected\"":""%>>Maryland </option>
        <option value="MA"<%=state.equalsIgnoreCase("ma")?" selected=\"selected\"":""%>>Massachusetts </option>
        <option value="MI"<%=state.equalsIgnoreCase("mi")?" selected=\"selected\"":""%>>Michigan </option>
        <option value="MN"<%=state.equalsIgnoreCase("mn")?" selected=\"selected\"":""%>>Minnesota </option>
        <option value="MS"<%=state.equalsIgnoreCase("ms")?" selected=\"selected\"":""%>>Mississippi </option>
        <option value="MO"<%=state.equalsIgnoreCase("mo")?" selected=\"selected\"":""%>>Missouri </option>
        <option value="MT"<%=state.equalsIgnoreCase("mt")?" selected=\"selected\"":""%>>Montana </option>
        <option value="NE"<%=state.equalsIgnoreCase("ne")?" selected=\"selected\"":""%>>Nebraska </option>
        <option value="NV"<%=state.equalsIgnoreCase("nv")?" selected=\"selected\"":""%>>Nevada </option>
        <option value="NH"<%=state.equalsIgnoreCase("nh")?" selected=\"selected\"":""%>>New Hampshire </option>
        <option value="NJ"<%=state.equalsIgnoreCase("nj")?" selected=\"selected\"":""%>>New Jersey </option>
        <option value="NM"<%=state.equalsIgnoreCase("nm")?" selected=\"selected\"":""%>>New Mexico </option>
        <option value="NY"<%=state.equalsIgnoreCase("ny")?" selected=\"selected\"":""%>>New York </option>
        <option value="NC"<%=state.equalsIgnoreCase("nc")?" selected=\"selected\"":""%>>North Carolina </option>
        <option value="ND"<%=state.equalsIgnoreCase("nd")?" selected=\"selected\"":""%>>North Dakota </option>
        <option value="OH"<%=state.equalsIgnoreCase("oh")?" selected=\"selected\"":""%>>Ohio </option>
        <option value="OK"<%=state.equalsIgnoreCase("ok")?" selected=\"selected\"":""%>>Oklahoma </option>
        <option value="OR"<%=state.equalsIgnoreCase("or")?" selected=\"selected\"":""%>>Oregon </option>
        <option value="PA"<%=state.equalsIgnoreCase("pa")?" selected=\"selected\"":""%>>Pennsylvania </option>
        <option value="RI"<%=state.equalsIgnoreCase("ri")?" selected=\"selected\"":""%>>Rhode Island </option>
        <option value="SC"<%=state.equalsIgnoreCase("sc")?" selected=\"selected\"":""%>>South Carolina </option>
        <option value="SD"<%=state.equalsIgnoreCase("sd")?" selected=\"selected\"":""%>>South Dakota </option>
        <option value="TN"<%=state.equalsIgnoreCase("tn")?" selected=\"selected\"":""%>>Tennessee </option>
        <option value="TX"<%=state.equalsIgnoreCase("tx")?" selected=\"selected\"":""%>>Texas </option>
        <option value="UT"<%=state.equalsIgnoreCase("ut")?" selected=\"selected\"":""%>>Utah </option>
        <option value="VT"<%=state.equalsIgnoreCase("vt")?" selected=\"selected\"":""%>>Vermont </option>
        <option value="VA"<%=state.equalsIgnoreCase("va")?" selected=\"selected\"":""%>>Virginia </option>
        <option value="WA"<%=state.equalsIgnoreCase("wa")?" selected=\"selected\"":""%>>Washington </option>
        <option value="DC"<%=state.equalsIgnoreCase("dc")?" selected=\"selected\"":""%>>Washington D.C. </option>
        <option value="WV"<%=state.equalsIgnoreCase("wv")?" selected=\"selected\"":""%>>West Virginia </option>
        <option value="WI"<%=state.equalsIgnoreCase("wi")?" selected=\"selected\"":""%>>Wisconsin </option>
        <option value="WY"<%=state.equalsIgnoreCase("wy")?" selected=\"selected\"":""%>>Wyoming </option>
		</select>

		<INPUT TYPE="submit" NAME="submit" value="Search">
		</FORM>
<%
	if(state!=null && !state.equals("")) {
		String scheme;
		if (request.getServerName().contains("campuscrusadeforchrist.com"))
		{
			scheme = "https";
		}
		else {
			scheme = "http";
		}
		String url = scheme + "://" + request.getServerName() + "/servlet/CRSRegister?action=campusLocate&searchtext="+request.getParameter("state");

		URL xmlUrl = new URL(url);
		Source xsl = new StreamSource(this.getServletConfig().getServletContext().getRealPath("/hr_ms/campuslist.xsl"));
		Source xml = new StreamSource(xmlUrl.toExternalForm());

		System.setProperty("javax.xml.transform.TransformerFactory", "com.sun.org.apache.xalan.internal.xsltc.trax.TransformerFactoryImpl");  //Needed for JDK 1.5.0
		TransformerFactory tFactory = TransformerFactory.newInstance();
		Transformer transformer = tFactory.newTransformer(xsl);
		transformer.transform(xml, new StreamResult(out));
%>
		Don't see your campus?
		<FORM METHOD=POST NAME="entercampus" onSubmit="return updateParent();">
		<INPUT size=40 NAME="campusname">
              <INPUT TYPE="submit" value="Enter" >
		</FORM>
<%
	}
%>
        </tr>
      </table>
    </td>
  </tr>
</table>
<%@ include file="/headers/google_analytics.jspf"%>
</body>
</html>
