 package org.alt60m.fsk.bean;

import org.alt60m.util.SendMessage;
//import org.alt60m.fsk.*;
import org.alt60m.fsk.model.dbio.*;

public class MailOrder implements java.io.Serializable {

    private FskOrder order;
    private SendMessage msg;

    public MailOrder() {
		try	{
			msg = new SendMessage();
		}
		catch (Exception e)
		{
			System.err.println(e.toString());
		}
	}

    public SendMessage getMessage() {
		return msg;
    }

    public void createConfirmation(FskOrder o) throws Exception {
	StringBuffer body = new StringBuffer();
	
	order = o;

	body.append("The following information is to confirm the Freshman Survival Kit order for " + order.getCampusName() + ".\n\nYou can go back to the staff.campuscrusadeforchrist.com website and change the contents of your kits and your shipping information until Monday, July 11th.  At that time we will pull the data offline to prepare for fulfillment.  If you have any questions regarding your order or fulfillment, you can email Dave Schlernitzauer at dave.schlernitzauer@uscm.org or call him at 407-826-2557.\n\nIt is our prayer that this strategy will encourage you, help you expose students to the gospel, and provide you with many opportunities to share your faith.\n\nIt is our privilege to serve you,\nThe FSK Team\nDan, Dave, Kirk, Kurt and Jonathan\n\n");

	body.append("Order Number: " + order.getFskOrderId());
	body.append("\n\nCampus Name: " + order.getCampusName());
	body.append("\nRegion: " + order.getRegion());
//	body.append("\nLocal Account Number: " + order.getLocalAcctNo1() + " " + order.getLocalAcctNo2() + " " + order.getLocalAcctNo3() + " " + order.getLocalAcctNo4());
	body.append("\n\nStaff");
	body.append("\n    Firstname: " + order.getStaffFirstName());
	body.append("\n    Lastname: " + order.getStaffLastName());
	body.append("\n    Phone: " + order.getStaffPhone());
	body.append("\n    E-mail: " + order.getStaffEmail());
	body.append("\n\nContact");
	body.append("\n    Firstname: " + order.getContactFirstName());
	body.append("\n    Lastname: " + order.getContactLastName());
	body.append("\n    Phone: " + order.getContactPhone());
	body.append("\n    Cell: " + order.getContactCell());
	body.append("\n    E-mail: " + order.getContactEmail());
	body.append("\n\nKit Shipping Info");
	body.append("\nName: " + order.getKitShipName());
	body.append("\nAddress 1: " + order.getKitShipAddress1());
	body.append("\nAddress 2: " + order.getKitShipAddress2());
	body.append("\nCity: " + order.getKitShipCity());
	body.append("\nState: " + order.getKitShipState());
	body.append("\nZip: " + order.getKitShipZip());
	body.append("\nPhone: " + order.getKitShipPhone());
	body.append("\n\nKit Contents");
	body.append("\nTotal Quantity of Kits this order: " + order.getTotalKits());
	body.append("\n1. Bag/Toy: ");
	body.append("\n    www.Waymore.org: " + order.getBagToyWay());
	body.append("\n    www.Notyourmamasreligion.com: " + order.getBagToyImp());
	body.append("\n    www.MyDestino.com: " + order.getBagToyDes());
	body.append("\n    www.EpicMovement.com: " + order.getBagToyEp());
	body.append("\n    www.EveryStudent.com: " + order.getBagToyESC());
	body.append("\n2. Scripture");
	body.append("\n    NIV NT: " + order.getBibleTwo());
	body.append("\n    My City, My God (NIrV NT): " + order.getBibleThree());
	body.append("\n    NIV Whole Bible: " + order.getBibleMisc());
	body.append("\n    Bilingual New Testament(Spanish/English): " + order.getBibleBilingual());
	body.append("\n3. Books");
	body.append("\n    More Than A Carpenter/Life of Jesus (Flipbook): " + order.getBookMTACLoJ());
	body.append("\n    The Case for Christ: " + order.getBookCaseForC());
    body.append("\n    The Case for Faith: " + order.getBookCaseForF());
	body.append("\n    Beyond Roots: " + order.getBookBeyond());
	body.append("\n    How to Survive in the US: " + order.getBookSurvUS());
	body.append("\n    Being Latino in Christ: " + order.getBookLatino());
	body.append("\n    Blue Like Jazz: " + order.getBookBlueJazz());
	body.append("\n4. Music");
	body.append("\n    Hip Hop & Rap & Gospel: " + order.getCdHipHop());
	body.append("\n    Pop Rock: " + order.getCdSetApart());
    body.append("\n    Alternative, Hard Rock: " + order.getCdMisc());
	body.append("\n5. DVD/CD-ROM");
	body.append("\n    REELS: " + order.getVideoDrinkRelDVD());
	body.append("\n    Uncensored DVD: " + order.getVideoMisc());
	body.append("\n    Impact DVD: " + order.getVideoImpactDVD());
    body.append("\n    Jesus Film CD ROM: " + order.getVideoJfpCD());

	msg.setTo(order.getStaffEmail());
	msg.setFrom("fsk@uscm.org");
	msg.setSubject("FSK Order: " + order.getFskOrderId());
	msg.setBody(body.toString());
    }


    public void send() throws Exception {
	msg.send();
    }
}