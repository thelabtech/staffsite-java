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
	<xsl:element name="form">
		<xsl:attribute name="action">
			<xsl:text>/servlet/DiscipleshipController</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="method">
			<xsl:text>POST</xsl:text>
		</xsl:attribute>
		<xsl:element name="input">
			<xsl:attribute name="type">
				<xsl:text>hidden</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:text>action</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:text>saveContact</xsl:text>
			</xsl:attribute>
		</xsl:element>		
		<xsl:element name="input">
			<xsl:attribute name="type">
				<xsl:text>hidden</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:text>url</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:text>/discipleship/index.jsp</xsl:text>
			</xsl:attribute>
		</xsl:element>		
		<xsl:element name="input">
			<xsl:attribute name="type">
				<xsl:text>hidden</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:text>ContactId</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="id"/>
			</xsl:attribute>
		</xsl:element>		
			<table>
				<tr>
					<td>
						<xsl:text>First Name</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>FirstName</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="firstname"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Last Name</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>LastName</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="lastname"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Phone Number</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>PhoneNumber</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="phonenumber"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Email Address</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>EmailAddress</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="emailaddress"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Address</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>Address1</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="address1"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Address2</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>Address2</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="address2"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Residence</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>Residence</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="residence"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>City</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>City</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="city"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>State</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>State</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="state"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Zip</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>Zip</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="zip"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Gender</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>Gender</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="gender"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Marital Status</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>MaritalStatus</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="maritalstatus"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Campus</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>Campus</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="campus"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Level of discipleship</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>LevelOfDiscipleship</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="levelofdiscipleship"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Year in school</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>YearInSchool</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="yearinschool"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Birth date</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>BirthDate</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="birthdate"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Date became believer</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>DateBecameBeliever</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="datebecamebeliever"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Primary spiritual gift</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>PrimarySpiritualGift</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="primaryspiritualgift"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Secondary spiritual gift</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>SecondarySpiritualGift</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="secondaryspiritualgift"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Tertiary spiritual gift</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>TertiarySpiritualGift</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="tertiaryspiritualgift"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Type of contact</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>TypeOfContact</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="typeofcontact"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Note</xsl:text>
					</td>
					<td>
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>text</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:text>Note</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="note"/>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<xsl:element name="input">
							<xsl:attribute name="type">
								<xsl:text>submit</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>Save</xsl:text>
							</xsl:attribute>
						</xsl:element>		
					</td>
				</tr>
			</table>
	</xsl:element>
  </xsl:template>

</xsl:stylesheet>
