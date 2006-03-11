<%@ page language="java" contentType="text/html" import="javax.xml.transform.*, java.net.*, javax.xml.transform.stream.*"%>

<!-- saved from url=(0022)http://internet.e-mail -->
<html>
<head>
<title>Welcome to the LincZone</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<SCRIPT LANGUAGE=JAVASCRIPT TYPE="TEXT/JAVASCRIPT">
<!--

function updateParent() {
    opener.document.Info.campusname.value = document.entercampus.campusname.value;
	opener.document.Info.campusid.value = '';
    self.close();
    return false;
}
function updateParent2(campusname, campusid) {
    opener.document.Info.campusname.value = campusname;
	opener.document.Info.campusid.value = campusid;
    self.close();
    return false;
}

function makeMonthArray() {this.length=12;
        this[1] = "January", this[2] = "February"; this[3] = "March"; 
        this[4] = "April", this[5] = "May"; this[6] = "June";
        this[7] = "July", this[8] = "August"; this[9] = "September"; 
        this[10] = "October", this[11] = "November"; this[12] = "December"; 
return(this);
}
function makeDayArray() { 
this.length=7;
        this[1] = "Sunday", this[2] = "Monday"; this[3] = "Tuesday";
        this[4] = "Wednesday", this[5] = "Thursday"; this[6] = "Friday"; 
        this[7] = "Saturday"; 
return(this);
}
function writeDate() { 
        attdate = new Date();
        monthName = new makeMonthArray();
        dayName = new makeDayArray();
        day = attdate.getDay() + 1;
        date = attdate.getDate();
        month = attdate.getMonth() + 1;
       year = attdate.getYear();
        sec = attdate.getSeconds()
        if (90 <=year && year < 2000) { 
                year = 1900 + year;
        } 
		dateStr = dayName[day];
        dateStr += ", "; 
		dateStr += monthName[month];
        dateStr += " "; 
        dateStr += date; 
        dateStr += ", "; 
        dateStr += year;
document.write(dateStr);
}
//-->
</script>
<script language="JavaScript">
<!--
function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') {
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (val<min || max<val) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>
</head>
<body bgcolor="#ff6600" text="#000033" link="#ff6600">
<table width="450" border="0" cellpadding="0" background="http://208.156.111.80/linczone/images/cellbg2.gif" align="center">
  <tr> 
    <td> 
      <table width="400" border="0" cellpadding="0" align="center">
        <tr> 
          <td valign="top"> 
            <table border="0" cellpadding="0" cellspacing="0" width="400">
              <tr align=center valign=top> 
                <td align=center valign=top width="557"> 
                  <div align="left"><a href="/index.htm"><img src="http://www.linczone.com/images03/lzlogo.gif" border="0"></a><br>
                  </div>
                  <div align="right"><font face="verdana" size="1" color="#000033"> 
                    </font></div>
                  <br>
                  <table border="0" cellpadding="0" cellspacing="0" width="400" align="center">
                    <tr align=left valign=top> 
                      <td><font face="Arial, Verdana, helvetica, sans-serif" size="3"><b>Select 
                        State</b></font></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
			<FORM NAME="selectcampus" METHOD=POST ACTION="/campuslist.jsp">

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
		//String url = "file:///C:/Program Files/Apache Tomcat 4.0/webapps/linczone/MinistryLocatorController.xml";
		String url = "http://www.linczone.com/servlet/MinistryLocatorController?action=campusLocate&searchby=state&searchtext="+request.getParameter("state");

		URL xmlUrl = new URL(url);
		Source xsl = new StreamSource(getServletContext().getRealPath("/linczone/campuslist.xsl"));
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
            <center>
              <img src="http://208.156.111.80/linczone/images/smlogo.gif" width="35" height="27" border="0"><br>
              <font color="#666666" size=1>&copy;2003, LINCZone.</font> 
            </center>
          </td>
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
