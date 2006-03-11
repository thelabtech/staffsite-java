package org.alt60m.fsk.bean;

import org.alt60m.util.SendMessage;
//import org.alt60m.fsk.*;
import org.alt60m.fsk.model.dbio.*;
 

public class  MassMail implements java.io.Serializable
{	
	private SendMessage msg;
	private FskOrder order;

	public MassMail()
	{
		try
		{
			msg = new SendMessage();
		}
		catch (Exception e)
		{	System.err.println(e.toString());
		}
	}

	public SendMessage getMessage()
	{	return msg;	}

	/**Composes the body of the message and sets all fields in the message */
	public void makeMessage(FskOrder o) throws Exception
	{	order = o;
		StringBuffer body = new StringBuffer();

		//The body of the message goes here
		body.append("This is a message from the FSK ordering system.");
		body.append("\n" + order.getStaffFirstName() + ", please verify your shipping address");
		body.append("\n\n" + order.getKitShipName());
		body.append("\n" + order.getKitShipAddress1());
		//only insert the second address line if it actually has something in it
		if(!order.getKitShipAddress2().equals(""))
		{	body.append("\n" + order.getKitShipAddress2());		}
		body.append("\n" + order.getKitShipCity());
		body.append(", " + order.getKitShipState());
		body.append("  " + order.getKitShipZip());
		body.append("\n\n" + order.getKitShipPhone());

		//System.out.println(body.toString());

		//Replace Toby.Murray@uscm.org with order.getStaffEmail()
		msg.setTo("toby.murray@uscm.org");
		msg.setFrom("fsk@uscm.org");
		msg.setSubject("FSK Order: " + order.getFskOrderId());
		msg.setBody(body.toString());

	}

	/**sendMessage sends the message! */
	public void sendMessage() throws Exception
	{
		System.out.println("sending email to " + order.getStaffEmail());
		msg.send();
	}



}
