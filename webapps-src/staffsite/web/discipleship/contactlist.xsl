<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="contactList">
  <style>
  TD {
	font-size: 10;
	padding: 2px;
  }
  TH {
	font-size: 10;
	padding: 2px;
  }
  </style>
  
    <table border="1" width="100%">
      <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Phone Number</th>
        <th>Email Address</th>
	<th>Address</th>
	<th>Address (cont)</th>
	<th>Residence</th>
	<th>City</th>
	<th>State</th>
	<th>Zip</th>
	<th>Gender</th>
	<th>Campus</th>
	<th>Level of Discipleship</th>
	<th>Year in School</th>
	<th>Type of Contact</th>
	<th></th>
      </tr>
      <xsl:for-each select="contact">
	  <xsl:sort select="lastname" data-type="text" order = "ascending"/> 
		  <xsl:variable name="discipledby">
		    <xsl:value-of select="discipledby"/>
		  </xsl:variable>
		  <xsl:variable name="surferaccountno">
		    <xsl:value-of select="surferaccountno"/>
		  </xsl:variable>
		<tr>
		  <td>
			<xsl:value-of select="firstname"/>
		  </td>
		  <td>
			<xsl:value-of select="lastname"/>
		  </td>
		  <td>
			<xsl:value-of select="phonenumber"/>
		  </td>
		  <td>
			<xsl:value-of select="emailaddress"/>
		  </td>
		  <td>
			<xsl:value-of select="address1"/>
		  </td>
		  <td>
			<xsl:value-of select="address2"/>
		  </td>
		  <td>
			<xsl:value-of select="residence"/>
		  </td>
		  <td>
			<xsl:value-of select="city"/>
		  </td>
		  <td>
			<xsl:value-of select="state"/>
		  </td>
		  <td>
			<xsl:value-of select="zip"/>
		  </td>
		  <td>
			<xsl:value-of select="gender"/>
		  </td>
		  <td>
			<xsl:value-of select="campus"/>
		  </td>
		  <td>
			<xsl:value-of select="levelofdiscipleship"/>
		  </td>
		  <td>
			<xsl:value-of select="yearinschool"/>
		  </td>
		  <td>
			<xsl:value-of select="typeofcontact"/>
		  </td>
		  <td>
			<xsl:value-of select="note"/>
		  </td>
		  <td>
			<xsl:if test="not($discipledby=$surferaccountno)">
				<xsl:element name="form">
					<xsl:attribute name="action">
						 <xsl:text>/servlet/DiscipleshipController?action=addContactToMe</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="method">
						 <xsl:text>POST</xsl:text>
					</xsl:attribute>
					<xsl:element name="INPUT">
						<xsl:attribute name="TYPE">
							 <xsl:text>hidden</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="NAME">
							 <xsl:text>ContactId</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="VALUE">
							<xsl:value-of select="@id"/>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="INPUT">
						<xsl:attribute name="TYPE">
							 <xsl:text>submit</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="VALUE">
							 <xsl:text>Add contact to my list</xsl:text>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:if>
		<xsl:element name="br"></xsl:element>
			<xsl:element name="form">
				<xsl:attribute name="action">
					 <xsl:text>/discipleship/index.jsp</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="method">
					 <xsl:text>GET</xsl:text>
				</xsl:attribute>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>hidden</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="NAME">
						 <xsl:text>ContactId</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						<xsl:value-of select="@id"/>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>hidden</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="NAME">
						 <xsl:text>view</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						 <xsl:text>addContact</xsl:text>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>hidden</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="NAME">
						 <xsl:text>action</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						 <xsl:text>editContact</xsl:text>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>submit</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						 <xsl:text>Edit Contact</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
		<xsl:element name="br"></xsl:element>
			<xsl:element name="form">
				<xsl:attribute name="action">
					 <xsl:text>/discipleship/index.jsp</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="method">
					 <xsl:text>GET</xsl:text>
				</xsl:attribute>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>hidden</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="NAME">
						 <xsl:text>ContactId</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						<xsl:value-of select="@id"/>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>hidden</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="NAME">
						 <xsl:text>view</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						 <xsl:text>viewContactDetail</xsl:text>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>hidden</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="NAME">
						 <xsl:text>action</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						 <xsl:text>editContact</xsl:text>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>submit</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						 <xsl:text>View Contact Detail</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
		  </td>
	        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>
