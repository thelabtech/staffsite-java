<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="RESULTSET">
		<xsl:for-each select="ROW">
			<TR>
				<TD>
					<xsl:choose>
						<xsl:when test="position() mod 2 = 1">
							<xsl:attribute name="CLASS">
								linkcell
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="CLASS">
								linkcell2
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<A>
						<xsl:attribute name="HREF">
							/servlet/CRSAdmin?action=showStudentRegistration&amp;registrationID=
							<xsl:value-of select="childRegistrationID" />
						</xsl:attribute>
						<xsl:choose>
							<xsl:when test="position() mod 2 = 1">
								<xsl:attribute name="CLASS">
									linkcell
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="CLASS">
									linkcell2
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="firstName" />
						&#160;
						<xsl:value-of select="lastName" />
					</A>
				</TD>
				<xsl:for-each select="*">
					<xsl:if test="position() &gt; 3">
						<TD>
							<xsl:choose>
								<xsl:when
									test="count(parent::*/preceding-sibling::*) mod 2 = 0">
									<xsl:attribute name="CLASS">
										cell
									</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="CLASS">
										cell2
									</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:attribute name="ALIGN">
								RIGHT
							</xsl:attribute>
							<xsl:value-of select="." />
						</TD>
					</xsl:if>
				</xsl:for-each>
			</TR>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>