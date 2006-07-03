<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.hr.si.model.dbio.*" %>
<jsp:useBean id="siBean" class="org.alt60m.hr.si.bean.dbio.SIInfoBean"/>
<jsp:useBean id="util" class="org.alt60m.html.Util"/>

<%
	String regionID = request.getParameter("region");
	String yearID = request.getParameter("year");
	// 3-27-03 kl: refactored out, replaced with single getAppsCollections
    //Collection cReady = siBean.getAppsReady(regionID); 
    //Collection cInProcess = siBean.getAppsInProcess(regionID);
    //Collection cStarted = siBean.getAppsStarted(regionID);

	// 3-27-03 kl: get the 3 collections to process
	Collection cCollections = siBean.getAppsCollections(regionID, yearID);
	Iterator tubIterator = cCollections.iterator();
	Hashtable tub = (Hashtable)tubIterator.next();
	Collection cReady=(Collection) tub.get("ReadyID");
	Collection cInProcess=(Collection) tub.get("InProcessID");
	Collection cStarted=(Collection) tub.get("StartedID");
%>

<%@ include file="simainheader.jspf"%>

<table width="100%">
	<tr valign="top" align="center">
		<td width="84%">
			<center><FONT FACE="Arial" SIZE="4" COLOR="#336699">Applicants in Region:&nbsp; <FONT FACE="Arial" SIZE="4" COLOR="#000000"><b><%=regionID%></b></font></center>
		</td>
<%@ include file="sisidemenu.jspf"%>
	</tr>

	<!-- display the lists of applicants -->
	<tr valign="top">
		<td>
