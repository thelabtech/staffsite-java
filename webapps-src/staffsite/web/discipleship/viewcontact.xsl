<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="contact">
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
	<h1>Contact</h1>
    <table border="1" width="100%">
      <tr>
        <td>First Name</td>
	<td>
		<xsl:value-of select="firstname"/>
	</td>
      <tr>
      </tr>
        <td>Last Name</td>
	<td>
		<xsl:value-of select="lastname"/>
	</td>
      <tr>
      </tr>
        <td>Phone Number</td>
	<td>
		<xsl:value-of select="phonenumber"/>
	</td>
      <tr>
      </tr>
        <td>Email Address</td>
	<td>
		<xsl:value-of select="emailaddress"/>
	</td>
      <tr>
      </tr>
	<td>Address</td>
	<td>
		<xsl:value-of select="address1"/>
	</td>
      <tr>
      </tr>
	<td>Address (cont)</td>
	<td>
		<xsl:value-of select="address2"/>
	</td>
      <tr>
      </tr>
	<td>Residence</td>
	<td>
		<xsl:value-of select="residence"/>
	</td>
      <tr>
      </tr>
	<td>City</td>
	<td>
		<xsl:value-of select="city"/>
	</td>
      <tr>
      </tr>
	<td>State</td>
	<td>
		<xsl:value-of select="state"/>
	</td>
      <tr>
      </tr>
	<td>Zip</td>
	<td>
		<xsl:value-of select="zip"/>
	</td>
      <tr>
      </tr>
	<td>Gender</td>
	<td>
		<xsl:value-of select="gender"/>
	</td>
      <tr>
      </tr>
	<td>Marital Status</td>
	<td>
		<xsl:value-of select="maritalstatus"/>
	</td>
      <tr>
      </tr>
	<td>Campus</td>
	<td>
		<xsl:value-of select="campus"/>
	</td>
      <tr>
      </tr>
	<td>Level of Discipleship</td>
	<td>
		<xsl:value-of select="levelofdiscipleship"/>
	</td>
      <tr>
      </tr>
	<td>Year in School</td>
	<td>
		<xsl:value-of select="yearinschool"/>
	</td>
      <tr>
      </tr>
	<td>Birth Date</td>
	<td>
		<xsl:value-of select="birthdate"/>
	</td>
      <tr>
      </tr>
	<td>Date Became Believer</td>
	<td>
		<xsl:value-of select="datebecamebeliever"/>
	</td>
      <tr>
      </tr>
	<td>Primary Spiritual Gift</td>
	<td>
		<xsl:value-of select="primaryspiritualgift"/>
	</td>
      <tr>
      </tr>
	<td>Secondary Spiritual Gift</td>
	<td>
		<xsl:value-of select="secondaryspiritualgift"/>
	</td>
      <tr>
      </tr>
	<td>Tertiary Spiritual Gift</td>
	<td>
		<xsl:value-of select="tertiaryspiritualgift"/>
	</td>
      <tr>
      </tr>
	<td>Type of Contact</td>
	<td>
		<xsl:value-of select="typeofcontact"/>
	</td>
      <tr>
      </tr>
	<td>Date Added</td>
	<td>
		<xsl:value-of select="dateadded"/>
	</td>
      <tr>
      </tr>
	<td>Note</td>
	<td>
		<xsl:value-of select="note"/>
	</td>
      <tr>
      </tr>
	<td>Discipled By</td>
	<td>
		<xsl:value-of select="discipledby"/>
	</td>
      </tr>
    </table>
	<xsl:element name="p"></xsl:element>
	<h2>Calls 		
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
					<xsl:value-of select="id"/>
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
					 <xsl:text>addCall</xsl:text>
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
					 <xsl:text>editCall</xsl:text>
				</xsl:attribute>
			</xsl:element>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>submit</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						 <xsl:text>Log Call</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
</h2>
    <table border="1" width="100%">
      <tr>
        <th>Date of call</th>
        <th>Note</th>
	<th></th>
      </tr>
      <xsl:for-each select="call">
	<tr>
	  <td>
		<xsl:value-of select="dateofcall"/>
	  </td>
	  <td>
		<xsl:value-of select="note"/>
	  </td>
	  <td>
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
					 <xsl:text>CallId</xsl:text>
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
					 <xsl:text>addCall</xsl:text>
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
					 <xsl:text>editCall</xsl:text>
				</xsl:attribute>
			</xsl:element>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>submit</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						 <xsl:text>Edit Call</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
		  </td>
	        </tr>
      </xsl:for-each>
    </table>
	<xsl:element name="p"></xsl:element>
	<h2>Schedule 		
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
					<xsl:value-of select="id"/>
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
					 <xsl:text>addSchedule</xsl:text>
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
					 <xsl:text>editSchedule</xsl:text>
				</xsl:attribute>
			</xsl:element>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>submit</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						 <xsl:text>Add Day</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
</h2>
    <table border="1" width="100%">
      <tr>
        <th>Day Of Week</th>
        <th>Hours Available</th>
        <th>Note</th>
	<th></th>
      </tr>
      <xsl:for-each select="schedule">
	<tr>
	  <td>
		<xsl:value-of select="dayofweek"/>
	  </td>
	  <td>
		<xsl:value-of select="hoursavailable"/>
	  </td>
	  <td>
		<xsl:value-of select="note"/>
	  </td>
	  <td>
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
					 <xsl:text>ScheduleId</xsl:text>
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
					 <xsl:text>addSchedule</xsl:text>
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
					 <xsl:text>editSchedule</xsl:text>
				</xsl:attribute>
			</xsl:element>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>submit</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						 <xsl:text>Edit Schedule</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
		  </td>
	        </tr>
      </xsl:for-each>
    </table>
	<xsl:element name="p"></xsl:element>
	<h2>Lessons 		
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
					<xsl:value-of select="id"/>
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
					 <xsl:text>addLesson</xsl:text>
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
					 <xsl:text>editLesson</xsl:text>
				</xsl:attribute>
			</xsl:element>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>submit</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						 <xsl:text>Add Lesson</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
</h2>
    <table border="1" width="100%">
      <tr>
        <th>Date</th>
        <th>Scripture</th>
        <th>Topic</th>
        <th>Depth Of Understanding</th>
        <th>Note</th>
	<th></th>
      </tr>
      <xsl:for-each select="lesson">
	<tr>
	  <td>
		<xsl:value-of select="date"/>
	  </td>
	  <td>
		<xsl:value-of select="scripture"/>
	  </td>
	  <td>
		<xsl:value-of select="topic"/>
	  </td>
	  <td>
		<xsl:value-of select="depthofunderstanding"/>
	  </td>
	  <td>
		<xsl:value-of select="note"/>
	  </td>
	  <td>
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
					 <xsl:text>LessonId</xsl:text>
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
					 <xsl:text>addLesson</xsl:text>
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
					 <xsl:text>editLesson</xsl:text>
				</xsl:attribute>
			</xsl:element>
				<xsl:element name="INPUT">
					<xsl:attribute name="TYPE">
						 <xsl:text>submit</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="VALUE">
						 <xsl:text>Edit Lesson</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
		  </td>
	        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
</xsl:stylesheet>
