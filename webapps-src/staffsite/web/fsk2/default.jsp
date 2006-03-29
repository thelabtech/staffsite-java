<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        
<%-- Include common set of tag library declarations for each layout --%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <title><decorator:title/> | FSK Ordering Tool</title>
        
        <decorator:head/>
    </head>
<body<decorator:getProperty property="body.id" writeEntireProperty="true"/>>

        <div id="header">
        	This is a pretend connexion bar
            <%--jsp:include page="/common/header.jsp"/--%>
        </div>

        <div id="content">
            <decorator:body/>
        </div>
        
        <div id="footer">
        	This is a pretend footer
            <%--jsp:include page="/common/footer.jsp"/--%>
        </div>
    </div>
</body>
</html>