<%
			// Big loop to loop through each type of list to displayed.
			String listTitle = "";
			String listTitleDefinition = "";
			String appType = "";
			Iterator listIterator = cReady.iterator();	// here just so we don't a warning about listIterator might not be initialized that stops compiling
			int rc;
			for(int listCounter=0; listCounter<3; listCounter++) {
				switch (listCounter) {
					case 0:
						listTitle = "Ready Applications";
						listTitleDefinition = "(<b>ALL</b> 6 Parts of Application Complete--Application Submitted <b>AND</b> Payment Made <b>AND</b> All 4 References Finished)";
						listIterator = cReady.iterator();
						appType = "R";	// ready
						break;
					case 1:
						listTitle = "In Process Applications";
						listTitleDefinition = "(At least <b>ONE</b> of the 6 Parts of Application Complete--Application Submitted <b>OR</b> Payment Made <b>OR</b> One of the 4 References Finished)";
						listIterator = cInProcess.iterator();
						appType = "I";	// in process
						break;
					case 2:
						listTitle = "Started Applications";
						listTitleDefinition = "(At least something significant started on the application like a reference designated or confidential questions answered, <font size=\"-3\">i.e. the applicant has more than logged in and has at least started his application</font>)";
						listIterator = cStarted.iterator();
						appType = "S";	// started
						break;
				}
%>
				<table width='100%' border='1' bordercolor="#bbbb88" BORDERCOLORLIGHT="#cccc99">
					<tr valign="top"><td width="80%">
						<table width='100%'>
							<tr>
								<td align='left'>
									<FONT FACE="Arial" SIZE="3" COLOR="#000000"><b><%=listTitle%></font></b><br>
									<font color="#000000" size="1"><%=listTitleDefinition%></font></br>
								</td>
								<td align='right' width='40' valign='top'>
									<font size='1'><a href="SIController?action=postMakeDownload&view=cvsfile&regionID=<%=regionID%>&appType=<%=appType%>&yearID=<%=yearID%>">Get DB</a></font>
								</td>
							</tr>
						</table>
						<table width='100%' border='1' bordercolor="#bbbb88" BORDERCOLORLIGHT="#cccc99" cellpadding='0' cellspacing='0'>
							<tr valign='top' align='center' bordercolor='white'>
								<td class="insideboxst">&nbsp;</TD>
								<td class="insideboxst">Applicant Name</TD>
								<td class="insideboxst">Date Started<br><i>Submitted</i><br>Paid?
								<!--Payment $/Type<br><i>Received</i>-->
								</td>
								<td class="insideboxst">References</td>
								<td class="insideboxst">Ref Started</td>
								<td class="insideboxst">Ref Submitted</td>
								<td class="insideboxst">School<br>Language</td>
							</tr>
<%
								rc = 0;
								while (listIterator.hasNext()) {
									rc++;
									// get the next application to display
							        Hashtable h = (Hashtable)listIterator.next();
							        String appID = (String) h.get("ApplicationID");

									// 02-11-04 kl: to reuse existing jsp coding, polymorphism
									SIApplication a = null;
									SIPerson p = null;
									SIReference refS = null;
									SIReference refD = null;
									SIReference refR = null;
									SIReference refF = null;
/*									if(yearID.equals("2003")){
										a = new SIApplication_Archive2003();
										a = siBean.getSIApplication_Archive(appID);
										p = new SIPerson_Archive2003();
										p = siBean.getSIPerson_Archive(a.getFk_SIPersonID());
										refS = new SIReference_Archive2003();
										refD = new SIReference_Archive2003();
										refR = new SIReference_Archive2003();
										refF = new SIReference_Archive2003();
										refS = siBean.getSIReferenceByType_Archive(appID, "S");
										refD = siBean.getSIReferenceByType_Archive(appID, "D");
										refR = siBean.getSIReferenceByType_Archive(appID, "R");
										refF = siBean.getSIReferenceByType_Archive(appID, "F");
									}
									else {*/
										a = new SIApplication();
										a = siBean.getSIApplication(appID);
										p = new SIPerson();
										p = siBean.getSIPerson(a.getFk_PersonIDString());
										refS = new SIReference();
										refD = new SIReference();
										refR = new SIReference();
										refF = new SIReference();
										refS = siBean.getSIReferenceByType(appID, "S", yearID);
										refD = siBean.getSIReferenceByType(appID, "D", yearID);
										refR = siBean.getSIReferenceByType(appID, "R", yearID);
										refF = siBean.getSIReferenceByType(appID, "F", yearID);
//									}

									// get the names of projects application is applying to:
									SIProject projA = new SIProject();
									SIProject projB = new SIProject();
									SIProject projC = new SIProject();
									if (a.getLocationA() != null  &&  !a.getLocationA().equals(""))
										try {
											projA = siBean.getSIProject(Integer.valueOf( a.getLocationA() ).intValue());
										} catch (Exception e) { /* should never happen, but might in test data */ }
									if (a.getLocationB() != null  &&  !a.getLocationB().equals(""))
										try {
											projB = siBean.getSIProject(Integer.valueOf( a.getLocationB() ).intValue());
										} catch (Exception e) { /* should never happen, but might in test data */ }
									if (a.getLocationC() != null  &&  !a.getLocationC().equals(""))
										try {
											projC = siBean.getSIProject(Integer.valueOf( a.getLocationC() ).intValue());
										} catch (Exception e) { /* should never happen, but might in test data */ }

									String refEditLink = "/servlet/SIController?action=postRefFormEncEdit&encRefID=";
									String appEvalLink = "/servlet/SIController?action=evalPage&page=evalcontact&toframe=null&appID=";
			
%>
									<tr class="cell2" align=center>
										<td class="cell2" rowspan='3'>
											<%=rc%>
										</td>
										<td class="insidebox" align="center">
											<b><%=p.getFirstName() + " " + p.getLastName()%></b>
										<!--	<br><a href="<%=appEvalLink%><%=appID%>">[Evaluate]</a>-->
										</td>
										<td class="insideboxst">
											<%=a.getDateAppStarted()==null?"-":util.formatDate(a.getDateAppStarted())%><br>
											<i><%=a.getDateSubmitted()==null?"-":util.formatDate(a.getDateSubmitted())%></i><br>
											<!--[$] [type]<br><i>[payrecvdate]</i>-->
											<%=a.getIsPaid()?"Yes":"No"%>
										</td>
										<td class="insideboxst" align='left'>
											Staff: <a target='blank' href='<%=refEditLink%><%=refS.encodeReferenceID()%>'>
											<%=refS.getFirstName() + " " + refS.getLastName()%></a><br>
											Discipler: <a target='blank' href='<%=refEditLink%><%=refD.encodeReferenceID()%>'>
											<%=refD.getFirstName() + " " + refD.getLastName()%></a><br>
											Roommate: <a target='blank' href='<%=refEditLink%><%=refR.encodeReferenceID()%>'>
											<%=refR.getFirstName() + " " + refR.getLastName()%></a><br>
											Friend: <a target='blank' href='<%=refEditLink%><%=refF.encodeReferenceID()%>'>
											<%=refF.getFirstName() + " " + refF.getLastName()%></a>
										</td>
										<td class="insideboxst">
											<%=refS.getCreateDate()==null?"-":util.formatDate(refS.getCreateDate())%><br>
											<%=refD.getCreateDate()==null?"-":util.formatDate(refD.getCreateDate())%><br>
											<%=refR.getCreateDate()==null?"-":util.formatDate(refR.getCreateDate())%><br>
											<%=refF.getCreateDate()==null?"-":util.formatDate(refF.getCreateDate())%>
										</td>
										<td class="insideboxst">
											<%=refS.getFormSubmittedDate()==null?"-":util.formatDate(refS.getFormSubmittedDate())%><br>
											<%=refD.getFormSubmittedDate()==null?"-":util.formatDate(refD.getFormSubmittedDate())%><br>
											<%=refR.getFormSubmittedDate()==null?"-":util.formatDate(refR.getFormSubmittedDate())%><br>
											<%=refF.getFormSubmittedDate()==null?"-":util.formatDate(refF.getFormSubmittedDate())%>
										</td>
										<td class="insideboxst">
											<%=p.getRecentSchools()%><br>
										</td>
									</tr>

									<tr class="cell2" align=center>
										<td class="insideboxst" colspan=5 align=left>
											<b>Ministry Preferences:</b>
											#1: <%=projA.getName()%> - <%=a.getLocationAExplanation()%>&nbsp;&nbsp;&nbsp;
											#2: <%=projB.getName()%> - <%=a.getLocationBExplanation()%>&nbsp;&nbsp;&nbsp;
											#3: <%=projC.getName()%> - <%=a.getLocationCExplanation()%>&nbsp;&nbsp;&nbsp;
										</td>
										<td class="insideboxst" align=right>
											<b>Available:</b> <%=a.getAvailableMonth()%>/<%=a.getAvailableYear()%>
										</td>
									</tr>

									<tr class="cell2" align=center>
										<td class="insideboxst" colspan=7 align=left>
											Print: 
											<a href="JavaScript: popupWindow('SIController?action=goToPage&page=pfappandrefs&ApplicationID=<%=a.getApplicationID()%>&pfType=ALL&yearID=<%=yearID%>', 'PrinterFriendly', 'scrollbars=yes,resizable,titlebar=yes,toolbar=yes')">1. Complete w/Ref</a>&nbsp;&nbsp;
											<A HREF="JavaScript: popupWindow('SIController?action=goToPage&page=pfapplication&ApplicationID=<%=a.getApplicationID()%>&pfType=ALL&yearID=<%=yearID%>', 'PrinterFriendly', 'scrollbars=yes,resizable,titlebar=yes,toolbar=yes')">2. Complete No Ref</a>&nbsp;&nbsp;
											<A HREF="JavaScript: popupWindow('SIController?action=goToPage&page=pfappnoconf&ApplicationID=<%=a.getApplicationID()%>&pfType=ALL&yearID=<%=yearID%>', 'PrinterFriendly', 'scrollbars=yes,resizable,titlebar=yes,toolbar=yes')">3. No Confidential</a>&nbsp;&nbsp;
											<A HREF="JavaScript: popupWindow('SIController?action=goToPage&page=pfrefs&ApplicationID=<%=a.getApplicationID()%>&pfType=ALL&yearID=<%=yearID%>', 'PrinterFriendly', 'scrollbars=yes,resizable,titlebar=yes,toolbar=yes')">4. Collated Refs</a>&nbsp;&nbsp;
											<A HREF="JavaScript: popupWindow('SIController?action=goToPage&page=pfrefs&ApplicationID=<%=a.getApplicationID()%>&pfType=STAFF&yearID=<%=yearID%>', 'PrinterFriendly', 'scrollbars=yes,resizable,titlebar=yes,toolbar=yes')">5a.Staff Ref</a>&nbsp;&nbsp;
											<A HREF="JavaScript: popupWindow('SIController?action=goToPage&page=pfrefs&ApplicationID=<%=a.getApplicationID()%>&pfType=DISCIPLER&yearID=<%=yearID%>', 'PrinterFriendly', 'scrollbars=yes,resizable,titlebar=yes,toolbar=yes')">5b.Discipler Ref</a>&nbsp;&nbsp;
											<A HREF="JavaScript: popupWindow('SIController?action=goToPage&page=pfrefs&ApplicationID=<%=a.getApplicationID()%>&pfType=ROOMMATE&yearID=<%=yearID%>', 'PrinterFriendly', 'scrollbars=yes,resizable,titlebar=yes,toolbar=yes')">5c.Roommate Ref</a>&nbsp;&nbsp;
											<A HREF="JavaScript: popupWindow('SIController?action=goToPage&page=pfrefs&ApplicationID=<%=a.getApplicationID()%>&pfType=FRIEND&yearID=<%=yearID%>', 'PrinterFriendly', 'scrollbars=yes,resizable,titlebar=yes,toolbar=yes')">5D.Friend Ref</a>&nbsp;&nbsp;
											<a href="https://staff.campuscrusadeforchrist.com/cms/content/172016001080104385660892900337.pdf">6. Evaluator's Worksheet</a>&nbsp;&nbsp;
											<a href="https://staff.campuscrusadeforchrist.com/cms/content/172016001080104385629665300336.pdf">7. Acceptance Issues</a>&nbsp;&nbsp;
											<a href="https://staff.campuscrusadeforchrist.com/cms/content/172016001080104385673193300338.pdf">8. Evaluator Summary</a>&nbsp;&nbsp;
											<a href="https://staff.campuscrusadeforchrist.com/cms/content/172016001080104385687907800339.pdf">9. Med Psych Form</a>&nbsp;&nbsp;
										</td>
									</tr>
<%
								}
%>
							</table>
						</td>
					</tr>
				</table>
<%
			}
%>

			<p>
			Note: If you have questions about any applicants, please contact your regional office.  If you have general questions please email <a href="mailto:stintandinternships@uscm.org">stintandinternships@uscm.org</a>.
			</p>
		</td>
	</tr>
</table>



<!--- couldn't the following be put in a footer file?! -->
<%@ include file="sitoolfooter.jspf"%>