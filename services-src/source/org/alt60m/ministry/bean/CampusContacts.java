package org.alt60m.ministry.bean;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.alt60m.ministry.model.dbio.*;
import org.alt60m.ministry.servlet.*;

public class CampusContacts implements java.io.Serializable
{
	private static Log log = LogFactory.getLog(CampusContacts.class);
	
	private String fontB = "<FONT FACE=\"Arial\" SIZE=\"2\" COLOR=\"#336699\">";
	private String fontB1 = "<FONT FACE=\"Arial\" SIZE=\"1\" COLOR=\"#336699\">";

	String TargetAreaID;
	String fontFace;
	String fontColor;


	public CampusContacts() {}

	public void setVars(String _taid, String _fontf, String _fontc)
	{	
		TargetAreaID = _taid;
		fontFace = _fontf;
		fontColor = _fontc;
	}

	public String print() throws java.rmi.RemoteException { 
	
		StringBuffer sb = new StringBuffer();
		try {
			InfoBaseTool ibt = new InfoBaseTool();
			TargetArea tObj = ibt.getTargetArea(TargetAreaID);
			
			if (tObj.getIsSecure()) {
					sb.append("<table width='100%' border='0'>");
						sb.append("<tr>");
							sb.append("<td colspan=2><h1><font face='"+fontFace+"'>"+tObj.getName()+"&nbsp;</font></h1></td>");
						sb.append("</tr>");
						sb.append("<tr>");
							sb.append("<td width=25>&nbsp;");
							sb.append("</td>");
							sb.append("<td>");
							sb.append("<table width='100%' border='0' cellspacing='0' cellpadding='5'>");
								sb.append("<tr>");
									sb.append("<td colspan='2'>");
										sb.append("<h3><font face='"+fontFace+"'>ministry information is not available for this campus.</font></h3>");
									sb.append("</td>");
								sb.append("</tr>");
							sb.append("</table>");
						sb.append("</td>");
						sb.append("</tr>");
					sb.append("</table>");
			} else {
				java.util.Iterator scIterator = InfoBaseQueries.getActivityForTargetAreaByStrategy(TargetAreaID,"SC").iterator();
				java.util.Iterator catIterator = InfoBaseQueries.getActivityForTargetAreaByStrategy(TargetAreaID,"CA").iterator();
				java.util.Iterator icrdIterator = InfoBaseQueries.getActivityForTargetAreaByStrategy(TargetAreaID,"ID").iterator();
				java.util.Iterator icreIterator = InfoBaseQueries.getActivityForTargetAreaByStrategy(TargetAreaID,"IE").iterator();
				java.util.Iterator icriIterator = InfoBaseQueries.getActivityForTargetAreaByStrategy(TargetAreaID,"II").iterator();
				java.util.Iterator brIterator = InfoBaseQueries.getActivityForTargetAreaByStrategy(TargetAreaID,"BR").iterator();
				
				int cccmins = 0;
				String phone = "";

					sb.append("<table width='100%' border='0'>");
						sb.append("<tr>");
							sb.append("<td colspan=2><h1><font face='"+fontFace+"'>"+tObj.getName()+"&nbsp;</font></h1></td>");
						sb.append("</tr>");
						
						if (!tObj.getUrl().equals("")) {
							sb.append("<tr>");
								sb.append("<td width=25>&nbsp;");
								sb.append("</td>");
								sb.append("<td>");
									sb.append("<table width='100%' border='0' cellspacing='0' cellpadding='5'>");
										sb.append("<tr>");
											sb.append("<td colspan='2'>");
												sb.append("<h3><font face='"+fontFace+"'>Visit this ministry online:</font></h3>");
											sb.append("</td>");
										sb.append("</tr>");
										sb.append("<tr>");
											sb.append("<td width='5%'></td>");
											sb.append("<td>");
												sb.append("<font face='"+fontFace+"' size='2'><a href='"+tObj.getUrl()+"'>"+tObj.getUrl()+"</a></font>");
											sb.append("</td>");
										sb.append("</tr>");		
									sb.append("</table>");
								sb.append("</td>");
							sb.append("</tr>");
						}

						sb.append("<tr>");
							sb.append("<td width=25>&nbsp;");
							sb.append("</td>");
							sb.append("<td>");


							sb.append("<table width='100%' border='0' cellspacing='0' cellpadding='5'>");
								sb.append("<tr>");
									sb.append("<td colspan='2'>");
										sb.append("<h3><font face='"+fontFace+"'>Connect with this ministry by contacting:</font></h3>");
									sb.append("</td>");
								sb.append("</tr>");
								
								while (scIterator.hasNext())   //fill in the current activity contacts
								{
								Activity actObj = (Activity) scIterator.next();
									if (!actObj.getStatus().equals("IN")) 
									{
										cccmins = cccmins + 1;
										try {
											java.util.Iterator staffIterator = actObj.getActivityContacts().iterator();
											//display url also?
											//LocalLevelObject llObj = actObj.doesSc();
											if (!staffIterator.hasNext()) 
											{
												sb.append("<tr><TD></TD><td><font face='"+fontFace+"' size='2'>Student LINC Ministry&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;<a href='mailto:StudentLinc@uscm.org'>StudentLinc@uscm.org</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone: 407-826-2948</font> </td></tr>");
											}
											while (staffIterator.hasNext())
											{
												Staff staffObj = (Staff) staffIterator.next();
												log.debug(staffObj.getWorkPhone());
												if ((staffObj.getWorkPhone()==null)||(staffObj.getWorkPhone().equals(""))||(staffObj.getWorkPhone().equals(" ")))
												{
													phone = staffObj.getHomePhone();
												} else 
												{
													phone = staffObj.getWorkPhone();
												}
												 
												sb.append("<tr>");
													sb.append("<td width='5%'></td>");							
												sb.append("</tr>");
												sb.append("<tr>");
													sb.append("<td width='5%'></td>");
													sb.append("<td>");
														sb.append("<font face='"+fontFace+"' size='2'>"+staffObj.getPreferredName()+"&nbsp;"+staffObj.getLastName()+"&nbsp;-&nbsp;email:&nbsp;<a href='mailto:"+staffObj.getEmail()+"'>"+staffObj.getEmail()+"</a>&nbsp;-&nbsp;Phone:&nbsp;"+phone+"</font>");
													sb.append("</td>");
												sb.append("</tr>");
												
											}
										} catch (NullPointerException npe) {
											
											sb.append("<tr><td><font face='"+fontFace+"' size='2'>Student LINC Ministry&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;<a href='mailto:StudentLinc@uscm.org'>StudentLinc@uscm.org</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone: 407-826-2948</font> </td></tr>");
											
										}
									}
								}
								

								while (catIterator.hasNext())   //fill in the current activity contacts
								{
									Activity actObj = (Activity) catIterator.next();
									if (!actObj.getStatus().equals("IN")) 
									{
										cccmins = cccmins + 1;
										try {
											java.util.Iterator staffIterator = actObj.getActivityContacts().iterator();
											if (!staffIterator.hasNext()) 
											{
												sb.append("<tr><TD></TD><td><font face='"+fontFace+"' size='2'>Student LINC Ministry&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;<a href='mailto:StudentLinc@uscm.org'>StudentLinc@uscm.org</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone: 407-826-2948</font> </td></tr>");
											}
											while (staffIterator.hasNext())
											{
												Staff staffObj = (Staff) staffIterator.next();
												if ((staffObj.getWorkPhone()==null)||(staffObj.getWorkPhone().equals(""))||(staffObj.getWorkPhone().equals(" ")))
												{
													phone = staffObj.getHomePhone();
												} else 
												{
													phone = staffObj.getWorkPhone();
												}
												 
												sb.append("<tr>");
													sb.append("<td width='5%'></td>");							
												sb.append("</tr>");
												sb.append("<tr>");
													sb.append("<td width='5%'></td>");
													sb.append("<td>");
														sb.append("<font face='"+fontFace+"' size='2'>"+staffObj.getPreferredName()+"&nbsp;"+staffObj.getLastName()+"&nbsp;-&nbsp;email:&nbsp;<a href='mailto:"+staffObj.getEmail()+"'>"+staffObj.getEmail()+"</a>&nbsp;-&nbsp;Phone:&nbsp;"+phone+"</font>");
													sb.append("</td>");
												sb.append("</tr>");
												
											}
										} catch (NullPointerException npe) {
											
											sb.append("<tr><td><font face='"+fontFace+"' size='2'>Student LINC Ministry&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;<a href='mailto:StudentLinc@uscm.org'>StudentLinc@uscm.org</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone: 407-826-2948</font> </td></tr>");
											
										}
									}
								}

											
								if (icrdIterator.hasNext())
								{
									Activity actObj = (Activity) icrdIterator.next();
									if (!actObj.getStatus().equals("IN")) 
									{
										sb.append("<tr>");
											sb.append("<td width='5%'></td>");
											sb.append("<td>");
												sb.append("<hr>");
											sb.append("</td>");
										sb.append("</tr>");
										sb.append("<tr>");
											sb.append("<td width='5%'>");
											sb.append("</td>");							
											sb.append("<td>");
												sb.append("<font face='"+fontFace+"'><b>Hispanic Ministry</b></font>");
											sb.append("</td>");
										sb.append("</tr>");
										
										cccmins = cccmins + 1;
										try {
											java.util.Iterator staffIterator = actObj.getActivityContacts().iterator();
											if (!staffIterator.hasNext()) 
											{
												sb.append("<tr><TD></TD><td><font face='"+fontFace+"' size='2'><a href='http://Destino.uscm.org'>Destino.uscm.org</a></font> </td></tr>");
											}
											while (staffIterator.hasNext())
											{
												Staff staffObj = (Staff) staffIterator.next();
												log.debug(staffObj.getWorkPhone());
												if ((staffObj.getWorkPhone()==null)||(staffObj.getWorkPhone().equals(""))||(staffObj.getWorkPhone().equals(" ")))
												{
													phone = staffObj.getHomePhone();
												} else 
												{
													phone = staffObj.getWorkPhone();
												}
												 
												sb.append("<tr>");
													sb.append("<td width='5%'></td>");
													sb.append("<td>");
														sb.append("<font face='"+fontFace+"' size='2'>"+staffObj.getPreferredName()+"&nbsp;"+staffObj.getLastName()+"&nbsp;-&nbsp;email:&nbsp;<a href='mailto:"+staffObj.getEmail()+"'>"+staffObj.getEmail()+"</a>&nbsp;-&nbsp;Phone:&nbsp;"+phone+"</font>");
													sb.append("</td>");
												sb.append("</tr>");
												
											}
										} catch (NullPointerException npe) {
											
											sb.append("<tr><td><font face='"+fontFace+"' size='2'><a href='http://Destino.uscm.org'>Destino.uscm.org</a></font> </td></tr>");
											
										}
									}
								}
									
								if (icreIterator.hasNext())
								{
									Activity actObj = (Activity) icreIterator.next();
									if (!actObj.getStatus().equals("IN")) 
									{
										sb.append("<tr>");
											sb.append("<td width='5%'></td>");
											sb.append("<td>");
												sb.append("<hr>");
											sb.append("</td>");
										sb.append("</tr>");
										sb.append("<tr>");
											sb.append("<td width='5%'>");
											sb.append("</td>");							
											sb.append("<td>");
												sb.append("<font face='"+fontFace+"'><b>Asian American Ministry</b></font>");
											sb.append("</td>");
										sb.append("</tr>");
										
										cccmins = cccmins + 1;
										try {
											java.util.Iterator staffIterator = actObj.getActivityContacts().iterator();
											if (!staffIterator.hasNext()) 
											{
												sb.append("<tr><TD></TD><td><font face='"+fontFace+"' size='2'>Epic Ministry&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;<a href='mailto:EpicInfo@epicmovement.com'>EpicInfo@EpicMovement.com</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font> </td></tr>");
											}
											while (staffIterator.hasNext())
											{
												Staff staffObj = (Staff) staffIterator.next();
												log.debug(staffObj.getWorkPhone());
												if ((staffObj.getWorkPhone()==null)||(staffObj.getWorkPhone().equals(""))||(staffObj.getWorkPhone().equals(" ")))
												{
													phone = staffObj.getHomePhone();
												} else 
												{
													phone = staffObj.getWorkPhone();
												}
												 
												sb.append("<tr>");
													sb.append("<td width='5%'></td>");							
												sb.append("</tr>");
												sb.append("<tr>");
													sb.append("<td width='5%'></td>");
													sb.append("<td>");
														sb.append("<font face='"+fontFace+"' size='2'>"+staffObj.getPreferredName()+"&nbsp;"+staffObj.getLastName()+"&nbsp;-&nbsp;email:&nbsp;<a href='mailto:"+staffObj.getEmail()+"'>"+staffObj.getEmail()+"</a>&nbsp;-&nbsp;Phone:&nbsp;"+phone+"</font>");
													sb.append("</td>");
												sb.append("</tr>");
												
											}
										} catch (NullPointerException npe) {
											
											sb.append("<tr><td><font face='"+fontFace+"' size='2'>Epic Ministry&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;<a href='mailto:EpicInfo@epicmovement.com'>EpicInfo@EpicMovement.com</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font> </td></tr>");
											
										}
									}
								}


								if (icriIterator.hasNext())    //fill in the current activity contacts
								{
									Activity actObj = (Activity) icriIterator.next();
									if (!actObj.getStatus().equals("IN")) 
									{
										sb.append("<tr>");
											sb.append("<td width='5%'></td>");
											sb.append("<td>");
												sb.append("<hr>");
											sb.append("</td>");
										sb.append("</tr>");
										sb.append("<tr>");
											sb.append("<td width='5%'>");
											sb.append("</td>");							
											sb.append("<td>");
												sb.append("<font face='"+fontFace+"'><b>African American Ministry</b></font>");
											sb.append("</td>");
										sb.append("</tr>");
									
										cccmins = cccmins + 1;
										try {
											java.util.Iterator staffIterator = actObj.getActivityContacts().iterator();
											if (!staffIterator.hasNext()) 
											{
												sb.append("<tr><TD></TD><td><font face='"+fontFace+"' size='2'>Impact Ministry&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;<a href='mailto:Impact@uscm.org'>Impact@uscm.org</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone: 1-888-672-2896</font> </td></tr>");
											}
											while (staffIterator.hasNext())
											{
												Staff staffObj = (Staff) staffIterator.next();
												log.debug(staffObj.getWorkPhone());
												if ((staffObj.getWorkPhone()==null)||(staffObj.getWorkPhone().equals(""))||(staffObj.getWorkPhone().equals(" ")))
												{
													phone = staffObj.getHomePhone();
												} else 
												{
													phone = staffObj.getWorkPhone();
												}
												 
												sb.append("<tr>");
													sb.append("<td width='5%'></td>");							
												sb.append("</tr>");
												sb.append("<tr>");
													sb.append("<td width='5%'></td>");
													sb.append("<td>");
														sb.append("<font face='"+fontFace+"' size='2'>"+staffObj.getPreferredName()+"&nbsp;"+staffObj.getLastName()+"&nbsp;-&nbsp;email:&nbsp;<a href='mailto:"+staffObj.getEmail()+"'>"+staffObj.getEmail()+"</a>&nbsp;-&nbsp;Phone:&nbsp;"+phone+"</font>");
													sb.append("</td>");
												sb.append("</tr>");
												
											}
										} catch (NullPointerException npe) {
											
											sb.append("<tr><td><font face='"+fontFace+"' size='2'>Impact Ministry&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;<a href='mailto:Impact@uscm.org'>Impact@uscm.org</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone: 1-888-672-2896</font> </td></tr>");
											
										}
									}
								}
								
								if (brIterator.hasNext())    //fill in the current activity contacts
								{
									Activity actObj = (Activity) brIterator.next();
									if (!actObj.getStatus().equals("IN")) 
									{
										sb.append("<tr>");
											sb.append("<td width='5%'></td>");
											sb.append("<td>");
												sb.append("<hr>");
											sb.append("</td>");
										sb.append("</tr>");
										sb.append("<tr>");
											sb.append("<td width='5%'>");
											sb.append("</td>");							
											sb.append("<td>");
												sb.append("<font face='"+fontFace+"'><b>Bridges Ministry</b></font>");
											sb.append("</td>");
										sb.append("</tr>");
													
										cccmins = cccmins + 1;
										try {
											java.util.Iterator staffIterator = actObj.getActivityContacts().iterator();
											if (!staffIterator.hasNext()) 
											{
												sb.append("<tr><TD></TD><td><font face='"+fontFace+"' size='2'>Bridges Ministry</font></td></tr>"); //&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;<a href='mailto:Impact@uscm.org'>Impact@uscm.org</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone: 1-888-672-2896</font> </td></tr>");
											}
											while (staffIterator.hasNext())
											{
												Staff staffObj = (Staff) staffIterator.next();
												log.debug(staffObj.getWorkPhone());
												if ((staffObj.getWorkPhone()==null)||(staffObj.getWorkPhone().equals(""))||(staffObj.getWorkPhone().equals(" ")))
												{
													phone = staffObj.getHomePhone();
												} else 
												{
													phone = staffObj.getWorkPhone();
												}
																 
												sb.append("<tr>");
													sb.append("<td width='5%'></td>");							
												sb.append("</tr>");
												sb.append("<tr>");
													sb.append("<td width='5%'></td>");
													sb.append("<td>");
														sb.append("<font face='"+fontFace+"' size='2'>"+staffObj.getPreferredName()+"&nbsp;"+staffObj.getLastName()+"&nbsp;-&nbsp;email:&nbsp;<a href='mailto:"+staffObj.getEmail()+"'>"+staffObj.getEmail()+"</a>&nbsp;-&nbsp;Phone:&nbsp;"+phone+"</font>");
													sb.append("</td>");
												sb.append("</tr>");
																
											}
										} catch (NullPointerException npe) {
															
											sb.append("<tr><td><font face='"+fontFace+"' size='2'>Bridges Ministry</font></td></tr>"); //&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;<a href='mailto:Impact@uscm.org'>Impact@uscm.org</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone: 1-888-672-2896</font> </td></tr>");
															
										}
									}
								}
								
								if (cccmins == 0)
								{
								
									sb.append("<tr>");
										sb.append("<td width='5%'>");
										sb.append("</td>");
										sb.append("<td>");
											sb.append("<font face='"+fontFace+"' size='2'><i>There are no Campus Crusade ministries here yet. A group of us have been praying for your campus and we have developed some resources that could help you start something.  We are trusting God to touch the life of every student while you are at school.  Would you like to be a part of this effort?  If so, you could easily start a ministry.</i><br><br>");
											sb.append("<font face='"+fontFace+"' size='2'><i>To find out how, go to <a href='http://www.godsquad.com'>www.GodSquad.com</a> and click on \"wanna start something\"</i><br><br></font>");
											sb.append("<font face='"+fontFace+"' size='2'><i>or</i><br><br></font>");
											sb.append("<font face='"+fontFace+"' size='2'><i>Call or e-mail the Student LINC Ministry to talk with a Campus Consultant. (Phone: 407-826-2948. E-mail <a href=\"mailto:StudentLinc@uscm.org\">StudentLinc@uscm.org</a>)</i><br><br></font>");
										sb.append("</td>");
									sb.append("</tr>");
								
								}
								
									sb.append("</table>");
						sb.append("</td>");
						sb.append("</tr>");
					sb.append("</table>");
			}

											/*sb.append("<!-- Begin Non-CCC Mins table -->");
											int ministryCounter = 0; 
											
											if (otherMinistriesIterator.hasNext())
											{
												
												sb.append("<center>");
												sb.append("<table width='100%' border=0 cellspacing='0'>");
													sb.append("<tr>");
														sb.append("<td colspan=5>");
														sb.append("<!-- 	<h3><font face='"+fontFace+"'>Other Ministries:</font></h3> -->");
														sb.append("</td>");
													sb.append("</tr>");
													
											
												while (otherMinistriesIterator.hasNext())
												{
													NonCccMinObject minW = (NonCccMinObject)javax.rmi.PortableRemoteObject.narrow(otherMinistriesIterator.next(),org.alt60m.ministry.ejb.NonCccMinObject.class); 
													ministryCounter++;
													 
														sb.append("<tr>");
															sb.append("<td width='5%'>");
															sb.append("</td>");
														sb.append("</tr>");
														sb.append("<tr>");
															sb.append("<td width="10%">");
															sb.append("</td>");
															sb.append("<td>");
																sb.append("<center><font face='"+fontFace+"' size='2'><b>"+ministryCounter);						.</b></font></center>  -->");
															sb.append("</td>");
															sb.append("<td>");
																sb.append("<center><font face='"+fontFace+"' size='2'>"+minW.getMinistry());
																sb.append("</font></center>");
															sb.append("</td>");
															sb.append("<td>");
																sb.append("<center><font face='"+fontFace+"' size='2'>"+minW.getPreferredName()+"&nbsp;"+minW.getLastName());
																sb.append("&nbsp;&nbsp;&nbsp;Ph:&nbsp;"+minW.getWorkPhone());
																sb.append("&nbsp;&nbsp;&nbsp;Email:&nbsp;<a href='mailto:"+minW.getEmail()+">"+minW.getEmail()+"</a></font></center>");
															sb.append("</td>");
															sb.append("<td >");
															sb.append("<center></font></center>");
															sb.append("</td>");
														sb.append("</tr>");
												}
											sb.append("</table>");
											sb.append("</center>");
											}
											*/
		} catch (Exception re) {
			log.error(re.getMessage(), re);
		}		

		return sb.toString();	
	}
	
	
	public static void main(String[] args) throws Exception
	{
		CampusContacts cc = new CampusContacts();
		cc.setVars(args[0], "Font1", "Font2");

		System.out.println(cc.print());
	}

}
