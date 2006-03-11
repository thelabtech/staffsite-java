/*
 * Created on Apr 16, 2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.alt60m.fsk.model.dbio;

import java.util.Date;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

/**
 * @author justin.sabelko
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class FskOrder extends DBIOEntity {

	private int fskOrderId = 0;
	private String campusName = "";
	private String region = "";
	private String staffFirstName = "";
	private String staffLastName = "";
	private String staffPhone = "";
	private String staffEmail = "";
	private Date dateCreated = null;
	private Date dateUpdated = null;
	private String contactFirstName = "";
	private String contactLastName = "";
	private String contactPhone = "";
	private String contactPager = "";
	private String contactCell = "";
	private String contactEmail = "";
	private String kitShipName = "";
	private String kitShipAddress1 = "";
	private String kitShipAddress2 = "";
	private String kitShipCity = "";
	private String kitShipState = "";
	private String kitShipZip = "";
	private String kitShipPhone = "";
	private String totalKits = "";
	private String bagToyImp = "";
	private String bagToyWay = "";
	private String bagToyDes = "";
	private String bagToyEp = "";
	private String bagToyESC = "";
	private String bagToyMisc = "";
	private String bibleIsiNT = "";
	private String bibleTwo = "";
	private String bibleThree = "";
	private String bibleMisc = "";
	private String bibleBilingual = "";
	private String videoRel = "";
	private String videoRelCD = "";
	private String videoThirsty = "";
	private String videoThirstyCD = "";
	private String videoDrinkRelDVD = "";
	private String videoChang = "";
	private String videoChangCD = "";
	private String videoSurfer = "";
	private String videoSurferCD = "";
	private String videoClimbing = "";
	private String videoClimbingCD = "";
	private String videoImpact = "";
	private String videoImpactCD = "";
	private String videoImpactDVD = "";
	private String videoTestimonyCD = "";
	private String videoJfpCD = "";
	private String videoJesusVCD = "";
	private String videoMisc = "";
	private String bookMTAC = "";
	private String bookMTACSpan = "";
	private String bookMTACLoJ = "";
	private String bookCaseForC = "";
	private String bookCaseForF = "";
	private String bookBeyond = "";
	private String bookLatino = "";
	private String bookBlueJazz = "";
	private String bookRelevant = "";
	private String bookSurvUS = "";
	private String bookMisc = "";
	private String cdHipHop = "";
	private String cdSetApart = "";
	private String cdMisc = "";
	private String cdHispanic = "";
	private String cardReg = "";
	private String cardAfAm = "";
	private String cardHispanic = "";
	private String cardAsian = "";
	private String planner = "";
	private int fk_Allocation = 0;
	
	public FskOrder() {
		super();
	}
	
	public FskOrder(int id) {
		fskOrderId = id;
		select();
	}

	/* (non-Javadoc)
	 * @see com.kenburcham.framework.dbio.DBIOEntity#localinit()
	 */
	public void localinit() throws DBIOEntityException {
		String table = "fsk_FskOrder";
		
		setMetadata("FskOrderId", "fskOrderID", "IDENTITY");
		setMetadata("CampusName", "campusName", table);
		setMetadata("Region", "region", table);
		setMetadata("StaffFirstName", "staffFirstName", table);
		setMetadata("StaffLastName", "staffLastName", table);
		setMetadata("StaffPhone", "staffPhone", table);
		setMetadata("StaffEmail", "staffEmail", table);
		setMetadata("DateCreated", "dateCreated", table);
		setMetadata("DateUpdated", "dateUpdated", table);
		setMetadata("ContactFirstName", "contactFirstName", table);
		setMetadata("ContactLastName", "contactLastName", table);
		setMetadata("ContactPhone", "contactPhone", table);
		setMetadata("ContactPager", "contactPager", table);
		setMetadata("ContactCell", "contactCell", table);
		setMetadata("ContactEmail", "contactEmail", table);
		setMetadata("KitShipName", "kitShipName", table);
		setMetadata("KitShipAddress1", "kitShipAddress1", table);
		setMetadata("KitShipAddress2", "kitShipAddress2", table);
		setMetadata("KitShipCity", "kitShipCity", table);
		setMetadata("KitShipState", "kitShipState", table);
		setMetadata("KitShipZip", "kitShipZip", table);
		setMetadata("KitShipPhone", "kitShipPhone", table);
		setMetadata("TotalKits", "totalKits", table);
		setMetadata("BagToyImp", "bagToyImp", table);
		setMetadata("BagToyWay", "bagToyWay", table);
		setMetadata("BagToyDes", "bagToyDes", table);
		setMetadata("BagToyEp", "bagToyEp", table);
		setMetadata("BagToyESC", "bagToyESC", table);
		setMetadata("BagToyMisc", "bagToyMisc", table);
		setMetadata("BibleIsiNT", "bibleIsiNT", table);
		setMetadata("BibleTwo", "bibleTwo", table);
		setMetadata("BibleThree", "bibleThree", table);
		setMetadata("BibleMisc", "bibleMisc", table);
		setMetadata("BibleBilingual", "bibleBilingual", table);
		setMetadata("VideoRel", "videoRel", table);
		setMetadata("VideoRelCD", "videoRelCD", table);
		setMetadata("VideoThirsty", "videoThirsty", table);
		setMetadata("VideoThirstyCD", "videoThirstyCD", table);
		setMetadata("VideoDrinkRelDVD", "videoDrinkRelDVD", table);
		setMetadata("VideoChang", "videoChang", table);
		setMetadata("VideoChangCD", "videoChangCD", table);
		setMetadata("VideoSurfer", "videoSurfer", table);
		setMetadata("VideoSurferCD", "videoSurferCD", table);
		setMetadata("VideoClimbing", "videoClimbing", table);
		setMetadata("VideoClimbingCD", "videoClimbingCD", table);
		setMetadata("VideoImpact", "videoImpact", table);
		setMetadata("VideoImpactCD", "videoImpactCD", table);
		setMetadata("VideoImpactDVD", "videoImpactDVD", table);
		setMetadata("VideoTestimonyCD", "videoTestimonyCD", table);
		setMetadata("VideoJfpCD", "videoJfpCD", table);
		setMetadata("VideoJesusVCD", "videoJesusVCD", table);
		setMetadata("VideoMisc", "videoMisc", table);
		setMetadata("BookMTAC", "bookMTAC", table);
		setMetadata("BookMTACSpan", "bookMTACSpan", table);
		setMetadata("BookMTACLoJ", "bookMTACLoJ", table);
		setMetadata("BookCaseForC", "bookCaseForC", table);
		setMetadata("BookCaseForF", "bookCaseForF", table);
		setMetadata("BookBeyond", "bookBeyond", table);
		setMetadata("BookBlueJazz", "bookBlueJazz", table);
		setMetadata("BookLatino", "bookLatino", table);
		setMetadata("BookRelevant", "bookRelevant", table);
		setMetadata("BookSurvUS", "bookSurvUS", table);
		setMetadata("BookMisc", "bookMisc", table);
		setMetadata("CdHipHop", "cdHipHop", table);
		setMetadata("CdSetApart", "cdSetApart", table);
		setMetadata("CdMisc", "cdMisc", table);
		setMetadata("CdHispanic", "cdHispanic", table);
		setMetadata("CardReg", "cardReg", table);
		setMetadata("CardAfAm", "cardAfAm", table);
		setMetadata("CardHispanic", "cardHispanic", table);
		setMetadata("CardAsian", "cardAsian", table);
		setMetadata("Planner", "planner", table);
		setMetadata("Fk_Allocation", "fk_Allocation", table);
		
		setAutodetectProperties(false);
	}

	/* (non-Javadoc)
	 * @see com.kenburcham.framework.dbio.DBIOEntity#isPKEmpty()
	 */
	public boolean isPKEmpty() {
		return (fskOrderId == 0);
	}

	/**
	 * @return
	 */
	public Allocation getAllocation() {
		return ( new Allocation( fk_Allocation ));
	}
	
	public String getBagToyDes() {
		return bagToyDes;
	}

	/**
	 * @return
	 */
	public String getBagToyEp() {
		return bagToyEp;
	}

	/**
	 * @return
	 */
	public String getBagToyESC() {
		return bagToyESC;
	}

	/**
	 * @return
	 */
	public String getBagToyImp() {
		return bagToyImp;
	}

	/**
	 * @return
	 */
	public String getBagToyMisc() {
		return bagToyMisc;
	}

	/**
	 * @return
	 */
	public String getBagToyWay() {
		return bagToyWay;
	}

	/**
	 * @return
	 */
	public String getBibleIsiNT() {
		return bibleIsiNT;
	}

	/**
	 * @return
	 */
	public String getBibleMisc() {
		return bibleMisc;
	}

	/**
	 * @return
	 */
	public String getBibleThree() {
		return bibleThree;
	}

	/**
	 * @return
	 */
	public String getBibleTwo() {
		return bibleTwo;
	}

	/**
	 * @return
	 */
	public String getBookBeyond() {
		return bookBeyond;
	}

	/**
	 * @return
	 */
	public String getBookCaseForC() {
		return bookCaseForC;
	}

	/**
	 * @return
	 */
	public String getBookCaseForF() {
		return bookCaseForF;
	}

	/**
	 * @return
	 */
	public String getBookMisc() {
		return bookMisc;
	}

	/**
	 * @return
	 */
	public String getBookMTAC() {
		return bookMTAC;
	}

	/**
	 * @return
	 */
	public String getBookMTACSpan() {
		return bookMTACSpan;
	}

	/**
	 * @return
	 */
	public String getBookRelevant() {
		return bookRelevant;
	}

	/**
	 * @return
	 */
	public String getBookSurvUS() {
		return bookSurvUS;
	}

	/**
	 * @return
	 */
	public String getCampusName() {
		return campusName;
	}

	/**
	 * @return
	 */
	public String getCardAfAm() {
		return cardAfAm;
	}

	/**
	 * @return
	 */
	public String getCardAsian() {
		return cardAsian;
	}

	/**
	 * @return
	 */
	public String getCardHispanic() {
		return cardHispanic;
	}

	/**
	 * @return
	 */
	public String getCardReg() {
		return cardReg;
	}

	/**
	 * @return
	 */
	public String getCdHipHop() {
		return cdHipHop;
	}

	/**
	 * @return
	 */
	public String getCdHispanic() {
		return cdHispanic;
	}

	/**
	 * @return
	 */
	public String getCdMisc() {
		return cdMisc;
	}

	/**
	 * @return
	 */
	public String getCdSetApart() {
		return cdSetApart;
	}

	/**
	 * @return
	 */
	public String getContactCell() {
		return contactCell;
	}

	/**
	 * @return
	 */
	public String getContactEmail() {
		return contactEmail;
	}

	/**
	 * @return
	 */
	public String getContactFirstName() {
		return contactFirstName;
	}

	/**
	 * @return
	 */
	public String getContactLastName() {
		return contactLastName;
	}

	/**
	 * @return
	 */
	public String getContactPager() {
		return contactPager;
	}

	/**
	 * @return
	 */
	public String getContactPhone() {
		return contactPhone;
	}

	/**
	 * @return
	 */
	public Date getDateCreated() {
		return dateCreated;
	}

	/**
	 * @return
	 */
	public Date getDateUpdated() {
		return dateUpdated;
	}

	/**
	 * @return
	 */
	public int getFk_Allocation() {
		return fk_Allocation;
	}

	public int getAllocationID() {
		return fk_Allocation;
	}

	public int getAllocationId() {
		return fk_Allocation;
	}

	/**
	 * @return
	 */
	public int getFskOrderId() {
		return fskOrderId;
	}

	public int getFskOrderID() {
		return fskOrderId;
	}

	/**
	 * @return
	 */
	public String getKitShipAddress1() {
		return kitShipAddress1;
	}

	/**
	 * @return
	 */
	public String getKitShipAddress2() {
		return kitShipAddress2;
	}

	/**
	 * @return
	 */
	public String getKitShipCity() {
		return kitShipCity;
	}

	/**
	 * @return
	 */
	public String getKitShipName() {
		return kitShipName;
	}

	/**
	 * @return
	 */
	public String getKitShipPhone() {
		return kitShipPhone;
	}

	/**
	 * @return
	 */
	public String getKitShipState() {
		return kitShipState;
	}

	/**
	 * @return
	 */
	public String getKitShipZip() {
		return kitShipZip;
	}

	/**
	 * @return
	 */
	public String getPlanner() {
		return planner;
	}

	/**
	 * @return
	 */
	public String getRegion() {
		return region;
	}

	/**
	 * @return
	 */
	public String getStaffEmail() {
		return staffEmail;
	}

	/**
	 * @return
	 */
	public String getStaffFirstName() {
		return staffFirstName;
	}

	/**
	 * @return
	 */
	public String getStaffLastName() {
		return staffLastName;
	}

	/**
	 * @return
	 */
	public String getStaffPhone() {
		return staffPhone;
	}

	/**
	 * @return
	 */
	public String getTotalKits() {
		return totalKits;
	}

	/**
	 * @return
	 */
	public String getVideoChang() {
		return videoChang;
	}

	/**
	 * @return
	 */
	public String getVideoChangCD() {
		return videoChangCD;
	}

	/**
	 * @return
	 */
	public String getVideoClimbing() {
		return videoClimbing;
	}

	/**
	 * @return
	 */
	public String getVideoClimbingCD() {
		return videoClimbingCD;
	}

	/**
	 * @return
	 */
	public String getVideoImpact() {
		return videoImpact;
	}

	/**
	 * @return
	 */
	public String getVideoImpactCD() {
		return videoImpactCD;
	}

	/**
	 * @return
	 */
	public String getVideoJesusVCD() {
		return videoJesusVCD;
	}

	/**
	 * @return
	 */
	public String getVideoJfpCD() {
		return videoJfpCD;
	}

	/**
	 * @return
	 */
	public String getVideoMisc() {
		return videoMisc;
	}

	/**
	 * @return
	 */
	public String getVideoRel() {
		return videoRel;
	}

	/**
	 * @return
	 */
	public String getVideoRelCD() {
		return videoRelCD;
	}

	/**
	 * @return
	 */
	public String getVideoSurfer() {
		return videoSurfer;
	}

	/**
	 * @return
	 */
	public String getVideoSurferCD() {
		return videoSurferCD;
	}

	/**
	 * @return
	 */
	public String getVideoTestimonyCD() {
		return videoTestimonyCD;
	}

	/**
	 * @return
	 */
	public String getVideoThirsty() {
		return videoThirsty;
	}

	/**
	 * @return
	 */
	public String getVideoThirstyCD() {
		return videoThirstyCD;
	}

	/**
	 * @param string
	 */
	public void setAllocation(Allocation a) {
		setFk_Allocation(a.getAllocationId());
	}
	
	public void setBagToyDes(String string) {
		bagToyDes = string;
	}

	/**
	 * @param string
	 */
	public void setBagToyEp(String string) {
		bagToyEp = string;
	}

	/**
	 * @param string
	 */
	public void setBagToyESC(String string) {
		bagToyESC = string;
	}

	/**
	 * @param string
	 */
	public void setBagToyImp(String string) {
		bagToyImp = string;
	}

	/**
	 * @param string
	 */
	public void setBagToyMisc(String string) {
		bagToyMisc = string;
	}

	/**
	 * @param string
	 */
	public void setBagToyWay(String string) {
		bagToyWay = string;
	}

	/**
	 * @param string
	 */
	public void setBibleIsiNT(String string) {
		bibleIsiNT = string;
	}

	/**
	 * @param string
	 */
	public void setBibleMisc(String string) {
		bibleMisc = string;
	}

	/**
	 * @param string
	 */
	public void setBibleThree(String string) {
		bibleThree = string;
	}

	/**
	 * @param string
	 */
	public void setBibleTwo(String string) {
		bibleTwo = string;
	}

	/**
	 * @param string
	 */
	public void setBookBeyond(String string) {
		bookBeyond = string;
	}

	/**
	 * @param string
	 */
	public void setBookCaseForC(String string) {
		bookCaseForC = string;
	}

	/**
	 * @param string
	 */
	public void setBookCaseForF(String string) {
		bookCaseForF = string;
	}

	/**
	 * @param string
	 */
	public void setBookMisc(String string) {
		bookMisc = string;
	}

	/**
	 * @param string
	 */
	public void setBookMTAC(String string) {
		bookMTAC = string;
	}

	/**
	 * @param string
	 */
	public void setBookMTACSpan(String string) {
		bookMTACSpan = string;
	}

	/**
	 * @param string
	 */
	public void setBookRelevant(String string) {
		bookRelevant = string;
	}

	/**
	 * @param string
	 */
	public void setBookSurvUS(String string) {
		bookSurvUS = string;
	}

	/**
	 * @param string
	 */
	public void setCampusName(String string) {
		campusName = string;
	}

	/**
	 * @param string
	 */
	public void setCardAfAm(String string) {
		cardAfAm = string;
	}

	/**
	 * @param string
	 */
	public void setCardAsian(String string) {
		cardAsian = string;
	}

	/**
	 * @param string
	 */
	public void setCardHispanic(String string) {
		cardHispanic = string;
	}

	/**
	 * @param string
	 */
	public void setCardReg(String string) {
		cardReg = string;
	}

	/**
	 * @param string
	 */
	public void setCdHipHop(String string) {
		cdHipHop = string;
	}

	/**
	 * @param string
	 */
	public void setCdHispanic(String string) {
		cdHispanic = string;
	}

	/**
	 * @param string
	 */
	public void setCdMisc(String string) {
		cdMisc = string;
	}

	/**
	 * @param string
	 */
	public void setCdSetApart(String string) {
		cdSetApart = string;
	}

	/**
	 * @param string
	 */
	public void setContactCell(String string) {
		contactCell = string;
	}

	/**
	 * @param string
	 */
	public void setContactEmail(String string) {
		contactEmail = string;
	}

	/**
	 * @param string
	 */
	public void setContactFirstName(String string) {
		contactFirstName = string;
	}

	/**
	 * @param string
	 */
	public void setContactLastName(String string) {
		contactLastName = string;
	}

	/**
	 * @param string
	 */
	public void setContactPager(String string) {
		contactPager = string;
	}

	/**
	 * @param string
	 */
	public void setContactPhone(String string) {
		contactPhone = string;
	}

	/**
	 * @param string
	 */
	public void setDateCreated(Date string) {
		dateCreated = string;
	}

	/**
	 * @param string
	 */
	public void setDateUpdated(Date string) {
		dateUpdated = string;
	}

	/**
	 * @param string
	 */
	public void setFk_Allocation(int string) {
		fk_Allocation = string;
	}

	public void setAllocationId(int string) {
		fk_Allocation = string;
	}

	public void setAllocationID(int string) {
		fk_Allocation = string;
	}

	/**
	 * @param string
	 */
	public void setFskOrderId(int string) {
		fskOrderId = string;
	}

	public void setFskOrderID(int string) {
		fskOrderId = string;
	}

	/**
	 * @param string
	 */
	public void setKitShipAddress1(String string) {
		kitShipAddress1 = string;
	}

	/**
	 * @param string
	 */
	public void setKitShipAddress2(String string) {
		kitShipAddress2 = string;
	}

	/**
	 * @param string
	 */
	public void setKitShipCity(String string) {
		kitShipCity = string;
	}

	/**
	 * @param string
	 */
	public void setKitShipName(String string) {
		kitShipName = string;
	}

	/**
	 * @param string
	 */
	public void setKitShipPhone(String string) {
		kitShipPhone = string;
	}

	/**
	 * @param string
	 */
	public void setKitShipState(String string) {
		kitShipState = string;
	}

	/**
	 * @param string
	 */
	public void setKitShipZip(String string) {
		kitShipZip = string;
	}

	/**
	 * @param string
	 */
	public void setPlanner(String string) {
		planner = string;
	}

	/**
	 * @param string
	 */
	public void setRegion(String string) {
		region = string;
	}

	/**
	 * @param string
	 */
	public void setStaffEmail(String string) {
		staffEmail = string;
	}

	/**
	 * @param string
	 */
	public void setStaffFirstName(String string) {
		staffFirstName = string;
	}

	/**
	 * @param string
	 */
	public void setStaffLastName(String string) {
		staffLastName = string;
	}

	/**
	 * @param string
	 */
	public void setStaffPhone(String string) {
		staffPhone = string;
	}

	/**
	 * @param string
	 */
	public void setTotalKits(String string) {
		totalKits = string;
	}

	/**
	 * @param string
	 */
	public void setVideoChang(String string) {
		videoChang = string;
	}

	/**
	 * @param string
	 */
	public void setVideoChangCD(String string) {
		videoChangCD = string;
	}

	/**
	 * @param string
	 */
	public void setVideoClimbing(String string) {
		videoClimbing = string;
	}

	/**
	 * @param string
	 */
	public void setVideoClimbingCD(String string) {
		videoClimbingCD = string;
	}

	/**
	 * @param string
	 */
	public void setVideoImpact(String string) {
		videoImpact = string;
	}

	/**
	 * @param string
	 */
	public void setVideoImpactCD(String string) {
		videoImpactCD = string;
	}

	/**
	 * @param string
	 */
	public void setVideoJesusVCD(String string) {
		videoJesusVCD = string;
	}

	/**
	 * @param string
	 */
	public void setVideoJfpCD(String string) {
		videoJfpCD = string;
	}

	/**
	 * @param string
	 */
	public void setVideoMisc(String string) {
		videoMisc = string;
	}

	/**
	 * @param string
	 */
	public void setVideoRel(String string) {
		videoRel = string;
	}

	/**
	 * @param string
	 */
	public void setVideoRelCD(String string) {
		videoRelCD = string;
	}

	/**
	 * @param string
	 */
	public void setVideoSurfer(String string) {
		videoSurfer = string;
	}

	/**
	 * @param string
	 */
	public void setVideoSurferCD(String string) {
		videoSurferCD = string;
	}

	/**
	 * @param string
	 */
	public void setVideoTestimonyCD(String string) {
		videoTestimonyCD = string;
	}

	/**
	 * @param string
	 */
	public void setVideoThirsty(String string) {
		videoThirsty = string;
	}

	/**
	 * @param string
	 */
	public void setVideoThirstyCD(String string) {
		videoThirstyCD = string;
	}

	/**
	 * @return
	 */
	public String getBibleBilingual() {
		return bibleBilingual;
	}

	/**
	 * @param string
	 */
	public void setBibleBilingual(String string) {
		bibleBilingual = string;
	}

	/**
	 * @return
	 */
	public String getBookMTACLoJ() {
		return bookMTACLoJ;
	}

	/**
	 * @param string
	 */
	public void setBookMTACLoJ(String string) {
		bookMTACLoJ = string;
	}

	/**
	 * @return
	 */
	public String getBookBlueJazz() {
		return bookBlueJazz;
	}

	/**
	 * @return
	 */
	public String getBookLatino() {
		return bookLatino;
	}

	/**
	 * @param string
	 */
	public void setBookBlueJazz(String string) {
		bookBlueJazz = string;
	}

	/**
	 * @param string
	 */
	public void setBookLatino(String string) {
		bookLatino = string;
	}

	/**
	 * @return
	 */
	public String getVideoDrinkRelDVD() {
		return videoDrinkRelDVD;
	}

	/**
	 * @param string
	 */
	public void setVideoDrinkRelDVD(String string) {
		videoDrinkRelDVD = string;
	}

	/**
	 * @return
	 */
	public String getVideoImpactDVD() {
		return videoImpactDVD;
	}

	/**
	 * @param string
	 */
	public void setVideoImpactDVD(String string) {
		videoImpactDVD = string;
	}

}
