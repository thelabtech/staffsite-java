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
							Northeast - Lolene Love, Kevin Kimball<br>
							17 Maple St. 2nd Floor<br>
							Danvers, MA 01923<br>
							978-774-7503  ext. 14<br>
							</p>
						<%
				      } else if (_region.equals("ma")) {
						%>
							<p>
							MidAtlantic - Jim Rhodes<br>
							P.O. Box 117 <br>
							Exton, PA 19341<br>
							610-647-3663<br>
							</p>
						<%
				      } else if (_region.equals("ms")) {
						%>
							<p>
							MidSouth -  Beth Wilson<br>
							2186 North Salem Street Ste. 103<br>
							Apex, NC 27523-6459<br>
							919-290-1050<br>
							</p>
						<%
				      } else if (_region.equals("se")) {
						%>
							<p>
							Southeast - Joe Bucha<br>
							1010 Holly Point Way<br>
							Watkinsville, GA 30677<br>
							706-254-7734<br>
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
							Upper Midwest - Ginger Sharp<br>
							2665 4th Ave. N  Ste. 108<br>
							Anoka, MN 55303<br>
							763-323-4339 x113<br>
							</p>
						<%
				      } else if (_region.equals("gp")) {
						%>
							<p>
							Great Plains - Ryan Williams<br>
							726 Front Street, Suite C<br>
							Louisville, CO 80027<br>
							<a href="mailto:Ryan.Williams@uscm.org">Ryan.Williams@uscm.org</a>&nbsp;303-926-3816<br>
							</p>
						<%
				      } else if (_region.equals("rr")) {
						%>
							<p>
							Red River - Laura Choy<br>
							13091 Pond Springs Rd. Ste. D-350<br>
							Austin, TX 78729<br>
							</p>
						<%
				      } else if (_region.equals("nw")) {
						%>
							<p>
							Greater Northwest<br>
							STINT<br>
							Matt Mikalatos<br>
							(360) 635-1100<br>
							<A HREF="mailto:Matthew.Mikalatos@uscm.org">Matthew.Mikalatos@uscm.org</A><br>
							</p>
							<p>
							US Internships<br>
							Anne Huminsky<br>
							(503) 223-2340 x205<br>
							<A HREF="mailto:Anne.Huminsky@uscm.org">Anne.Huminsky@uscm.org</A><br>
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
