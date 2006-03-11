package org.alt60m.fsk.bean;

//import org.alt60m.fsk.bean.*;
//import org.alt60m.persistence.castor.ObjectMapping;
//import org.alt60m.persistence.castor.ObjectAdaptor;
//import org.alt60m.persistence.castor.ObjectBrokerException;
//import org.alt60m.persistence.castor.*;
//import org.alt60m.util.SendMessage;
// import org.alt60m.fsk.*;
//import org.alt60m.fsk.logic.*;
import org.alt60m.fsk.model.dbio.*;
import java.util.*;
import java.io.*;


/* FskMassMailer is a stand-alone tool that queries the FSK database and sends an email
 * to everyone who placed an FSK order asking them to verify their shipping address. 
 * Created: 6/20/02 TEM
 */
public class  FskMassMailer
{
	public static void main(String[] args) throws Exception
	{	
		System.out.println("\n\n\nWelcome to the FSK mass emailer.");
		System.out.println("This program will send out an email to every record in the FSK order table asking the staff person to verify the shipping address.\n\n\n\n");
		BufferedReader keyboard = new BufferedReader(new InputStreamReader(System.in));
		FskOrder f = new FskOrder();
		Collection orders = f.selectList();
		Iterator iorder = orders.iterator();
		System.out.print("\n\n\n\nYou are about to send out " + orders.size() + " emails.  \nAre you sure you want to continue?  (Y/N)");
		String resp = keyboard.readLine();
		if (resp.equalsIgnoreCase("y"))
		{
			int ordernum = 0;
			while(iorder.hasNext())
			{	++ordernum;
				System.out.println("\n\nProcessing record number " + ordernum);
				FskOrder order = (FskOrder)iorder.next();
				MassMail mail = new MassMail();
				mail.makeMessage(order);
				mail.sendMessage();

			}
			System.out.println("\n\n" + ordernum + " orders processed.  Have a nice day!");

		}
		else {  System.out.println("No-go, huh?  Better luck next time.");  }
	}
}
