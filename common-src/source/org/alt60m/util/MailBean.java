package org.alt60m.util;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class MailBean {
        Properties sysProperties = System.getProperties();
		boolean debugOn = false;
	    String smtpHost = "smtp.ccci.org";
		String pop3Host = "mail.uscm.org";
	    String INBOX = "INBOX";
	    String POP_MAIL="pop3";
	    String SMTP_MAIL="smtp";
	    String IMAP_MAIL="imap";

  /** Creates new MailBean */
  public MailBean() {
//	props.put("mail.smtp.host", "mail.uscm.org");
  }

	public String printNew(String UserName, String Password){
		String user = UserName;
		String password = Password;
		String outdata = "";
		int newMail = 0;
		
		try{
			javax.mail.Session mailsession = Session.getDefaultInstance(sysProperties, null);
			mailsession.setDebug(debugOn);

			Store store = mailsession.getStore(IMAP_MAIL);
			store.connect(pop3Host, -1, user, password);
			
			Folder folder = store.getDefaultFolder();
			if (folder == null){
				throw new NullPointerException("No default mail folder");
			}
			folder = folder.getFolder(INBOX);

			if (folder == null){
				throw new NullPointerException("Unable to get folder: " + folder);
			}
			folder.open(Folder.READ_WRITE);
			int totalMessages = folder.getMessageCount();
			if (totalMessages == 0){
				outdata="no";
				folder.close(false);
				store.close();
			}
			else{     
				Message[] messages = folder.getMessages();
				FetchProfile fp = new FetchProfile();
				fp.add(FetchProfile.Item.ENVELOPE);
				fp.add(FetchProfile.Item.FLAGS);
				fp.add("X-Mailer");
				folder.fetch(messages, fp);

				for (int i = 0; i < messages.length; i++){
					if (!messages[i].isSet(Flags.Flag.SEEN)){
						newMail++;
					}
				}
				folder.close(true);
				store.close();
				outdata = String.valueOf(newMail);
			}
		}
		catch (Exception e){
			outdata = "-";
		}

		return outdata;
	}

}
