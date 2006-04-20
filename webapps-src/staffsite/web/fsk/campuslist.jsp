<%@ page import="org.alt60m.servlet.*, javax.xml.transform.*, java.net.*, java.util.*, javax.xml.transform.stream.*"%>

<html>
<!-- saved from url=(0022)http://internet.e-mail -->
<head>
<title>Conference Campus Selector</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<SCRIPT LANGUAGE=JAVASCRIPT TYPE="TEXT/JAVASCRIPT">
<!--

function updateParent() {
    opener.document.myForm.CampusName.value = document.entercampus.campusname.value;
    self.close();
    return false;
}
function updateParent2(campusname) {
    opener.document.myForm.CampusName.value = campusname;
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
			<FORM NAME="selectcampus" METHOD=POST ACTION="campuslist.jsp">

	   <select name=state>
        <option value="" selected>Choose State</option>
        <option value="AL">Alabama </option>
        <option value="AK">Alaska </option>
        <option value="AZ">Arizona </option>
        <option value="AR">Arkansas </option>
        <option value="CA">California </option>
        <option value="CO">Colorado </option>
        <option value="CT">Connecticut </option>
        <option value="DE">Delaware </option>
        <option value="FL">Florida </option>
        <option value="GA">Georgia </option>
        <option value="HI">Hawaii </option>
        <option value="ID">Idaho </option>
        <option value="IL">Illinois </option>
        <option value="IN">Indiana </option>
        <option value="IA">Iowa </option>
        <option value="KS">Kansas </option>
        <option value="KY">Kentucky </option>
        <option value="LA">Louisiana </option>
        <option value="ME">Maine </option>
        <option value="MD">Maryland </option>
        <option value="MA">Massachusetts </option>
        <option value="MI">Michigan </option>
        <option value="MN">Minnesota </option>
        <option value="MS">Mississippi </option>
        <option value="MO">Missouri </option>
        <option value="MT">Montana </option>
        <option value="NE">Nebraska </option>
        <option value="NV">Nevada </option>
        <option value="NH">New Hampshire </option>
        <option value="NJ">New Jersey </option>
        <option value="NM">New Mexico </option>
        <option value="NY">New York </option>
        <option value="NC">North Carolina </option>
        <option value="ND">North Dakota </option>
        <option value="OH">Ohio </option>
        <option value="OK">Oklahoma </option>
        <option value="OR">Oregon </option>
        <option value="PA">Pennsylvania </option>
        <option value="RI">Rhode Island </option>
        <option value="SC">South Carolina </option>
        <option value="SD">South Dakota </option>
        <option value="TN">Tennessee </option>
        <option value="TX">Texas </option>
        <option value="UT">Utah </option>
        <option value="VT">Vermont </option>
        <option value="VA">Virginia </option>
        <option value="WA">Washington </option>
        <option value="DC">Washington D.C. </option>
        <option value="WV">West Virginia </option>
        <option value="WI">Wisconsin </option>
        <option value="WY">Wyoming </option>
		</select>

		<INPUT TYPE="submit" NAME="submit" value="Search">
		</FORM>
<%

	String state = request.getParameter("state");
	if(state!=null && !state.equals("")) {
//		String url = "https://" + request.getServerName() + "/servlet/CRSRegister?action=campusLocate&searchtext="+request.getParameter("state");
		String url = "http://" + request.getServerName() + "/servlet/CRSRegister?action=campusLocate&searchtext="+request.getParameter("state");

		URL xmlUrl = new URL(url);
		Source xsl = new StreamSource(this.getServletConfig().getServletContext().getRealPath("/fsk/campuslist.xsl"));
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
 	<!-- Begin Google Analytics code -->
	<script src="/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-79392-3";
	urchinTracker();
	</script>
	<!-- End Google Analytics code -->
</body>
</html>
