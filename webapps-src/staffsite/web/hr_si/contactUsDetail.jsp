<%
	String _region = request.getParameter("region");
	String _regionName = request.getParameter("regionName");
%>
<html>
<head>
<title><%=_regionName%> Contact Info</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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
				  <tr align=center><td><font face="Arial, Verdana, helvetica, sans-serif" size="3"><b><%=_regionName%> Contact Information</b></font></td></tr>
                    <tr align=center valign=top>
                      <td><font face="Arial, Verdana, helvetica, sans-serif">
					  <%
					  if (_region.equals("ne")) {
						%>
							<p>
							Kevin Kimball<br>
							Campus Crusade for Christ - Northeast Regional Headquarters<br>
							10 Milk Street, Suite #320<br>
							Boston, MA 02108<br>
							(617) 338-4033, ext. 14 (office)<br>
							(603) 674-8412 (cell)<br>
							<A HREF="mailto:Kevin.Kimball@uscm.org">Kevin.Kimball@uscm.org</A><br>
							</p>
						<%
				      } else if (_region.equals("ma")) {
						%>
							<p>
							MidAtlantic - Jim Rhodes<br>
							Campus Crusade for Christ<br>
							P.O. Box 117 <br>
							Exton, PA 19341<br>
							(610) 524-2193<br>
							<A HREF="mailto:Jim.Rhodes@uscm.org">Jim.Rhodes@uscm.org</A><br>
							</p>
						<%
				      } else if (_region.equals("ms")) {
						%>
							<p>
							MidSouth -  Beth Wilson<br>
							2186 North Salem Street Ste. 103<br>
							Apex, NC 27523-6459<br>
							919-290-1050<br>
							<A HREF="mailto:midsouthinternships@uscm.org">midsouthinternships@uscm.org</A><br>
							</p>
						<%
				      } else if (_region.equals("se")) {
						%>
							<p>
							Southeast - Ashley Jenkins<br>
							120 Interstate North Pkwy Ste 455<br>
							Atlanta, GA 30339<br>
							<a 
							href="mailto:Ashley.Jenkins@uscm.org">Ashley.Jenkins@uscm.org</a>&nbsp;(770) 434-1004 x23<br>
							</p>
						<%
				      } else if (_region.equals("gl")) {
						%>
							<p>
							Great Lakes - Scott Santee<br>
							8383 Craig St., Suite 320<br>
							Indianapolis, IN 46250<br>
							<a href="mailto:Scott.Santee@uscm.org">Scott.Santee@uscm.org</a>&nbsp;317.841.8001x228<br>
							</p>
						<%
				      } else if (_region.equals("um")) {
						%>
							<p>
							Upper Midwest - Jason Gibson<br>
							1021 Hennepin Ave. Ste. 300<br>
							Minneapolis, MN 55403<br>
							(612) 339-5228 x113<br>
							<a href="mailto:Jason.Gibson@uscm.org">Jason.Gibson@uscm.org</a><br>
							</p>
						<%
				      } else if (_region.equals("gp")) {
						%>
							<p>
							Great Plains - Allyson Davies<br>
							5485 Conestoga Ct, Suite 230<br>
							Boulder, CO 80301<br>
							<a href="mailto:Allyson.Davies@uscm.org">Allyson.Davies@uscm.org</a>&nbsp;303-926-3800 ext.3827<br>
							</p>
						<%
				      } else if (_region.equals("rr")) {
						%>
							<p>
							Red River<br>
							12012 Technology Blvd, Suite 100<br>
							Austin, TX 78729<br>
							</p>
							<p>
							STINT<br>
							Mark Kohman<br>
							(512) 615-2508
							<A HREF="mailto:Mark.Kohman@uscm.org">Mark.Kohman@uscm.org</A><br>
							</p>
							<p>
							US Internships<br>
							Carolyn Raye<br>
							<A HREF="mailto:Carolyn.Raye@uscm.org">Carolyn.Raye@uscm.org</A><br>
							</p>
						<%
				      } else if (_region.equals("nw")) {
						%>
							<p>
							Greater Northwest<br>
							1331 SE Tacoma St Ste200<br>
							Portland, OR 97202<br>
							</p>
							<p>
							STINT<br>
							Matt Mikalatos<br>
							(360) 635-1100<br>
							<A HREF="mailto:Matthew.Mikalatos@uscm.org">Matthew.Mikalatos@uscm.org</A><br>
							</p>
							<p>
							US Internships<br>
							John Rygh<br>
							(503) 223-2340 x206<br>
							<A HREF="mailto:John.Rygh@uscm.org">John.Rygh@uscm.org</A><br>
							</p>
						<%
				      } else if (_region.equals("sw")) {
						%>
							<p>
							Pacific SouthWest - John Broesamle<br>
							16 Technology Dr. Ste. 205<br>
							Irvine, CA 92618<br>
							949-788-0100<br>
							</p>
						<%
					  }
					  %>
					  </font></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
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
