/*
 * SendMessage.java
 *
 * Created on April 3, 2000, 4:40 PM
 */
package org.alt60m.util;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author  mat
 * @version
 */
public class SendMessage extends Object implements java.io.Serializable {
	private static final int NUM_CONNECT_ATTEMPTS = 10;
	
  Properties props;
  MimeMessage msg;
  Transport myTransport;
	
//  private static final String DEFAULT_HOST_NAME = "mail.uscm.org";
  private static final String DEFAULT_HOST_NAME = "smtp1.ccci.org";


  public SendMessage(String SMTPHostName) throws javax.mail.MessagingException {
  	init(SMTPHostName, 0);
  }
  
  private void init(String SMTPHostName, int attempt) throws MessagingException {
    props = System.getProperties();
	props.put("mail.smtp.host", SMTPHostName);
	Session mySession = Session.getDefaultInstance(props, null);
	Transport myTransport = mySession.getTransport("smtp");
	try {
		myTransport.connect(SMTPHostName, "", "");
	} catch (MessagingException e) {
		System.err.println("Couldn't connect to SMTP Server, attempt #" + attempt);
		if ( attempt < NUM_CONNECT_ATTEMPTS ) {
			try {
				Thread.sleep(1000);
			} catch (InterruptedException err) {
				System.err.println("Error while trying to sleep thread.");
				throw e;
			}
			init(SMTPHostName, attempt + 1);
		} else {
			throw e;
		}
	}
	
	msg = new MimeMessage(mySession);	
  }

  /** Creates new SendMessage */
  public SendMessage() throws javax.mail.MessagingException {
	this(DEFAULT_HOST_NAME);
  }

  public void send() throws javax.mail.MessagingException {
	  send(false);
  }
	public void send(boolean sendAsync) throws javax.mail.MessagingException {
		msg.setSentDate(new Date());
		msg.saveChanges();
			

		if (sendAsync) {
			class sender implements Runnable {
				MimeMessage _msg;
				Transport _t;
				sender(MimeMessage msg, Transport t) {
					 _msg = msg;
					 _t = t;
				}
	 
				public void run() {
					try {
						_t.send(_msg);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}

			new Thread(new sender(msg, myTransport)).start();
		} else {
			myTransport.send(msg);
		}

  }	

  public void setTo(String s) throws javax.mail.internet.AddressException, javax.mail.MessagingException {
//    addresses[0] = new InternetAddress(s);
	
    msg.setRecipients(Message.RecipientType.TO, new InternetAddress().parse(s));
  }

  public void setBcc(String s) throws javax.mail.internet.AddressException, javax.mail.MessagingException {
//    addresses[0] = new InternetAddress(s);
	
    msg.setRecipients(Message.RecipientType.BCC, new InternetAddress().parse(s));
  }

  // added setCc(), dc 10-21-02.
  public void setCc(String s) throws javax.mail.internet.AddressException, javax.mail.MessagingException {
//    addresses[0] = new InternetAddress(s);
	
    msg.setRecipients(Message.RecipientType.CC, new InternetAddress().parse(s));
  }

  public void addTo(String s) throws javax.mail.internet.AddressException, javax.mail.MessagingException {
    Address myAddress = new InternetAddress(s);
	msg.addRecipient(Message.RecipientType.TO, myAddress);
  }

  public void setFrom(String s) throws javax.mail.MessagingException {
    msg.setFrom(new InternetAddress(s));
  }

  public void setSubject(String s) throws javax.mail.MessagingException {
    msg.setSubject(s);
  }

  public void setBody(String s) throws javax.mail.MessagingException {
	msg.setText(s);
  }
  
  public void setBody(String s, String mimetype) throws javax.mail.MessagingException {
	msg.setContent(s, mimetype);
  }
  public void setBody(Object body, String type) throws javax.mail.MessagingException{
	msg.setContent(body, type);
  }

	public static void main(String[] args) throws javax.mail.MessagingException
	{
		
		String email = args[0];

		SendMessage msg = new SendMessage();
		msg.setFrom(email);
		msg.setTo(email);
		msg.setSubject("normal test");
		msg.setBody("this is a normal test");

		Date start = new Date();
		msg.send();
		System.out.println("Normal: took " +(new Date().getTime()-start.getTime()) + "ms.");

		SendMessage msg2 = new SendMessage();
		msg2.setFrom(email);
		msg2.setTo(email);
		msg2.setSubject("threaded test");
		msg2.setBody("this is a threaded test");

		Date start2 = new Date();
		msg2.send(true);
		System.out.println("Threaded: took " +(new Date().getTime()-start2.getTime())+ "ms.");

	}
}
