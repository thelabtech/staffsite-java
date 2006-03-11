<%@ page import="java.util.*" %>
<% 
	Hashtable tub = (Hashtable)session.getValue("tub"); 
%>

<HTML>
<HEAD>
<TITLE>Submit a Resource</TITLE>
</HEAD>

<% String pageTitle = "Submit a resource"; %>
<%@ include file="/cms/cmsheadersmall.jspf"%>
<p>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="3" CELLSPACING="0">
    <TR>
		<TD ALIGN="CENTER" COLSPAN="2">
			<%=fontB%>You have selected the file<BR><%=fontB%><B>"<%=tub.get("FileName") %>"</B></FONT>.</FONT>
		</TD>
	</TR>
    <TR>
        <TD ALIGN="CENTER" COLSPAN="2">
            <%=fontB%>
			<%                
                if ((String)tub.get("FileType")!=null){
					%>
                    This resource is of type <B><U><%=fontB%><%=tub.get("FileType")%></FONT></U></B>.
					<%
                } 
                else{
					%><%=fontR%>The resource has a type that is not recognized by our server. You can e-mail <A HREF="mailto:systems.feedback@uscm.org?subject=Add_file_extension_for_Resource_Center">systems.feedback@uscm.org</A> with the extension of your file if you believe that it should be added to the Resource Center valid filetypes otherwise Please click back and re-select the file.</FONT><%
                }
			%>
            </FONT>
        </TD>
    </TR>
    <TR>
		<form name=goon action="/servlet/CmsController" method="post">
		<input type=hidden name=page value="/cms/fileform.jsp">
		<input type=hidden name=filename value="<%=tub.get("FileName")%>">
        <TD ALIGN="LEFT" VALIGN="CENTER"><A HREF="JavaScript: history.go(-1)" onMouseOver="document.backbutton.src='/cms/images/back_bon.gif';" onMouseOut="document.backbutton.src='/cms/images/back_boff.gif';"><IMG  NAME="backbutton" SRC="/cms/images/back_boff.gif" BORDER="0" ALIGN="TOP"></A></TD>
        <TD ALIGN="RIGHT" VALIGN="CENTER">
			<%
				if((String)tub.get("FileType")!=null){
					%>
					<A HREF="javascript:document.goon.submit()" onMouseOver="document.nextbutton.src='/cms/images/next_bon.gif';" onMouseOut="document.nextbutton.src='/cms/images/next_boff.gif';"><IMG  NAME="nextbutton" SRC="/cms/images/next_boff.gif" BORDER="0" ALIGN="TOP"></A>
					<%
				}
			%>
		</TD>
		</form>
    </TR>
</TABLE>
<%@ include file="/footer.jspf" %>
</BODY>
</HTML>