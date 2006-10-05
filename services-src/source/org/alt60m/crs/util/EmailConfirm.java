package org.alt60m.crs.util;

import org.alt60m.util.SendMessage;
//import org.alt60m.crs.*;
import org.alt60m.crs.model.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.text.SimpleDateFormat;

public class EmailConfirm implements java.io.Serializable {
	private static Log log = LogFactory.getLog(EmailConfirm.class);
	private Conference conference;

	private Payment payment;

	//	private CRSConference crsconference;
	//	private CRSPayment crspayment;
	private SendMessage msg;

	public EmailConfirm() {
		try {
			msg = new SendMessage();
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}

	public SendMessage getMessage() {
		return msg;
	}

	public void createConfirmation(Conference c, String firstName,
			String lastName, String toEmail) {
		try {
			StringBuffer body = new StringBuffer();

			conference = c;

			body.append("Dear " + firstName + " " + lastName + ",\n\n");

			body.append("Thank you for pre-registering for the "
					+ conference.getName() + ".  ");
			body.append("Your preregistration is complete. ");
			body.append("If you have any questions about your pre-registration, email us at "
					+ conference.getContactEmail() + ".  ");
			body.append("We look forward to seeing you at the conference!\n\n");
			body.append("-- the " + conference.getName() + " Team");

			if (conference.getConfirmationEmail() != null) {
				body.append("\n\nP.S. " + conference.getConfirmationEmail());
			}

			msg.setTo(toEmail);
			msg.setFrom(conference.getContactEmail());
			msg.setSubject(conference.getName()
					+ " pre-registration confirmation");
			msg.setBody(body.toString());
		} catch (Exception e) {
			log.error(e, e);
		}
	}

	public void createCreditCardReceipt(Payment p, String cardNum,
			String monthExp, String yearExp, Object amount) {
		createReceipt(p, "Credit Card", cardNum, monthExp, yearExp, amount);
	}

	public void createScholarshipReceipt(Payment p, Object amount) {
		createReceipt(p, "Scholarship", "", "", "", amount);
	}

	public void createStaffAccountTransferReceipt(Payment p, String acctNum,
			Object amount) {
		createReceipt(p, "Staff Account Transfer", acctNum, "", "", amount);
	}

	public void createMinistryAccountTransferReceipt(Payment p,
			String ministry, Object amount) {
		createReceipt(p, "Ministry Account Transfer", ministry, "", "", amount);
	}

	public void createReceipt(Payment p, String paymentMethod, String cardNum,
			String monthExp, String yearExp, Object amount) {
		try {
			StringBuffer body = new StringBuffer();

			payment = p;

			org.alt60m.crs.model.Person person = payment.getRegistration()
					.getPerson();

			body.append("Dear "
					+ person.getFirstName()
					+ (person.getMiddleInitial() == null ? " " : " "
							+ person.getMiddleInitial() + " ")
					+ person.getLastName() + ",\n\n");

			body.append("Thank you for your payment.  ");
			body.append("This is your receipt. Save this for your records.\n\n");
			body.append("Conference Name: "
					+ payment.getRegistration().getConference().getName()
					+ "\n");
			body.append("Registrant ID: "
					+ payment.getRegistration().getRegistrationID() + "\n");
			body.append("Name: "
					+ person.getFirstName()
					+ (person.getMiddleInitial() == null ? " " : " "
							+ person.getMiddleInitial() + " ")
					+ person.getLastName() + "\n");
			if (payment.getRegistration()
					.getRegistrationType()
					.decodeProfile(3) > 0) {
				body.append("Address: " + person.getAddress1() + "\n");
				body.append("Address(cont.): " + person.getAddress2() + "\n");
				body.append("City, State Zip: " + person.getCity() + ", "
						+ person.getState() + " " + person.getZip() + "\n");
				body.append("Country: " + person.getCountry() + "\n");
			}
			body.append("E-mail: " + person.getEmail() + "\n");
			body.append("\n");
			body.append("Payment ID: " + payment.getPaymentID() + "\n");
			body.append("Payment Date: "
					+ (new SimpleDateFormat("MM/dd/yyyy")).format(payment.getPaymentDate())
					+ "\n");
			if (paymentMethod.equals("Credit Card")) {
				body.append("Payment Description: " + payment.getComment()
						+ "\n");
				body.append("Credit Card #, Expiration Date: " + cardNum + ", "
						+ monthExp + "/" + yearExp + "\n");
				body.append("Payment Amount: $" + amount + "\n");
			}
			if (paymentMethod.equals("Scholarship")) {
				body.append("Scholarship Contact Name and Phone Number: "
						+ payment.getComment() + "\n");
				body.append("Scholarship Amount: $" + amount + "\n");
			}
			if (paymentMethod.equals("Staff Account Transfer")) {
				body.append("Staff Account Transfer\n");
				body.append("Account Number: " + cardNum + "\n");
				body.append("Transfer Amount: $" + amount + "\n");
			}
			if (paymentMethod.equals("Ministry Account Transfer")) {
				body.append("Ministry Account Transfer - "+ payment.getBusinessUnit() + "/"+ payment.getOperatingUnit()+"/"+ payment.getDept()+"/"+payment.getProject()+"\n");
				body.append("Ministry Entity: " + cardNum + "\n");
				body.append("Transfer Amount: $" + amount + "\n");
			}
			msg.setTo(person.getEmail());
			msg.setFrom(payment.getRegistration()
					.getConference()
					.getContactEmail());
			msg.setSubject(payment.getRegistration().getConference().getName()
					+ " payment receipt");
			msg.setBody(body.toString());
		} catch (Exception e) {
			log.error(e, e);
		}
	}

	public void send() {
		try {
			msg.send();
		} catch (Exception e) {
			log.error(e, e);
		}
	}
}