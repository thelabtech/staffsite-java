package org.alt60m.crs.servlet;

import org.alt60m.servlet.Controller;
import org.alt60m.servlet.ActionResults;
import org.alt60m.crs.model.*;
import org.alt60m.crs.application.*;
import org.alt60m.crs.logic.CRSExport;
import org.alt60m.util.ArrayHelper;
import org.alt60m.util.SendMessage;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Priority;
import java.util.*;
import com.oreilly.servlet.MultipartRequest;
import javax.mail.*;

public class CRSAdmin extends Controller {
	private final String	APP_FOLDER				= "/crs/";

	private final String[]	AUTH_LEVELS				= { "staff", "admin", "uber" };

	private CRSApplication	crsApp;

	private final String	DEFAULT_ACTION			= "adminHome";

	private final String	DEFAULT_ERROR_VIEW		= "adminError";

	// Error messages:
	private final String	ERR_conferenceNotFound	= "The conference could not be located. This most likely happened because your browser has been inactive too long. Click continue and select your conference again.";

	private final String	ERR_notAuthenticated	= "You were not authenticated to use this conference, please hit continue and select the conference again.";

	private final String	VIEWS_FILE				= "/WEB-INF/crsadminviews.xml";

	public CRSAdmin() {
		crsApp = new CRSApplication();
	}

	public void addCommonQuestions(ActionContext ctx) {
		try {
			Hashtable req = ctx.getHashedRequest();
			String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");

			for (Enumeration e = req.keys(); e.hasMoreElements();) {
				String next = (String) e.nextElement();
				if ("I".equals((String) req.get(next)) || "R".equals((String) req.get(next))) {
					if (next.startsWith("Q")) {
						crsApp.addCommonQuestion(conferenceID, new Integer((String)ctx.getSessionValue("regTypeID")).intValue(), next.substring(1),
								((String) req.get(next)).equals("R"));
					}
				}
			}

			listRegTypeQuestions(ctx);
		} catch (Exception e) {
			goToErrorPage(ctx, e, "editQuestion");
		}
	}

	public void adminHome(ActionContext ctx) {
		try {
			ctx.setSessionValue("eventLoggedIn", null);
			ctx.setSessionValue("authLevel", null);
			ctx.goToView("adminHome");
		} catch (Exception e) {
			goToErrorPage(ctx, e, "adminHome");
		}
	}

	public void authenticate(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null && ctx.getSessionValue("requiredLevel") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				Conference c = crsApp.getConference(conferenceID);
				String password = ctx.getInputString("password");
				String url = (String) ctx.getSessionValue("authURL");

				if ("bwtq24".equals(password)) {
					ctx.setSessionValue("authLevel", AUTH_LEVELS[2]);
					if (url == null) {
						showConference(ctx);
					} else {
						ctx.getResponse().sendRedirect(url);
					}
				} else if (AUTH_LEVELS[0].equals(ctx.getInputString("requestedLevel"))
						&& AUTH_LEVELS[0].equals(ctx.getSessionValue("levelRequired"))
						&& c.getStaffPassword().equals(password)) {
					ctx.setSessionValue("authLevel", AUTH_LEVELS[0]);
					if (url == null) {
						showConference(ctx);
					} else {
						ctx.getResponse().sendRedirect(url);
					}
				} else if (AUTH_LEVELS[1].equals(ctx.getInputString("requestedLevel"))
						&& AUTH_LEVELS[0].equals(ctx.getSessionValue("levelRequired"))
						&& c.getPassword().equals(password)) {
					ctx.setSessionValue("authLevel", AUTH_LEVELS[1]);
					if (url == null) {
						showConference(ctx);
					} else {
						ctx.getResponse().sendRedirect(url);
					}
				} else if (AUTH_LEVELS[1].equals(ctx.getInputString("requestedLevel"))
						&& AUTH_LEVELS[1].equals(ctx.getSessionValue("levelRequired"))
						&& c.getPassword().equals(password)) {
					ctx.setSessionValue("authLevel", AUTH_LEVELS[1]);
					if (url == null) {
						showConference(ctx);
					} else {
						ctx.getResponse().sendRedirect(url);
					}
				} else {
					log.debug(password + " != 0:" + c.getStaffPassword() + " | 1:" + c.getPassword()
							+ " required:" + ctx.getSessionValue("levelRequired"));
					ar.putValue(
							"errorMsg",
							"You could not be authenticated, click \"Back\" to try again.  If you cannot login, contact the person listed on the right of the login page.");
					ar.putValue("nextAction", "");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}

		} catch (Exception e) {
			goToErrorPage(ctx, e, "adminPrepDownload");
		}
	}

	// Non action helper methods
	private boolean authenticated(String levelRequired, ActionContext ctx) {
		String eventLoggedIn = (String) ctx.getSessionValue("eventLoggedIn");
		ctx.setSessionValue("authURL", ctx.getRequest().getRequestURL().toString() + "?"
				+ ctx.getRequest().getQueryString());

		//		log.debug("Auth: " + ctx.getSessionValue("authLevel"));
		//		log.debug("Conference: " +
		// ctx.getSessionValue("eventLoggedIn"));

		ctx.setSessionValue("levelRequired", levelRequired);
		ctx.setSessionValue("loginAction", "showConference");

		if (AUTH_LEVELS[2].equals(ctx.getSessionValue("authLevel"))) {
			//			log.debug("auth[2]");
			return true;
		} else if (ctx.getSessionValue("loggedIn") != null && levelRequired.equals(AUTH_LEVELS[0])) {
			//			log.debug("auth[0]");
			if (ctx.getSessionValue("authLevel") == null) {
				//				log.debug("auth staffsite");
				ctx.setSessionValue("authLevel", AUTH_LEVELS[0]);
			}
			return true;
		} else if (ctx.getSessionValue("authLevel") == null) {
			//			log.debug("auth null");
			return false;
		} else if (ArrayHelper.indexOf((String) ctx.getSessionValue("authLevel"), AUTH_LEVELS) >= ArrayHelper.indexOf(
				levelRequired, AUTH_LEVELS)) {
			//			log.debug("auth old");
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				//			if (ctx.getSessionValue("eventLoggedIn") == null ||
				// ctx.getInputString("conferenceID") != null){
				//				log.debug("false" +
				// ctx.getSessionValue("eventLoggedIn") + " - " +
				// ctx.getInputString("conferenceID"));
				return false;
			} else {
				//				log.debug("true");
				return true;
			}
		} else {
			return false;
		}
	}

	public void cloneConference(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			//get a listing of all the conferences

			ar.addCollection("Conferences", crsApp.listConferences("ALL", "name", "ASC"));
			String conferenceID = ctx.getInputString("conferenceID") == null ? (ctx.getSessionValue("eventLoggedIn") == null ? "0"
					: (String) ctx.getSessionValue("eventLoggedIn"))
					: ctx.getInputString("conferenceID");

			ar.putValue("conferenceID", conferenceID);

			ctx.setReturnValue(ar);
			ctx.goToView("cloneConference");
		} catch (Exception e) {
			goToErrorPage(ctx, e, "listConferences");
		}
	}

	public void composeEmail(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			String returnTo = ctx.getInputString("returnTo");
			String emailType = ctx.getInputString("emailType");
			String id = ctx.getInputString("id");
			String conferenceId = (String) ctx.getSessionValue("eventLoggedIn");
			ar.putValue("returnTo", returnTo);
			ar.putValue("emailType", emailType);
			ar.putValue("id", id);
			if (ctx.getSessionValue("eventLoggedIn") == null && ctx.getInputString("reportID") != null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else {
				if (emailType.equals("incompleteRegistrants")) {
					if (id != null) {
						Report report = crsApp.getReport(id);
						com.kenburcham.framework.dbio.DBIOTransaction tx = report.getTransaction();
						tx.setSQL(report.getQuery() + conferenceId + " ORDER BY person.lastName");
						Vector results = new Vector();
						if (tx.getRecords(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,
								java.sql.ResultSet.CONCUR_UPDATABLE)) {
							java.sql.ResultSet rset = tx.getResultSet();
							while (rset.next()) {
								String registrationID = rset.getString(1);
								Registration reg = crsApp.getRegistration(registrationID);
								Person pers = reg.getPerson();
								results.add(pers);
							}
						}
						Conference conf = crsApp.getConference(conferenceId);
						ar.putObject("conference", conf);
						ar.addCollection("emailTo", results);
					}
					ctx.setReturnValue(ar);
					ctx.goToView("composeEmail");
				} else {
					ar.putValue("errorMsg", "The type of email that you are trying to compose is unknown:" + emailType);
					ar.putValue("nextAction", returnTo);
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "composeEmail");
		}
	}

	public void sendEmail(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			String returnTo = ctx.getInputString("returnTo");
			String emailType = ctx.getInputString("emailType");
			String id = ctx.getInputString("id");
			String conferenceId = (String) ctx.getSessionValue("eventLoggedIn");
			String subject = ctx.getInputString("subject");
			String emailContent = ctx.getInputString("emailContent");
			if (ctx.getSessionValue("eventLoggedIn") == null && ctx.getInputString("reportID") != null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else {
				if (emailType.equals("incompleteRegistrants")) {
					boolean successful = true;
					String errorMsg = "";
					if (id != null) {
						Report report = crsApp.getReport(id);
						com.kenburcham.framework.dbio.DBIOTransaction tx = report.getTransaction();
						tx.setSQL(report.getQuery() + conferenceId + " ORDER BY person.lastName");
						Vector results = new Vector();
						if (tx.getRecords(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,
								java.sql.ResultSet.CONCUR_UPDATABLE)) {
							java.sql.ResultSet rset = tx.getResultSet();
							Conference conf = crsApp.getConference(conferenceId);
							HttpServletRequest request = ctx.getRequest();
							String serverName = (request.getServerName().endsWith("campuscrusadeforchrist.com") ? "https://"
									: "http://")
									+ request.getServerName();
							while (rset.next()) {
								String registrationID = rset.getString(1);
								Registration reg = crsApp.getRegistration(registrationID);
								Person pers = reg.getPerson();
								try {
									SendMessage email = new SendMessage();
									email.setFrom(conf.getContactEmail());
									email.setTo(pers.getEmail());
									email.setSubject(subject);
									email.setBody("Dear " + pers.getFirstName() + ",\n\n" + emailContent + "\n\n"
											+ serverName + "/servlet/CRSRegister?action=userLogin&ConferenceID="
											+ conferenceId + "&regTypeID=existing");
									email.send();
								} catch (MessagingException me) {
									if (successful) {
										errorMsg = "The email failed to reach the following recipients:\n"
												+ pers.getEmail() + "\n";
										successful = false;
									} else {
										errorMsg += pers.getEmail() + "\n";
									}
								}
							}
						}
					}
					ctx.setReturnValue(ar);
					if (!successful) {
						ar.putValue("errorMsg", errorMsg);
						ar.putValue("nextAction", returnTo);
						ctx.setReturnValue(ar);
						ctx.goToView("error");
					} else if (returnTo.equals("listReports")) {
						listReports(ctx);
					} else {
						adminHome(ctx);
					}
				} else {
					ar.putValue("errorMsg", "The type of email that you are trying to compose is unknown:" + emailType);
					ar.putValue("nextAction", returnTo);
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "composeEmail");
		}
	}

	public void cloneReport(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null && ctx.getInputString("reportID") != null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else {
				Report r = crsApp.getReport(ctx.getInputString("reportID"));
				r.setReportID(0);
				ar.putObject("report", r);
				ctx.setReturnValue(ar);
				ctx.goToView("editReportDetails");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void confirmDeleteChildRegistration(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String registrationID = ctx.getInputString("registrationID");
				ChildRegistration r = crsApp.getChildRegistration(registrationID);
				ctx.setSessionValue("registrationDelete", registrationID);
				ar.putValue(
						"confirmMsg",
						"<B>WARNING:</B> Deleting <B>"
								+ r.getFirstName()
								+ " "
								+ r.getLastName()
								+ "'s</B> registration will remove it completely from the database. If you are sure you would like to delete this registration, click the \"Continue\" button below.");
				ar.putValue("nextAction", "deleteChildRegistration");
				ctx.setReturnValue(ar);
				ctx.goToView("confirm");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void confirmDeleteConference(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null && ctx.getInputString("conferenceID") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = ctx.getSessionValue("eventLoggedIn") == null ? ctx.getInputString("conferenceID")
						: (String) ctx.getSessionValue("eventLoggedIn");
				String registrations = String.valueOf(crsApp.countRegistrations(conferenceID));
				Conference conference = new Conference();
				conference = crsApp.getConference(conferenceID);

				ctx.setSessionValue("eventDelete", conferenceID);
				ar.putValue(
						"confirmMsg",
						"<B>WARNING:</B> Deleting the <B>"
								+ conference.getName()
								+ "</B> conference will remove it, including the <B>"
								+ registrations
								+ "</B> registrations and all of the customization (questions, payment options, etc), completely from the database.  If you are sure you want to delete this conference, click \"Continue\".  If you do not wish to delete this conference, click \"Back.\"");
				ar.putValue("nextAction", "deleteConference");
				ctx.setReturnValue(ar);
				ctx.goToView("confirm");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void confirmDeleteRegistration(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String registrationID = ctx.getInputString("registrationID");
				Registration r = crsApp.getRegistration(registrationID);
				ctx.setSessionValue("registrationDelete", registrationID);
				ar.putValue(
						"confirmMsg",
						"<B>WARNING:</B> Deleting <B>"
								+ r.getPerson().getFirstName()
								+ " "
								+ r.getPerson().getLastName()
								+ "'s</B> registration will remove it completely from the database, including the all answered questions and payment records. If you are sure you would like to delete this registration, click the \"Continue\" button below.");
				ar.putValue("nextAction", "deleteRegistration");
				ctx.setReturnValue(ar);
				ctx.goToView("confirm");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void confirmDeleteRegistrationType(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String regTypeID = ctx.getInputString("registrationTypeID");
				RegistrationType rt = crsApp.getRegistrationType(regTypeID);
				ctx.setSessionValue("registrationTypeDelete", regTypeID);
				ar.putValue(
						"confirmMsg",
						"<B>WARNING:</B> Deleting Registration Type <B>"
								+ rt.getLabel()
								+ "</B> will remove it completely from the database, including the all associated registrants, their answered questions and payment records. If you are sure you would like to delete this registration, click the \"Continue\" button below.");
				ar.putValue("nextAction", "deleteRegistrationType");
				ctx.setReturnValue(ar);
				ctx.goToView("confirm");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "confirmDeleteRegistrationType");
		}
	}

	public void createCloneRegistrationType(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else if (ctx.getInputString("cloneID") == null) {
				ar.putValue("errorMsg", "The registration type you were going to clone could not be found, please try again.");
				ar.putValue("nextAction", "listRegistrationTypes");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				int newRTID = crsApp.cloneRegistrationType(ctx.getInputString("cloneID"));
				RegistrationType rt = crsApp.getRegistrationType(String.valueOf(newRTID));
				rt.setLabel(ctx.getInputString("cloneLabel"));
				rt.update();
				
				ar.putObject("conference", crsApp.getConference(conferenceID));
				ar.putObject("RegistrationType",rt);
				ctx.setReturnValue(ar);
				ctx.goToView("editRegistrationType");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "listConferences");
		}
	}

	public void createCloneConference(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getInputString("cloneID") == null || ctx.getInputString("cloneName") == null) {
				ar.putValue("errorMsg", "The conference you were going to clone could not be found, please try again.");
				ar.putValue("nextAction", "cloneConference");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else {
				int conferenceID = crsApp.cloneConference(ctx.getInputString("cloneID"),
						ctx.getInputString("cloneName"));
				ctx.setSessionValue("eventLoggedIn", String.valueOf(conferenceID));
				ctx.setSessionValue("authLevel", AUTH_LEVELS[1]);
				editConferenceDetails(ctx);
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "listConferences");
		}
	}

	public void createConference(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			ctx.setSessionValue("eventLoggedIn", null);
			ctx.setSessionValue("authLevel", null);
			ctx.setSessionValue("newEvent", "true");
			ctx.setSessionValue("newRegType","true"); //used to force create one default regtype
			ar.putObject("conference", new Conference());
			ctx.setReturnValue(ar);
			ctx.goToView("editConferenceDetails");
		} catch (Exception e) {
			goToErrorPage(ctx, e, "createConference");
		}
	}

	public void deleteChildRegistration(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null || ctx.getSessionValue("registrationDelete") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String registrationID = (String) ctx.getSessionValue("registrationDelete");
				ctx.setSessionValue("registrationDelete", null);
				crsApp.deleteChildRegistration(registrationID);
				lookupRegistrations(ctx);
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void deleteConference(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null || ctx.getSessionValue("eventDelete") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventDelete");
				ctx.setSessionValue("eventDelete", null);
				crsApp.deleteConference(conferenceID);
				ctx.setReturnValue(ar);
				adminHome(ctx);
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void deleteCustomItem(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				if (ctx.getInputString("customItemID") != null) {
					if (crsApp.deleteCustomItem(ctx.getInputString("customItemID"))) {
						listCustomItems(ctx);
					} else {
						ar.putValue("errorMsg",
								"The custom item could not be located. To try again, hit the back button, otherwise click continue to start over.");
						ar.putValue("nextAction", "listCustomItems");
						ctx.setReturnValue(ar);
						ctx.goToView("error");
					}
				} else {
					ar.putValue("errorMsg",
							"The customItemID could not be found. To try again, hit the back button, otherwise click continue to start over.");
					ar.putValue("nextAction", "listCustomItems");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void deleteMerchandise(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				if (ctx.getInputString("merchandiseID") != null) {
					String merchandiseID = ctx.getInputString("merchandiseID");
					try {
						crsApp.deleteMerchandise(merchandiseID);
					} catch (Exception e) {
						ar.putValue("errorMsg",
								"The merchandise could not be located. To try again, hit the back button, otherwise click continue to start over.");
						ar.putValue("nextAction", "listMerchandise");
						ctx.setReturnValue(ar);
						ctx.goToView("error");
					}
					listMerchandise(ctx);
				} else {
					ar.putValue("errorMsg",
							"The merchandiseID could not be found. There was nothing to delete, click continue.");
					ar.putValue("nextAction", "listMerchandise");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void deletePayment(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String registrationID = (String) ctx.getInputString("paymentDelete");
				crsApp.deletePayment(registrationID);
				editRegistrationPayments(ctx);
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void deleteQuestion(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				if (ctx.getInputString("questionID") != null) {
					String questionID = ctx.getInputString("questionID");
					try {
						crsApp.deleteQuestion(questionID);
					} catch (Exception e) {
						ar.putValue("errorMsg",
								"The question could not be located. To try again, hit the back button, otherwise click continue to start over.");
						ar.putValue("nextAction", "listRegTypeQuestions");
						ctx.setReturnValue(ar);
						ctx.goToView("error");
					}
					listRegTypeQuestions(ctx);
				} else {
					ar.putValue("errorMsg",
							"The questionID could not be found. To try again, hit the back button, otherwise click continue to start over.");
					ar.putValue("nextAction", "adminHome");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void deleteRegistration(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null || ctx.getSessionValue("registrationDelete") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String registrationID = (String) ctx.getSessionValue("registrationDelete");
				ctx.setSessionValue("registrationDelete", null);
				crsApp.deleteRegistration(registrationID);
				lookupRegistrations(ctx);
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void deleteRegistrationType(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null || ctx.getSessionValue("registrationTypeDelete") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String regTypeID = (String) ctx.getSessionValue("registrationTypeDelete");
				ctx.setSessionValue("registrationTypeDelete", null);
				crsApp.deleteRegistrationType(regTypeID);
				listRegistrationTypes(ctx);
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "listRegistrationTypes");
		}
	}

	//Created: 7/25/02, DMB
	public void downloadDB(ActionContext ctx) {
		ActionResults ar = new ActionResults("adminPrepDownload");
		String eventId = (String) ctx.getSessionValue("eventLoggedIn");
		String baseFilePath = getServletContext().getRealPath(APP_FOLDER);
		try {
			CRSExport importExport = CRSExport.getInstance(baseFilePath);
			if (ctx.getInputString("Format") != null && ctx.getInputString("Format").equals("CSV")) {
				ar.addHashtable("Results", importExport.exportToCSV(Integer.parseInt(eventId)));
			} else if (ctx.getInputString("Template") != null) {
				Conference conf = crsApp.getConference(eventId);
				ar.addHashtable("Results", importExport.exportToAccess(Integer.parseInt(eventId), conf.getRegion(),
						ctx.getInputString("Template") + ".mdb"));
			} else {
				ar.addHashtable("Results", new Hashtable());
			}
			ar.putObject("conference", crsApp.getConference(eventId));
			ar.putValue("ConferenceID", eventId);
			ctx.setReturnValue(ar);
			ctx.goToView("downloadFile");
		} catch (Exception e) {
			goToErrorPage(ctx, e, "adminDownload");
		}
	}

	public void editConferenceDetails(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				ar.putObject("conference", crsApp.getConference(conferenceID));
				ctx.setReturnValue(ar);
				ctx.goToView("editConferenceDetails");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void listRegistrationTypes(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				ctx.setSessionValue("regTypeID", null);
				ctx.setSessionValue("newRegType", null);
				ctx.setSessionValue("firstRegType",null);
				ctx.setSessionValue("onlyOneRegType",null);
				
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				ar.putObject("conference", crsApp.getConference(conferenceID));

				Vector regTypesVector = new Vector();
				Iterator regTypes = crsApp.getConference(conferenceID).getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					Vector v = new Vector();
					v.add(String.valueOf(rt.getRegistrationTypeID()));
					v.add((String)rt.getLabel());
					v.add((String)rt.getDescription());
					regTypesVector.add(v);
				}
				ar.putObject("RegistrationTypes",regTypesVector);
				
				ctx.setReturnValue(ar);
				ctx.goToView("listRegistrationTypes");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
	
/*	
	public void saveRegistrationTypes(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");

				/* save to new regtype objects    */
/*				Iterator regTypes = crsApp.getConference(conferenceID).getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					Hashtable values = new Hashtable();
					values.put("Label",ctx.getInputString("label_"+rt.getRegistrationTypeID()));
					values.put("Description",ctx.getInputString("description_"+rt.getRegistrationTypeID()));
					rt.setMappedValues(values);
					rt.update();
				}
	
				/* save to old conference object */
/*				if (crsApp.saveConference(ctx.getHashedRequest())) {
					if ("true".equals(ctx.getSessionValue("newEvent")))
						editRegistrationTypeDetails(ctx);
					else
						showConference(ctx);
				} else {
					ar.putValue("errorMsg",
							"The conference could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "adminHome");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
*/
	
	private void goToRegTypeEditAction(String nextAction,ActionContext ctx)throws Exception{
		if("editRegistrationType".equals(nextAction))
			editRegistrationType(ctx);
		else if("editFinancialDetails".equals(nextAction))
			editFinancialDetails(ctx);
		else if("listRegTypeMerchandise".equals(nextAction))
			listRegTypeMerchandise(ctx);
		else if("editProfileQuestions".equals(nextAction))
			editProfileQuestions(ctx);
		else if("listRegTypeQuestions".equals(nextAction))
			listRegTypeQuestions(ctx);
		else //if("listRegistrationTypes".equals(nextAction))
			listRegistrationTypes(ctx);
		//else
			//throw new Exception(); 
	}


	public void editRegistrationType(ActionContext ctx) {
	/*	Clicking on the "Edit" button for any Registrant Type under the 
	 	"Manage Registrant Types" page in CRS will cause this code to run.
	 	This code will find what the RegistrationTypeID is from the 
	 	SessionValue and pass it along to the editRegistrationType page.
	*/
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				String regTypeID = null;
				if (ctx.getInputString("regTypeID") == null) {
					regTypeID = (String) ctx.getSessionValue("regTypeID");
				}
				else {
					regTypeID = (String) ctx.getInputString("regTypeID");
					ctx.setSessionValue("regTypeID", regTypeID);
				}
				RegistrationType rt = crsApp.getRegistrationType(regTypeID);
				ar.putObject("RegistrationType",rt);
				ar.putObject("conference", crsApp.getConference(conferenceID));

				ctx.setReturnValue(ar);
				ctx.goToView("editRegistrationType");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
/* DEPRECATED */	
/*	public void editRegistrationTypeDetails(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				ar.putObject("conference", crsApp.getConference(conferenceID));
				// get the registrationTypes
				Vector regTypesVector = new Vector();
				Iterator regTypes = crsApp.getConference(conferenceID).getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					regTypesVector.add(rt);
				}
				ar.putObject("RegistrationTypes",regTypesVector);

				ctx.setReturnValue(ar);
				ctx.goToView("editRegistrationTypeDetails");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
*/
/*	public void saveRegistrationTypeDetails(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");

				Iterator regTypes = crsApp.getConference(conferenceID).getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					Hashtable values = new Hashtable();
					values.put("DefaultDateArrive",ctx.getInputString("DefaultDateArrive_"+rt.getRegistrationTypeID()));
					values.put("DefaultDateLeave",ctx.getInputString("DefaultDateLeave_"+rt.getRegistrationTypeID()));
					values.put("AskSpouse",ctx.getInputString("AskSpouse_"+rt.getRegistrationTypeID()));
					values.put("AskChildren",ctx.getInputString("AskChildren_"+rt.getRegistrationTypeID()));
					rt.setMappedValues(values);
					rt.update();
				}
			
				if (crsApp.saveConference(ctx.getHashedRequest())) {
					if ("true".equals(ctx.getSessionValue("newEvent")))
						editFinancialDetails(ctx);
					else
						showConference(ctx);
				} else {
					ar.putValue("errorMsg",
							"The conference could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "adminHome");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
*/
	public void saveRegistrationType(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				Hashtable values = ctx.getHashedRequest();
				int regTypeID;
				String cID = (String)ctx.getSessionValue("eventLoggedIn");
				
				if ("0".equals(ctx.getInputString("RegistrationTypeID"))){
					if ("true".equals((String)ctx.getSessionValue("newRegType"))){
						regTypeID = crsApp.createRegistrationType(new Integer(cID).intValue(),"");
						values.put("RegistrationTypeID",String.valueOf(regTypeID));
						ctx.setSessionValue("regTypeID",String.valueOf(regTypeID));
					}
				} else				
					ctx.setSessionValue("regTypeID",ctx.getInputString("RegistrationTypeID"));

				if (crsApp.saveRegistrationType(values)) {
//					if (("true".equals((String)ctx.getSessionValue("newEvent")))||("true".equals((String)ctx.getSessionValue("newRegType")))){
					if ("true".equals((String)ctx.getSessionValue("newRegType"))){
						editFinancialDetails(ctx);
					}
					else{
						String nextAction= (ctx.getInputString("nextAction")==null||"".equals(ctx.getInputString("nextAction")))?"ListRegistrationTypes":ctx.getInputString("nextAction");
						goToRegTypeEditAction(nextAction,ctx);
					}
				} else {
					ar.putValue("errorMsg",
							"The registration type could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "listRegistrationTypes");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "saveRegistrationType");
		}
	}
/*
	public void editProfileQuestions(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				Vector regTypesVector = new Vector();
				Iterator regTypes = crsApp.getConference(conferenceID).getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					regTypesVector.add(rt);
				}

				ar.putObject("RegistrationTypes",regTypesVector);
				ar.putObject("conference", crsApp.getConference(conferenceID));
				ctx.setReturnValue(ar);
				ctx.goToView("editProfileQuestions");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
*/
	public void editProfileQuestions(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				ar.putObject("RegistrationType",crsApp.getRegistrationType((String) ctx.getSessionValue("regTypeID")));
				ar.putObject("conference", crsApp.getConference(conferenceID));
				ctx.setReturnValue(ar);
				ctx.goToView("editProfileQuestions");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void editCustomItem(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				if (ctx.getInputString("customItemID") != null) {
					String customItemID = ctx.getInputString("customItemID");
					ar.putObject("item", crsApp.getCustomItem(customItemID));
					ctx.setReturnValue(ar);
					ctx.goToView("editCustomItemDetails");
				} else {
					ar.putValue("errorMsg",
							"The custom item could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "listCustomItems");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void editDisplayOptions(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				ar.putObject("conference", crsApp.getConference(conferenceID));
				ctx.setReturnValue(ar);
				ctx.goToView("editDisplayOptions");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
/*
	public void editFinancialDetails(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				ar.putObject("conference", crsApp.getConference(conferenceID));

				//  handle N regtypes 
				Vector regTypesVector = new Vector();
				Iterator regTypes = crsApp.getConference(conferenceID).getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					regTypesVector.add(rt);
				}

				ar.putObject("RegistrationTypes",regTypesVector);
				ctx.setReturnValue(ar);
				ctx.goToView("editFinancialDetails");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
*/
	public void editFinancialDetails(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				ar.putObject("conference", crsApp.getConference(conferenceID));
//				String regTypeID = 
				RegistrationType rt = crsApp.getRegistrationType((String)ctx.getSessionValue("regTypeID"));

				ar.putObject("RegistrationType",rt);
				ctx.setReturnValue(ar);
				ctx.goToView("editFinancialDetails");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
/*
	public void editMerchandiseDetails(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				if (ctx.getInputString("merchandiseID") != null) {
					String merchandiseID = ctx.getInputString("merchandiseID");
					// get the registrationTypes for the dropdown menu
					Conference c = crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn"));
					Vector regTypesVector = new Vector();
					Iterator regTypes = c.getRegistrationTypes().iterator();
					while (regTypes.hasNext()) {
						RegistrationType rt = (RegistrationType) regTypes.next();
						Vector v = new Vector();
						v.add(String.valueOf(rt.getRegistrationTypeID()));
						v.add((String)rt.getLabel());
						regTypesVector.add(v);
					}
					ar.putObject("RegistrationTypes",regTypesVector);
					ar.putObject("merchandise", crsApp.getMerchandise(merchandiseID));
					ar.putValue("view", String.valueOf(crsApp.getMerchandise(merchandiseID).getRegistrationTypeID()));
					ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));
					ctx.setReturnValue(ar);
					ctx.goToView("editMerchandiseDetails");
				} else {
					ar.putValue("errorMsg",
							"The merchandise could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "listMerchandise");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
*/

	public void editMerchandiseDetails(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				if (ctx.getInputString("merchandiseID") != null) {
					String merchandiseID = ctx.getInputString("merchandiseID");
					// get the registrationTypes for the dropdown menu
					Conference c = crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn"));
					RegistrationType rt = crsApp.getRegistrationType((String) ctx.getSessionValue("regTypeID"));

					ar.putObject("RegistrationType",rt);
					ar.putObject("merchandise", crsApp.getMerchandise(merchandiseID));
					ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));
					ctx.setReturnValue(ar);
					ctx.goToView("editMerchandiseDetails");
				} else {
					ar.putValue("errorMsg",
							"The merchandise could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "listMerchandise");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
	
	public void editQuestionDetails(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				if (ctx.getInputString("questionID") != null) {
					String questionID = ctx.getInputString("questionID");
					String view = ctx.getInputString("view");
					String order = "";
					int orderCol = 0;

					if (ctx.getInputString("orderCol") != null)
						orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
					else
						orderCol = 0;

					if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
						order = "DESC";
					else
						order = "ASC";

					Question q = crsApp.getQuestion(questionID);
					
					RegistrationType rt = q.getRegistrationType();
					ar.putValue("label", rt.getLabel());
					ar.putObject("question", q);
					ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));
					ar.putValue("orderCol", String.valueOf(orderCol));
					ar.putValue("order", order);
					ar.putValue("view", String.valueOf(rt.getRegistrationTypeID()));
					ctx.setReturnValue(ar);
					ctx.goToView("editQuestionDetails");
				} else {
					ar.putValue("errorMsg",
							"The question could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "listRegTypeQuestions");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void editRegistration(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String registrationID = "";
				if (ctx.getInputString("registrationID") != null) {
					registrationID = ctx.getInputString("registrationID");

					ar.putObject("registration", crsApp.getRegistration(registrationID));
					ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));

					ctx.setReturnValue(ar);
					ctx.goToView("editRegistration");
					
				} else {
					ar.putValue("errorMsg",
							"The registration could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "lookupRegistrations");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void editChildRegistration(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String childRegistrationID = "";
				if (ctx.getInputString("childRegistrationID") != null) {
					childRegistrationID = ctx.getInputString("childRegistrationID");

					ChildRegistration cr = crsApp.getChildRegistration(childRegistrationID);
					ar.putObject("registration", cr);

					ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));

					ctx.setReturnValue(ar);

					ctx.goToView("editChildRegistration");
				} else {
					ar.putValue("errorMsg",
							"The registration could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "lookupRegistrations");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void editRegistrationMerchandise(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				if (ctx.getInputString("registrationID") != null) {
					String registrationID = ctx.getInputString("registrationID");
					Registration r = crsApp.getRegistration(registrationID);
					ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));
					ar.putObject("registration", r);

					ar.addCollection("choices", crsApp.listRegistrationMerchandise(registrationID, "displayOrder",
							"DESC"));
					ar.addCollection("merchandise", crsApp.listMerchandise(
							String.valueOf(r.getConferenceID()), r.getRegistrationTypeID(), 
							"displayOrder",	"ASC"));

					ctx.setReturnValue(ar);

					ctx.goToView("editRegistrationMerchandise");
				} else {
					ar.putValue("errorMsg",
							"The registration could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "lookupRegistrations");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void editRegistrationPayments(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else {
				if (ctx.getInputString("registrationID") != null) {
					String registrationID = ctx.getInputString("registrationID");

					ar.putObject("registration", crsApp.getRegistration(registrationID));

					ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));

					ar.addCollection("payments", crsApp.listRegistrationPayments(registrationID, "paymentDate", "ASC"));

					ar.putValue("registrationID", registrationID);
					ar.addHashtable("AccountSummary", crsApp.getAccountSummary(registrationID));

					ctx.setReturnValue(ar);

					ctx.goToView("listRegistrationPayments");
				} else {
					ar.putValue("errorMsg",
							"The registration could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "lookupRegistrations");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void editRegistrationQuestions(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				if (ctx.getInputString("registrationID") != null) {
					String registrationID = ctx.getInputString("registrationID");
					
					Registration r = crsApp.getRegistration(registrationID);

					ar.putObject("registration", crsApp.getRegistration(registrationID));
					
					ar.addCollection("questions", crsApp.listQuestions(
							(String) ctx.getSessionValue("eventLoggedIn"), r.getRegistrationTypeID(),"displayOrder", "ASC"));
					
					ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));

					ar.addCollection("answers", crsApp.listRegistrationAnswers(registrationID));

					ar.putValue("registrationID", ctx.getInputString("registrationID"));

					ctx.setReturnValue(ar);

					ctx.goToView("editRegistrationQuestions");
				} else {
					ar.putValue("errorMsg",
							"The registration could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "lookupRegistrations");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void editReport(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else {
				if (ctx.getInputString("reportID") != null) {
					String reportID = ctx.getInputString("reportID");
					ar.putObject("report", crsApp.getReport(reportID));
					ctx.setReturnValue(ar);
					ctx.goToView("editReportDetails");
				} else {
					ar.putValue("errorMsg",
							"The report could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "listReports");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	//Created: 10/29/2002 DMB
	//default error page handler
	public void goToErrorPage(ActionContext ctx, Exception e, String methodName) {
		ActionResults ar = new ActionResults();
		String exceptionText = e + "<BR>\n"; //+ e.getStackTrace()[0];
		//for(int i=1; !e.getStackTrace()[i].toString().startsWith("sun"); i++)
		//  exceptionText += "<BR>\n" + e.getStackTrace()[i];
		ar.putValue("exceptionText", exceptionText);
		ctx.setReturnValue(ar);
		ctx.goToErrorView();
		log.error("Failed to perform " + methodName + "().", e);
	}

	public void init() {
		log.debug("CRSAdmin.init()");
		super.setViewsFile(getServletContext().getRealPath(VIEWS_FILE));
		super.setDefaultAction(DEFAULT_ACTION);
		super.setDefaultErrorView(DEFAULT_ERROR_VIEW);
	}

/*	public void listCommonQuestions(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				int orderCol = 0;
				String order = "";
				String view = "";
				String[] orderFields = { "body", "answerType" };
				
				if (ctx.getInputString("orderCol") != null)
					orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
				else
					orderCol = 0;

				if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
					order = "DESC";
				else
					order = "ASC";

				view = ctx.getInputString("view");
//				if (ctx.getInputString("RegistrationTypeID") != null)	//override view
//					view = ctx.getInputString("RegistrationTypeID");

				RegistrationType rt = crsApp.getRegistrationType(view);
				ar.putValue("orderCol", String.valueOf(orderCol));
				ar.putValue("order", order);
				ar.putValue("view", view);
				ar.putValue("label",rt.getLabel());
				Vector commonQuestions = crsApp.listCommonQuestions(orderFields[orderCol], order);

				ar.addCollection("Questions", commonQuestions);
				ar.addCollection("QuestionsAdded", crsApp.listAddedQuestions(conferenceID, view, commonQuestions));

				ar.putObject("conference", crsApp.getConference(conferenceID));

				ctx.setReturnValue(ar);
				ctx.goToView("listCommonQuestions");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "listCustomItems");
		}
	}
*/
	public void listCommonQuestions(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				int orderCol = 0;
				String order = "";
				String[] orderFields = { "body", "answerType" };
				
				if (ctx.getInputString("orderCol") != null)
					orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
				else
					orderCol = 0;

				if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
					order = "DESC";
				else
					order = "ASC";

				RegistrationType rt = crsApp.getRegistrationType((String) ctx.getSessionValue("regTypeID"));
				ar.putValue("orderCol", String.valueOf(orderCol));
				ar.putValue("order", order);
				ar.putValue("label",rt.getLabel());
				Vector commonQuestions = crsApp.listCommonQuestions(orderFields[orderCol], order);

				ar.addCollection("Questions", commonQuestions);
				ar.addCollection("QuestionsAdded", crsApp.listAddedQuestions(conferenceID, (String) ctx.getSessionValue("regTypeID"), commonQuestions));

				ar.putObject("conference", crsApp.getConference(conferenceID));

				ctx.setReturnValue(ar);
				ctx.goToView("listCommonQuestions");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "listCustomItems");
		}
	}

	public void listConferences(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			//get a listing of all the conferences
			String currentRegion = "";
			String view = "";
			int orderCol = 0;
			String order = "";
			String[] orderFields = { "name", "preRegStart", "preRegEnd" };

			if (ctx.getInputString("currentRegion") != null)
				currentRegion = ctx.getInputString("currentRegion");
			else
				currentRegion = "ALL";

			if (ctx.getInputString("view") != null)
				view = ctx.getInputString("view");
			else
				view = "current";

			if (ctx.getInputString("orderCol") != null)
				orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
			else
				orderCol = 0;

			if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
				order = "DESC";
			else
				order = "ASC";

			ar.putValue("currentRegion", currentRegion);
			ar.putValue("view", view);
			ar.putValue("orderCol", String.valueOf(orderCol));
			ar.putValue("order", order);

			if (view.equals("current")) {
				ar.addCollection("Conferences", crsApp.listCurrentConferences(currentRegion, orderFields[orderCol],
						order));
			} else if (view.equals("archived")) {
				ar.addCollection("Conferences", crsApp.listArchivedConferences(currentRegion, orderFields[orderCol],
						order));
			} else {
				ar.addCollection("Conferences", crsApp.listConferences(currentRegion, orderFields[orderCol], order));
			}

			ctx.setSessionValue("eventLoggedIn", null);
			ctx.setSessionValue("authLevel", null);
			ctx.setReturnValue(ar);
			ctx.goToView("listConferences");
		} catch (Exception e) {
			goToErrorPage(ctx, e, "listConferences");
		}
	}

	public void listCustomItems(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				int orderCol = 0;
				String order = "";
				String[] orderFields = { "displayOrder", "title" };

				if (ctx.getInputString("orderCol") != null)
					orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
				else
					orderCol = 0;

				if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
					order = "DESC";
				else
					order = "ASC";

				ar.putValue("orderCol", String.valueOf(orderCol));
				ar.putValue("order", order);

				ar.addCollection("Items", crsApp.listCustomItems(conferenceID, orderFields[orderCol], order));
				ar.putObject("conference", crsApp.getConference(conferenceID));

				ctx.setReturnValue(ar);
				ctx.goToView("listCustomItems");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "listCustomItems");
		}
	}

/* gives overview listing of merchandise with tabs for each regtype */
	public void listMerchandise(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				String view = "";
				int orderCol = 0;
				int regTypeID = 0;
				String order = "";
				String[] orderFields = { "displayOrder", "name", "amount", "note", "required" };

	
				// get the registrationTypes! Only need the typeID and label
				Conference c = crsApp.getConference(conferenceID);
				Vector regTypesVector = new Vector();
				Iterator regTypes = c.getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					Vector v = new Vector();
					v.add(String.valueOf(rt.getRegistrationTypeID()));
					v.add((String)rt.getLabel());
					regTypesVector.add(v);
				}
				ar.putObject("RegistrationTypes",regTypesVector);
				
				if (ctx.getInputString("view") != null)
					view = ctx.getInputString("view");
				else{	/* set a default view: the first record encountered */
					Vector temp = new Vector((Vector)regTypesVector.get(0));
					view = (String) temp.get(0);
				}
				if (ctx.getInputString("RegistrationTypeID") != null)	//override view
					view = ctx.getInputString("RegistrationTypeID");

				if (ctx.getInputString("orderCol") != null)
					orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
				else
					orderCol = 0;

				if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
					order = "DESC";
				else
					order = "ASC";

				ar.putValue("view", view);
				ar.putValue("orderCol", String.valueOf(orderCol));
				ar.putValue("order", order);

				ar.addCollection("Merchandise", crsApp.listMerchandise(conferenceID, Integer.valueOf(view).intValue(), orderFields[orderCol],order));
				ar.putObject("conference", crsApp.getConference(conferenceID));

				ctx.setReturnValue(ar);
				ctx.goToView("listMerchandise");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "listMerchandise");
		}
	}

/* list the merchandise for one specific regtype  */
	public void listRegTypeMerchandise(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				String registrationTypeID = (String) ctx.getSessionValue("regTypeID");
				RegistrationType rt = crsApp.getRegistrationType(registrationTypeID);
				int orderCol = 0;
				int regTypeID = 0;
				String order = "";
				String[] orderFields = { "displayOrder", "name", "amount", "note", "required" };

	
				ar.putObject("RegistrationType",rt);
				
				if (ctx.getInputString("orderCol") != null)
					orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
				else
					orderCol = 0;

				if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
					order = "DESC";
				else
					order = "ASC";

				ar.putValue("orderCol", String.valueOf(orderCol));
				ar.putValue("order", order);

				ar.addCollection("Merchandise", crsApp.listMerchandise(conferenceID, Integer.valueOf(registrationTypeID).intValue(), orderFields[orderCol],order));
				ar.putObject("conference", crsApp.getConference(conferenceID));

				ctx.setReturnValue(ar);
				ctx.goToView("listRegTypeMerchandise");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "listRegTypeMerchandise");
		}
	}

/*	public void listQuestions(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				String view = "";
				int orderCol = 0;
				String order = "";
				String[] orderFields = { "displayOrder", "crs_questiontext.body", "QuestionText.answerType",
						"required", "crs_questiontext.status" };

				Vector regTypesVector = new Vector();
				Iterator regTypes = crsApp.getConference(conferenceID).getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					Vector v = new Vector();
					v.add(String.valueOf(rt.getRegistrationTypeID()));
					v.add((String)rt.getLabel());
					regTypesVector.add(v);
				}
				ar.putObject("RegistrationTypes",regTypesVector);

				if (ctx.getInputString("view") != null)
					view = ctx.getInputString("view");
				else{	
					Vector temp = new Vector((Vector)regTypesVector.get(0));
					view = (String) temp.get(0);
				}
				if (ctx.getInputString("RegistrationTypeID") != null)	//override view
					view = ctx.getInputString("RegistrationTypeID");

				if (ctx.getInputString("orderCol") != null)
					orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
				else
					orderCol = 0;

				if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
					order = "DESC";
				else
					order = "ASC";

				ar.putValue("view", view);
				ar.putValue("orderCol", String.valueOf(orderCol));
				ar.putValue("order", order);

				ar.addCollection("Questions", crsApp.listQuestions(conferenceID, Integer.valueOf(view).intValue(), orderFields[orderCol],order));
				ar.putObject("conference", crsApp.getConference(conferenceID));

				ctx.setReturnValue(ar);
				ctx.goToView("listQuestions");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "listQuestions");
		}
	}
*/
	public void listRegTypeQuestions(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				String registrationTypeID = (String) ctx.getSessionValue("regTypeID");
				RegistrationType rt = crsApp.getRegistrationType(registrationTypeID);
				int orderCol = 0;
				String order = "";
				String[] orderFields = { "displayOrder", "crs_questiontext.body", "QuestionText.answerType",
						"required", "crs_questiontext.status" };
						
				ar.putObject("RegistrationType",rt);

				if (ctx.getInputString("orderCol") != null)
					orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
				else
					orderCol = 0;

				if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
					order = "DESC";
				else
					order = "ASC";

				ar.putValue("orderCol", String.valueOf(orderCol));
				ar.putValue("order", order);

				ar.addCollection("Questions", crsApp.listQuestions(conferenceID, Integer.valueOf(registrationTypeID).intValue(), orderFields[orderCol],order));
				ar.putObject("conference", crsApp.getConference(conferenceID));

				ctx.setReturnValue(ar);
				ctx.goToView("listRegTypeQuestions");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "listRegTypeQuestions");
		}
	}

	public void listReports(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else {
				String view = "";
				Conference c = crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn"));

				/*  handle N regtypes */
				Vector regTypesVector = new Vector();
				Iterator regTypes = c.getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					Vector v = new Vector();
					v.add(String.valueOf(rt.getRegistrationTypeID()));
					v.add((String)rt.getLabel());
					regTypesVector.add(v);
				}
				if (ctx.getInputString("view") != null)
					view = ctx.getInputString("view");
				else{	/* set a default view: the first record encountered */
					view = "general";
				}
				ar.putObject("RegistrationTypes",regTypesVector);
				ar.putValue("view",view);

				if (view.equals("general")) {
					ar.addCollection("reports", crsApp.listGeneralReports());
				} else {
					ar.addCollection("reports", crsApp.listTypeReports());
				}
				ar.putObject("conference", c);

				ctx.setReturnValue(ar);
				ctx.goToView("listReports");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "createConference");
		}
	}

	public void login(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null && ctx.getInputString("conferenceID") == null
					&& ctx.getSessionValue("levelRequired") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else {
				String conferenceID = ctx.getSessionValue("eventLoggedIn") == null ? ctx.getInputString("conferenceID")
						: (String) ctx.getSessionValue("eventLoggedIn");
				conferenceID = ctx.getInputString("conferenceID") == null ? conferenceID
						: ctx.getInputString("conferenceID");
				ctx.setSessionValue("eventLoggedIn", conferenceID);
				ar.putObject("conference", crsApp.getConference(conferenceID));
				ctx.setReturnValue(ar);
				ctx.goToView("challengeLogin");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void lookupAdvancedRegistrations(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else if (ctx.getSessionValue("lookupURL") != null
					&& !ctx.getLastLastAction().equals("lookupRegistrations")
					&& !ctx.getLastLastAction().equals("lookupAdvancedRegistrations")) {
				String url = (String) ctx.getSessionValue("lookupURL");
				ctx.setSessionValue("lookupURL", null);
				ctx.getResponse().sendRedirect(url);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				String view = "";
				String viewLabel = "";
				int orderCol;
				String order = "";
				int offset;
				int size;
				String[] orderFields = { "lastName, firstName", "gender, lastName, firstName",
						"campus, lastName, firstName", "preRegistered, lastName, firstName",
						"registrationDate, lastName, firstName" };
				ctx.setSessionValue("lookupURL", ctx.getRequest().getRequestURL().toString() + "?"
						+ ctx.getRequest().getQueryString());

				/*  handle N regtypes */
				Vector regTypesVector = new Vector();
				Iterator regTypes = crsApp.getConference(conferenceID).getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					Vector v = new Vector();
					v.add(String.valueOf(rt.getRegistrationTypeID()));
					v.add((String)rt.getLabel());
					regTypesVector.add(v);
				}
				ar.putObject("RegistrationTypes",regTypesVector);

				if (ctx.getInputString("view") != null){
					view = ctx.getInputString("view");
					if (!view.equals("ALL"))
						viewLabel=crsApp.getRegistrationType(view).getLabel();
					else viewLabel="ALL";
				}
				else{	/* set a default view: the first record encountered */
					Vector temp = new Vector((Vector)regTypesVector.get(0));
					view = (String) temp.get(0);
					viewLabel = (String)temp.get(1);
				}

				if (ctx.getInputString("orderCol") != null)
					orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
				else
					orderCol = 0;

				if (ctx.getInputString("offset") != null)
					offset = Integer.parseInt(ctx.getInputString("offset"));
				else
					offset = 1;

				if (ctx.getInputString("size") != null)
					size = Integer.parseInt(ctx.getInputString("size"));
				else
					size = 10;

				if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
					order = "DESC";
				else
					order = "ASC";

				ar.putValue("view", view);
				ar.putValue("viewLabel", viewLabel);
				ar.putValue("orderCol", String.valueOf(orderCol));
				ar.putValue("offset", String.valueOf(offset));
				ar.putValue("size", String.valueOf(size));
				ar.putValue("order", order);

				String firstName = ctx.getInputString("firstName") == null ? "" : ctx.getInputString("firstName");
				ar.putValue("firstName", firstName);
				String lastName = ctx.getInputString("lastName") == null ? "" : ctx.getInputString("lastName");
				ar.putValue("lastName", lastName);
				String region = ctx.getInputString("region") == null ? "" : ctx.getInputString("region");
				ar.putValue("region", region);
				String state = ctx.getInputString("state") == null ? "" : ctx.getInputString("state");
				ar.putValue("state", state);
				String localLevelID = ctx.getInputString("localLevelID") == null ? ""
						: ctx.getInputString("localLevelID");
				ar.putValue("localLevelID", localLevelID);
				String Campus = ctx.getInputString("Campus") == null ? "" : ctx.getInputString("Campus");
				ar.putValue("Campus", Campus);

				if (!"".equals(firstName) || !"".equals(lastName) || !"".equals(region) || !"".equals(Campus)
						|| !"".equals(state) || !"".equals(localLevelID)) {
					if (view.equals("ALL")) view="-1";
					Vector regs = new Vector(crsApp.searchRegistrationsAdvanced(firstName, lastName, region, state,
							localLevelID, Campus.replaceAll("'", "''"), Integer.valueOf(view).intValue(), conferenceID, orderFields[orderCol],
							order, offset, size));
					ar.putValue("maxSize", (regs.remove(0)).toString());
					ar.addCollection("Registrations", regs);
				}

				ar.addCollection("localLevels",
						new org.alt60m.ministry.model.dbio.LocalLevel().selectList("name <> '' ORDER BY name ASC"));

				ar.putObject("conference", crsApp.getConference(conferenceID));

				ctx.setReturnValue(ar);
				ctx.goToView("lookupAdvancedRegistration");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "lookupRegistrations");
		}
	}

	public void lookupPerson(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else {
				int orderCol = 0;
				String order = "";
				String[] orderFields = { "firstName", "lastName" };
				int offset;
				int size;

				if (ctx.getInputString("orderCol") != null)
					orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
				else
					orderCol = 0;

				if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
					order = "DESC";
				else
					order = "ASC";

				if (ctx.getInputString("offset") != null)
					offset = Integer.parseInt(ctx.getInputString("offset"));
				else
					offset = 1;

				if (ctx.getInputString("size") != null)
					size = Integer.parseInt(ctx.getInputString("size"));
				else
					size = 10;

				if (ctx.getInputString("nextVar") != null)
					ar.putValue("nextVar", ctx.getInputString("nextVar"));
				else
					ar.putValue("nextVar", "personID");

				ar.putValue("offset", String.valueOf(offset));
				ar.putValue("size", String.valueOf(size));
				ar.putValue("orderCol", String.valueOf(orderCol));
				ar.putValue("order", order);
				ar.putValue("nextAction", ctx.getInputString("nextAction"));

				String firstName = ctx.getInputString("firstName") == null ? "" : ctx.getInputString("firstName");
				String lastName = ctx.getInputString("lastName") == null ? "" : ctx.getInputString("lastName");
				ar.putValue("firstName", firstName);
				ar.putValue("lastName", lastName);
				ar.putValue("lookupMessage", ctx.getInputString("lookupMessage"));
				if (lastName != "") {
					Vector sp = new Vector(crsApp.searchPersons(firstName, lastName, orderFields[orderCol], order,
							offset, size));
					ar.putValue("maxSize", (sp.remove(0)).toString());
					ar.addCollection("persons", sp);
				}
				ar.addHashtable("request", ctx.getHashedRequest());
				ctx.setReturnValue(ar);
				ctx.goToView("lookupPerson");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showPerson");
		}

	}

	public void lookupRegistrations(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else if (ctx.getSessionValue("lookupURL") != null
					&& !ctx.getLastLastAction().equals("lookupRegistrations")
					&& !ctx.getLastLastAction().equals("lookupAdvancedRegistrations")) {
				String url = (String) ctx.getSessionValue("lookupURL");
				ctx.setSessionValue("lookupURL", null);
				ctx.getResponse().sendRedirect(url);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				String view = "";
				String viewLabel = "";
				int orderCol;
				String order = "";
				int offset;
				int size;
				String[] orderFields = { "lastName, firstName", "gender, lastName, firstName",
						"campus, lastName, firstName", "preRegistered, lastName, firstName",
						"registrationDate, lastName, firstName" };
				ctx.setSessionValue("lookupURL", ctx.getRequest().getRequestURL().toString() + "?"
						+ ctx.getRequest().getQueryString());

				/*  handle N regtypes */
				Vector regTypesVector = new Vector();
				Iterator regTypes = crsApp.getConference(conferenceID).getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					Vector v = new Vector();
					v.add(String.valueOf(rt.getRegistrationTypeID()));
					v.add((String)rt.getLabel());
					regTypesVector.add(v);
				}
				ar.putObject("RegistrationTypes",regTypesVector);

				if (ctx.getInputString("view") != null){
					view = ctx.getInputString("view");
					if (!view.equals("ALL"))
						viewLabel=crsApp.getRegistrationType(view).getLabel();
					else viewLabel="ALL";
				}
				else{	/* set a default view: the first record encountered */
					Vector temp = new Vector((Vector)regTypesVector.get(0));
					view = (String) temp.get(0);
					viewLabel = (String)temp.get(1);
				}

				if (ctx.getInputString("orderCol") != null)
					orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
				else
					orderCol = 0;

				if (ctx.getInputString("offset") != null)
					offset = Integer.parseInt(ctx.getInputString("offset"));
				else
					offset = 1;

				if (ctx.getInputString("size") != null)
					size = Integer.parseInt(ctx.getInputString("size"));
				else
					size = 10;

				if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
					order = "DESC";
				else
					order = "ASC";

				ar.putValue("view", view);
				ar.putValue("viewLabel", viewLabel);
				ar.putValue("orderCol", String.valueOf(orderCol));
				ar.putValue("offset", String.valueOf(offset));
				ar.putValue("size", String.valueOf(size));
				ar.putValue("order", order);

				String firstName = ctx.getInputString("firstName") == null ? ""
						: ctx.getInputString("firstName");
				String lastName = ctx.getInputString("lastName") == null ? ""
						: ctx.getInputString("lastName");
				ar.putValue("firstName", firstName);
				ar.putValue("lastName", lastName);

				if (view.equals("ALL"))
					view = "-1";
				Vector regs = new Vector(crsApp.searchRegistrationsByName(
						firstName, lastName, Integer.valueOf(view).intValue(),
						conferenceID, orderFields[orderCol], order, offset,
						size));
				ar.putValue("maxSize", (regs.remove(0)).toString());
				ar.addCollection("Registrations", regs);

				ar.putObject("conference", crsApp.getConference(conferenceID));

				ctx.setReturnValue(ar);
				ctx.goToView("lookupRegistration");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "lookupRegistrations");
		}
	}

	public void newCustomItem(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				CustomItem ci = new CustomItem();
				ar.putObject("item", ci);
				ctx.setReturnValue(ar);
				ctx.goToView("editCustomItemDetails");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void newRegistrationType(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				ar.putObject("conference", crsApp.getConference(conferenceID));
				RegistrationType rt = new RegistrationType();
				ar.putObject("RegistrationType", rt);
				ctx.setSessionValue("newRegType","true");
				ctx.setReturnValue(ar);
				ctx.goToView("editRegistrationType");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "listRegistrationTypes");
		}
	}

/*	public void newMerchandise(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				// get the registrationTypes!
				Conference c = crsApp.getConference(conferenceID);
				Vector regTypesVector = new Vector();
				Iterator regTypes = c.getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					Vector v = new Vector();
					v.add(String.valueOf(rt.getRegistrationTypeID()));
					v.add((String)rt.getLabel());
					regTypesVector.add(v);
				}
				
				Merchandise m = new Merchandise();
				m.setRegistrationTypeID(Integer.valueOf(ctx.getInputString("view")).intValue());
				ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));
				ar.putObject("RegistrationTypes",regTypesVector);
				ar.putObject("merchandise", m);
				ar.putValue("view",ctx.getInputString("view"));
				ctx.setReturnValue(ar);
				ctx.goToView("editMerchandiseDetails");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

*/
	public void newMerchandise(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				String regTypeID = (String)	ctx.getSessionValue("regTypeID");	
				Conference c = crsApp.getConference(conferenceID);
				RegistrationType rt = crsApp.getRegistrationType(regTypeID);
				
				Merchandise m = new Merchandise();
				m.setRegistrationTypeID(Integer.valueOf(regTypeID).intValue());
				ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));
				ar.putObject("RegistrationType",rt);
				ar.putObject("merchandise", m);

				ctx.setReturnValue(ar);
				ctx.goToView("editMerchandiseDetails");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

/*	public void newQuestion(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				RegistrationType rt = crsApp.getRegistrationType(ctx.getInputString("view"));
				ar.putValue("label",rt.getLabel());
				ar.putValue("view",ctx.getInputString("view"));
				Question q = new Question();
				QuestionText qt = new QuestionText();
				qt.setStatus("custom");
				q.setQuestionText(qt);
				q.setRegistrationTypeID(ctx.getInputString("view"));
				ar.putObject("question", q);
				ar.putValue("order", ctx.getInputString("order"));
				ar.putValue("orderCol", ctx.getInputString("orderCol"));
				ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));
				ctx.setReturnValue(ar);
				ctx.goToView("editQuestionDetails");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
*/
public void newQuestion(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				RegistrationType rt = crsApp.getRegistrationType((String) ctx.getSessionValue("regTypeID"));
				ar.putValue("label",rt.getLabel());
				Question q = new Question();
				QuestionText qt = new QuestionText();
				qt.setStatus("custom");
				q.setQuestionText(qt);
				q.setRegistrationTypeID(rt.getRegistrationTypeID());
				ar.putObject("question", q);
				ar.putValue("order", ctx.getInputString("order"));
				ar.putValue("orderCol", ctx.getInputString("orderCol"));
				ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));
				ctx.setReturnValue(ar);
				ctx.goToView("editQuestionDetails");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void newRegistration(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else if (ctx.getInputString("foundID") == null) {
				ar.putValue("nextAction", "newRegistration");
				ar.putValue("nextVar", "foundID");
				ar.putValue("lookupMessage", "Select the person to be registered");
				ar.addHashtable("request", ctx.getHashedRequest());
				ctx.setReturnValue(ar);
				ctx.goToView("lookupPerson");
			} else {
				Registration r = crsApp.getRegistrationByPersonID(ctx.getInputString("foundID"),
						(String) ctx.getSessionValue("eventLoggedIn"));
				int registrationID = r.getRegistrationID();
				if (r.isPKEmpty()) { // If new registration, create it and assoc
					// the person
					Person p = crsApp.getPerson(ctx.getInputString("foundID"));
					p.updateNoDate();  // Persists just to make sure we have address records...

					Conference c = crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn"));
					registrationID = crsApp.createRegistration(Integer.valueOf(ctx.getInputString("type")).intValue(), p, c);
					r.setRegistrationID(registrationID);
					r.select();

					ar.putObject("registration", crsApp.getRegistration(registrationID));
					ar.putObject("RegistrationType", crsApp.getRegistrationType(ctx.getInputString("type")));

					// Add full conference payment
					crsApp.updatePayments(String.valueOf(registrationID));

					ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));

					ctx.setReturnValue(ar);

					ctx.goToView("editRegistration");
				} else { // throw error, make them look for someone else
					ar.putValue(
							"errorMsg",
							r.getPerson().getFirstName()
									+ " "
									+ r.getPerson().getLastName()
									+ " has previously registered for this conference as a "
									+ r.getRegistrationType().getLabel()
									+ ". Hit back to find a different person, or continue to return to the Manage Registrants page.");
					ar.putValue("nextAction", "lookupRegistrations");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showPerson");
		}
	}

	public void newReport(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else {
				Report r = new Report();
				ar.putObject("report", r);
				ctx.setReturnValue(ar);
				ctx.goToView("editReportDetails");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void outputXML(javax.servlet.http.HttpServletResponse res, String _XML) throws Exception {
		res.setContentType("text/xml");
		java.io.PrintWriter out = res.getWriter();

		out.println(_XML);
		out.flush();
	}

	public void prepDownload(ActionContext ctx) {
		ActionResults ar = new ActionResults("adminPrepDownload");
		String eventId = (String) ctx.getSessionValue("eventLoggedIn");
		try {
			String baseFilePath = getServletContext().getRealPath(APP_FOLDER);
			CRSExport.getInstance(baseFilePath).initFolders(); //Makes sure that
			// the
			// import/export
			// directories
			// exsist.
			ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));
			ar.putValue("ConferenceID", eventId);
			ctx.setReturnValue(ar);
			ctx.goToView("prepDownload");
		} catch (Exception e) {
			goToErrorPage(ctx, e, "adminPrepDownload");
		}
	}

	public void reload() {
		super.setViewsFile(getServletContext().getRealPath(VIEWS_FILE));
	}

	public void reportXML(ActionContext ctx) {
		try {
			int offset;
			int size;
			int orderCol;
			String order = "";

			if (ctx.getInputString("orderCol") != null)
				orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
			else
				orderCol = 0;

			if (ctx.getInputString("offset") != null)
				offset = Integer.parseInt(ctx.getInputString("offset"));
			else
				offset = 1;

			if (ctx.getInputString("size") != null)
				size = Integer.parseInt(ctx.getInputString("size"));
			else
				size = 10;

			if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
				order = "DESC";
			else
				order = "ASC";

			if ("general".equals(ctx.getInputString("view")))
				outputXML(ctx.getResponse(),
						crsApp.reportXML(ctx.getInputString("reportID"), ctx.getInputString("conferenceID"), orderCol, order, offset, size));
			else
				outputXML(ctx.getResponse(),
						crsApp.reportXML(ctx.getInputString("reportID"), ctx.getInputString("conferenceID"), ctx.getInputString("view"), orderCol, order, offset, size));

		} catch (Exception e) {
			goToErrorPage(ctx, e, "reportXML");
		}
	}

	/** ***************************************************************************** */
	//Created: 10/29/2002 DMB
	//Generates an exception for testing purposes.
	public void sampleError(ActionContext ctx) {
		try {
			String test = null;
			if (test.equals("EXCEPTION! OUCH"))
				;
		} catch (Exception e) {
			goToErrorPage(ctx, e, "sampleError");
		}
	}

	public void saveConferenceDetails(ActionContext ctx) {
		try {
			if (ctx.getSessionValue("eventLoggedIn") == null && !"true".equals(ctx.getSessionValue("newEvent"))) {
				adminHome(ctx);
			} else if (ctx.getSessionValue("eventLoggedIn") == null) {
				int conferenceID = crsApp.createConference(ctx.getHashedRequest());
				ctx.setSessionValue("eventLoggedIn", String.valueOf(conferenceID));
				ctx.setSessionValue("authLevel", AUTH_LEVELS[1]);
				/* Create 1 default registrationType: Student*/
				int defaultRegType = crsApp.createRegistrationType(conferenceID, "Attendee");
				
				listCustomItems(ctx);
			} else {
				if (crsApp.saveConference(ctx.getHashedRequest())) {
					if ("true".equals(ctx.getSessionValue("newEvent")))
						listCustomItems(ctx);						
					else
						showConference(ctx);
				} else {
					ActionResults ar = new ActionResults();
					ar.putValue("errorMsg",
							"The conference could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "adminHome");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

/*	public void saveProfileQuestions(ActionContext ctx) {
		try {
			if (ctx.getSessionValue("eventLoggedIn") == null && !"true".equals(ctx.getSessionValue("newEvent"))) {
				adminHome(ctx);
			} else if (ctx.getSessionValue("eventLoggedIn") == null) {
				int conferenceID = crsApp.createConference(ctx.getHashedRequest());
				ctx.setSessionValue("eventLoggedIn", String.valueOf(conferenceID));
				ctx.setSessionValue("authLevel", AUTH_LEVELS[1]);
				listCustomItems(ctx);
			} else {
				Hashtable profileValues = new Hashtable();
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				Conference c = crsApp.getConference(conferenceID);
				
				Iterator regTypes = c.getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					int profile = 0;
					int profilereq = 0;
					RegistrationType rt = (RegistrationType) regTypes.next();
					Hashtable values = new Hashtable();
					for (int i = 0; i < Conference.profileNames.length; i++) {
						if ((ctx.getInputString("q_" + i + "_"+rt.getRegistrationTypeID())).equals("1")) {
							profile = profile | (int) java.lang.Math.pow(2, i);
						} else if ((ctx.getInputString("q_" + i + "_"+rt.getRegistrationTypeID())).equals("2")) {
							profile = profile | (int) java.lang.Math.pow(2, i);
							profilereq = profilereq | (int) java.lang.Math.pow(2, i);
						}
					}
					values.put("ProfileNumber", String.valueOf(profile));
					values.put("ProfileReqNumber", String.valueOf(profilereq));
					rt.setMappedValues(values);
					rt.update();
					if (!rt.update()){
						ActionResults ar = new ActionResults();
						ar.putValue("errorMsg",
								"The conference could not save, please try again or start over by hitting continue.");
						ar.putValue("nextAction", "adminHome");
						ctx.setReturnValue(ar);
						ctx.goToView("error");
					}
				}
			if ("true".equals(ctx.getSessionValue("newEvent")))
				listQuestions(ctx);
			else
				showConference(ctx);
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
*/
	public void saveProfileQuestions(ActionContext ctx) {
		try {
			if (ctx.getSessionValue("eventLoggedIn") == null && !"true".equals(ctx.getSessionValue("newEvent"))) {
				adminHome(ctx);
			} else if (ctx.getSessionValue("eventLoggedIn") == null) {
				int conferenceID = crsApp.createConference(ctx.getHashedRequest());
				ctx.setSessionValue("eventLoggedIn", String.valueOf(conferenceID));
				ctx.setSessionValue("authLevel", AUTH_LEVELS[1]);
				listCustomItems(ctx);
			} else {
				Hashtable profileValues = new Hashtable();
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				Conference c = crsApp.getConference(conferenceID);
				RegistrationType rt = crsApp.getRegistrationType((String) ctx.getSessionValue("regTypeID"));
					
				int profile = 0;
				int profilereq = 0;
				Hashtable values = new Hashtable();
				for (int i = 0; i < Conference.profileNames.length; i++) {
					if ((ctx.getInputString("q_" + i)).equals("1")) {
						profile = profile | (int) java.lang.Math.pow(2, i);
					} else if ((ctx.getInputString("q_" + i)).equals("2")) {
						profile = profile | (int) java.lang.Math.pow(2, i);
						profilereq = profilereq | (int) java.lang.Math.pow(2, i);
					}
				}
				values.put("ProfileNumber", String.valueOf(profile));
				values.put("ProfileReqNumber", String.valueOf(profilereq));
				rt.setMappedValues(values);
				rt.update();
				if (!rt.update()){
					ActionResults ar = new ActionResults();
					ar.putValue("errorMsg",
							"The profile could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "listRegistrationTypes");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
				if (("true".equals(ctx.getSessionValue("newEvent")))||("true".equals(ctx.getSessionValue("newRegType"))))
					listRegTypeQuestions(ctx);
				else{
					String nextAction= (ctx.getInputString("nextAction")==null||"".equals(ctx.getInputString("nextAction")))?"ListRegistrationTypes":ctx.getInputString("nextAction");
					goToRegTypeEditAction(nextAction,ctx);
					//editRegistrationType(ctx);
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void saveCustomItem(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				if (crsApp.saveCustomItem(ctx.getHashedRequest())) {
					listCustomItems(ctx);
				} else {
					ar.putValue("errorMsg",
							"The custom item could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "listCustomItems");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void saveCustomItems(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				int itemSize = ctx.getInputString("itemSize") == null ? 0
						: Integer.parseInt(ctx.getInputString("itemSize"));
				for (int i = 0; i < itemSize; i++) {
					Hashtable ci = new Hashtable();
					ci.put("CustomItemID", ctx.getInputString(i + "CustomItemID"));
					ci.put("ConferenceID", ctx.getSessionValue("eventLoggedIn"));
					ci.put("DisplayOrder", ctx.getInputString(i + "DisplayOrder"));
					crsApp.saveCustomItem(ci);
				}
				if (ctx.getSessionValue("newEvent") != null && ctx.getSessionValue("newEvent").equals("true") && ctx.getSessionValue("newRegType") != null){
					// for a new event, send them to the registration wizard intro page
					String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
					ar.putObject("conference", crsApp.getConference(conferenceID));
					ctx.setReturnValue(ar);
					ctx.goToView("chooseNumRegTypes");
				}
				
				// why is this here? this case should never happen  S.Paulis 5/10/05
				
				//else if (ctx.getSessionValue("newEvent") != null && ctx.getSessionValue("newEvent").equals("true")){
				//	listRegistrationTypes(ctx);
				//}
				
				else
					showConference(ctx);
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "editCustomItem");
		}
	}
	
	// added 5/10/05 by S.Paulis
	// only used in new event creation process
	public void chooseNumRegTypes(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				
				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
				Conference c = crsApp.getConference(conferenceID);
				Iterator regTypes = c.getRegistrationTypes().iterator();
				RegistrationType rt = (RegistrationType) regTypes.next();
				ctx.setSessionValue("regTypeID",String.valueOf(rt.getRegistrationTypeID()));
				
				// send them directly into editing the default reg type
				if("true".equals((String)ctx.getInputString("onlyOneRegType"))){
					
					ctx.setSessionValue("onlyOneRegType","true");
					ctx.setSessionValue("firstRegType","true");
					ctx.setSessionValue("newRegType","true");
					
					editRegistrationType(ctx);
				}
				else { // send them to the reg type explanation blurb page
					ctx.setSessionValue("onlyOneRegType", null);
					ar.putObject("conference", c);
					ctx.setReturnValue(ar);
					
					ctx.goToView("multRegTypesExplanation");
				}	
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "editCustomItem");
		}
	}
	

	public void saveDisplayOptions(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				if (crsApp.saveConference(ctx.getHashedRequest())) {
					showConference(ctx);
				} else {
					ar.putValue("errorMsg",
							"The conference could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "adminHome");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void saveFinancialDetails(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
//				String conferenceID = (String) ctx.getSessionValue("eventLoggedIn");
//				Conference c = crsApp.getConference(conferenceID);
				String regTypeID = ctx.getInputString("RegistrationTypeID");
				if (crsApp.saveRegistrationType(ctx.getHashedRequest())) {
					if (("true".equals(ctx.getSessionValue("newEvent")))||("true".equals(ctx.getSessionValue("newRegType"))))
						listRegTypeMerchandise(ctx);
					else
					{
						String nextAction= (ctx.getInputString("nextAction")==null||"".equals(ctx.getInputString("nextAction")))?"ListRegistrationTypes":ctx.getInputString("nextAction");
						goToRegTypeEditAction(nextAction,ctx);
						//editRegistrationType(ctx); 
					}
				} else {
					ar.putValue("errorMsg",
							"The financial details could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "listRegistrationTypes");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "saveFinancialDetails");
		}
	}

	public void saveMerchandise(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				int merchandiseSize = Integer.parseInt(ctx.getInputString("merchandiseSize") != null ? ctx.getInputString("merchandiseSize")
						: "0");
				for (int i = 0; i < merchandiseSize; i++) {
					Hashtable m = new Hashtable();
					m.put("MerchandiseID", ctx.getInputString(i + "MerchandiseID"));
					m.put("DisplayOrder", ctx.getInputString(i + "DisplayOrder"));
					crsApp.saveMerchandise(m);
				}
				if (("true".equals(ctx.getSessionValue("newEvent")))||("true".equals(ctx.getSessionValue("newRegType"))))
					editProfileQuestions(ctx);
				else
				{
					String nextAction= (ctx.getInputString("nextAction")==null||"".equals(ctx.getInputString("nextAction")))?"ListRegistrationTypes":ctx.getInputString("nextAction");
					goToRegTypeEditAction(nextAction,ctx);
					//editRegistrationType(ctx);
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "editMerchandise");
		}
	}

/*	public void saveMerchandiseDetails(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				Hashtable req = ctx.getHashedRequest();
				req.put("ConferenceID", ctx.getSessionValue("eventLoggedIn"));
				//somehow allow person to change which registrant type??
				req.remove("view");
				req.remove("action");
				req.remove("remLen");
				
				if (crsApp.saveMerchandise(req)) {
					listMerchandise(ctx);
				} else {
					ar.putValue("errorMsg",
							"The merchandise could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "adminHome");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
*/	public void saveMerchandiseDetails(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				Hashtable req = ctx.getHashedRequest();
				req.put("RegistrationTypeID", ctx.getSessionValue("regTypeID"));
				req.put("ConferenceID", ctx.getSessionValue("eventLoggedIn"));
				//somehow allow person to change which registrant type??
				req.remove("view");
				req.remove("action");
				req.remove("remLen");
				
				if (crsApp.saveMerchandise(req)) {
					listRegTypeMerchandise(ctx);
				} else {
					ar.putValue("errorMsg",
							"The merchandise could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "adminHome");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void savePaymentDetails(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				adminHome(ctx);
			} else if (ctx.getInputString("registrationID") == null || ctx.getInputString("PaymentID") == null) {
				ar.putValue("errorMsg", "There was a problem saving your payment. Please try again.");
				ar.putValue("nextAction", "showConference");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else {
				Hashtable req = ctx.getHashedRequest();
				req.put("RegistrationID", ctx.getInputString("registrationID"));
				req.remove("registrationID");
				if ("Custom".equals(ctx.getInputString("Type"))){
					req.put("Type",ctx.getInputString("Comment"));
					req.put("Comment","");
				}

				if (crsApp.savePayment(req)) {
					editRegistrationPayments(ctx);
				} else {
					ar.putValue("errorMsg",
							"The payment could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "showConference");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void saveQuestionDetails(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				boolean retVal = false;

				if ("0".equals(ctx.getInputString("QuestionID"))) {
					/* new question */
					Hashtable tempQuestion = ctx.getHashedRequest();
					tempQuestion.put("RegistrationTypeID", ctx.getSessionValue("regTypeID"));
					tempQuestion.remove("view");
					tempQuestion.remove("order");
					tempQuestion.remove("orderCol");
					tempQuestion.remove("action");
					
					crsApp.saveQuestion(tempQuestion);
				} else {  /* edit existing */
					crsApp.saveQuestion(ctx.getHashedRequest());
				}
				listRegTypeQuestions(ctx);
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void saveQuestions(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				int questionSize = ctx.getInputString("questionSize") == null ? 0
						: Integer.parseInt(ctx.getInputString("questionSize"));
				for (int i = 0; i < questionSize; i++) {
					Hashtable q = new Hashtable();
					q.put("QuestionID", ctx.getInputString(i + "QuestionID"));
					q.put("DisplayOrder", ctx.getInputString(i + "DisplayOrder"));
					crsApp.updateQuestion(q);
				}
				if ("true".equals(ctx.getSessionValue("onlyOneRegType")))
					editDisplayOptions(ctx);
				else if (("true".equals(ctx.getSessionValue("newEvent")))||("true".equals(ctx.getSessionValue("newRegType"))))
					listRegistrationTypes(ctx);
				else
				{
					String nextAction= (ctx.getInputString("nextAction")==null||"".equals(ctx.getInputString("nextAction")))?"ListRegistrationTypes":ctx.getInputString("nextAction");
					goToRegTypeEditAction(nextAction,ctx);
					//editRegistrationType(ctx);
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "editQuestion");
		}
	}

	public void saveRegistration(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else if (ctx.getInputString("RegistrationID") == null) {
				ar.putValue("errorMsg", "regID not found");
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else {
				boolean success = false;
				String registrationID = ctx.getInputString("registrationID");

				if (crsApp.saveRegistration(ctx.getHashedRequest())) {
					showRegistration(ctx);
				} else {
					ar.putValue("errorMsg",
							"The registration could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "adminHome");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void saveChildRegistration(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else if (ctx.getInputString("ChildRegistrationID") == null) {
				ar.putValue("errorMsg", "regID not found");
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else {
				boolean success = false;
				String childRegistrationID = ctx.getInputString("ChildRegistrationID");
				ChildRegistration r = crsApp.getChildRegistration(childRegistrationID);

				success = crsApp.saveChildRegistration(ctx.getHashedRequest());

				if (success) {
					showChildRegistration(ctx);
				} else {
					ar.putValue("errorMsg",
							"The registration could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "adminHome");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void saveRegistrationMerchandise(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				if (ctx.getInputString("registrationID") != null) {
					Registration r = crsApp.getRegistration(ctx.getInputString("registrationID"));

					MerchandiseChoice mc = new MerchandiseChoice();
					mc.setRegistrationID(r.getRegistrationID());
					mc.delete();

					if (ctx.getInputStringArray("choices") != null) {
						String[] choices = ctx.getInputStringArray("choices");

						for (int i = 0; i < choices.length; i++) {
							Merchandise m = crsApp.getMerchandise(choices[i]);
							r.assocMerchandise(m);
						}
					}
					showRegistration(ctx);
				} else {
					ar.putValue("errorMsg",
							"The registration could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "lookupRegistrations");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "editMerchandise");
		}
	}

	public void saveRegistrationQuestions(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				if (ctx.getInputString("registrationID") != null) {
					String registrationID = ctx.getInputString("registrationID");
					Collection questions = new Vector();
					Registration r = crsApp.getRegistration(registrationID);

					questions = crsApp.listQuestions((String)ctx.getSessionValue("eventLoggedIn"),
								r.getRegistrationTypeID(), "displayOrder", "ASC");

					Iterator qi = questions.iterator();

					while (qi.hasNext()) {
						Question q = (Question) qi.next();
//						log.debug(q.getAnswerType());
						if (!q.getAnswerType().equals("divider") && !q.getAnswerType().equals("info")
								&& !q.getAnswerType().equals("hide")) {
							Hashtable values = new Hashtable();
							String answer="";
							if (q.getAnswerType().equals("textL")){	//paragraphs have a "t" preface
								answer = ctx.getInputString("t"+String.valueOf(q.getQuestionID()));
							} else {
								answer = ctx.getInputString(String.valueOf(q.getQuestionID()));
							}
							answer = answer == null ? "" : answer;
							if (q.getAnswerType().equals("checkbox"))
								answer = "Yes".equals(answer) ? "Yes" : "No";
							values.put("Body", answer);
							values.put("QuestionID", String.valueOf(q.getQuestionID()));
							values.put("RegistrationID", registrationID);
							crsApp.saveAnswer(values);
							
							if (q.getQuestionTextID() == 2) {
								r.setIsOnsite(answer.equals("Y") ? true : false);
								r.persist();
							}
						}
					}
					showRegistration(ctx);
				} else {
					ar.putValue("errorMsg",
							"The registration could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "lookupRegistrations");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void saveReport(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else {
				if (crsApp.saveReport(ctx.getHashedRequest())) {
					listReports(ctx);
				} else {
					ar.putValue("errorMsg",
							"The report could not save, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "listReports");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void showConference(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null && ctx.getInputString("conferenceID") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else {
				String conferenceID = ctx.getSessionValue("eventLoggedIn") == null ? ctx.getInputString("conferenceID")
						: (String) ctx.getSessionValue("eventLoggedIn");
				conferenceID = ctx.getInputString("conferenceID") == null ? conferenceID
						: ctx.getInputString("conferenceID");
				Conference c = crsApp.getConference(conferenceID);
				
				/*  to be modified to handle N regtypes */
				Vector regTypesVector = new Vector();
				Iterator regTypes = c.getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					Vector v = new Vector();
					v.add(String.valueOf(rt.getRegistrationTypeID()));
					v.add((String)rt.getLabel());
					v.add(String.valueOf(crsApp.countRegistrationsByType(conferenceID,rt.getRegistrationTypeID())));
					regTypesVector.add(v);
				}
				ar.putObject("RegistrationTypes",regTypesVector);
				ar.putObject("conference", c);
				ar.putValue("registered", String.valueOf(crsApp.countRegistrations(conferenceID)));

				// Set session values to remember logged in conference
				ctx.setSessionValue("eventLoggedIn", conferenceID);
				ctx.setSessionValue("newEvent", null);

				ctx.setReturnValue(ar);
				ctx.goToView("showConference");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void showRegistration(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else {
				String registrationID = "";
				if (ctx.getInputString("registrationID") != null) {
					registrationID = ctx.getInputString("registrationID");
					Registration r = crsApp.getRegistration(registrationID);

					ar.putObject("registration", r);
					ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));
					ar.addCollection("answers", crsApp.listRegistrationAnswers(registrationID));
					ar.addCollection("merchandise", crsApp.listRegistrationMerchandise(registrationID, "displayOrder",
							"DESC"));

					ar.addCollection("questions", crsApp.listQuestions(
							(String) ctx.getSessionValue("eventLoggedIn"),
							r.getRegistrationTypeID(), "displayOrder", "ASC"));

					int regFirstID = (r.isRegisteredFirst()||(r.getSpouseRegistrationID()==0)) ? r.getRegistrationID() : r.getSpouseRegistrationID();

					if (regFirstID==0) regFirstID=Integer.valueOf(registrationID).intValue();	/* prevent the 879 children bug */
					ar.addCollection("childRegistrations", crsApp.listChildRegistrations(regFirstID));
					if (r.getSpouseRegistrationID()==0){
						ar.addCollection("payments", crsApp.listRegistrationPayments(
							String.valueOf(r.getRegistrationID()),
							"paymentDate", "ASC"));
					}
					else{
						ar.addCollection("payments", crsApp.listRegistrationPaymentsWithSpouse(
								String.valueOf(r.getRegistrationID()), String.valueOf(r.getSpouseRegistrationID()),
								"paymentDate", "ASC"));
					}
					ctx.setReturnValue(ar);
					ctx.goToView("showRegistration");
				} else {
					ar.putValue("errorMsg",
							"The registration could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "lookupRegistrations");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void showChildRegistration(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else {
				String childRegistrationID = "";
				if (ctx.getInputString("childRegistrationID") != null) {
					childRegistrationID = ctx.getInputString("childRegistrationID");

					ChildRegistration cr = crsApp.getChildRegistration(childRegistrationID);
					ar.putObject("registration", cr);
					ar.putObject("parentregistration", crsApp.getRegistration(cr.getRegistrationID()));
					ar.putObject("conference", crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn")));

					ctx.setReturnValue(ar);

					ctx.goToView("showChildRegistration");
				} else {
					ar.putValue("errorMsg",
							"The registration could not located, please try again or start over by hitting continue.");
					ar.putValue("nextAction", "lookupRegistrations");
					ctx.setReturnValue(ar);
					ctx.goToView("error");
				}
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}

	public void showReport(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[0], ctx)) {
				login(ctx);
			} else {
				int orderCol;
				String order = "";
				String view="";
				int offset;
				int size;
				Conference c = crsApp.getConference((String) ctx.getSessionValue("eventLoggedIn"));
				
				if (ctx.getInputString("orderCol") != null)
					orderCol = Integer.parseInt(ctx.getInputString("orderCol"));
				else
					orderCol = 0;

				if (ctx.getInputString("offset") != null)
					offset = Integer.parseInt(ctx.getInputString("offset"));
				else
					offset = 1;

				if (ctx.getInputString("size") != null)
					size = Integer.parseInt(ctx.getInputString("size"));
				else
					size = 10;

				if (ctx.getInputString("order") != null && ctx.getInputString("order").equals("DESC"))
					order = "DESC";
				else
					order = "ASC";
					
				/*  handle N regtypes */
				Vector regTypesVector = new Vector();
				Iterator regTypes = c.getRegistrationTypes().iterator();
				while (regTypes.hasNext()) {
					RegistrationType rt = (RegistrationType) regTypes.next();
					Vector v = new Vector();
					v.add(String.valueOf(rt.getRegistrationTypeID()));
					v.add((String)rt.getLabel());
					regTypesVector.add(v);
				}
				if (ctx.getInputString("view") != null)
					view = ctx.getInputString("view");
				else{	/* set a default view: the first record encountered */
					view = "general";
				}
				ar.putObject("RegistrationTypes",regTypesVector);
				ar.putValue("view",view);

				ar.putValue("orderCol", String.valueOf(orderCol));
				ar.putValue("offset", String.valueOf(offset));
				ar.putValue("size", String.valueOf(size));
				ar.putValue("maxSize", String.valueOf(crsApp.countReport(ctx.getInputString("reportID").toString(),
						(String) ctx.getSessionValue("eventLoggedIn"))));
				ar.putValue("order", order);

				ar.putObject("conference", c);
				ar.putObject("report", crsApp.getReport(ctx.getInputString("reportID")));

				ctx.setReturnValue(ar);
				ctx.goToView("showReport");
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "createConference");
		}
	}

	public void updateCustomItemOrder(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				int itemSize = Integer.parseInt(ctx.getInputString("itemSize"));
				for (int i = 0; i < itemSize; i++) {
					Hashtable ci = new Hashtable();
					ci.put("CustomItemID", ctx.getInputString(i + "CustomItemID"));
					ci.put("ConferenceID", ctx.getSessionValue("eventLoggedIn"));
					ci.put("DisplayOrder", ctx.getInputString(i + "DisplayOrder"));
					crsApp.saveCustomItem(ci);
				}
				listCustomItems(ctx);
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "editCustomItem");
		}
	}

	public void updateMerchandiseOrder(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				int merchandiseSize = Integer.parseInt(ctx.getInputString("merchandiseSize"));
				log.debug("merchandiseSize: "  + merchandiseSize);
				for (int i = 0; i < merchandiseSize; i++) {
					Hashtable m = new Hashtable();
					m.put("MerchandiseID", ctx.getInputString(i + "MerchandiseID"));
					m.put("DisplayOrder", ctx.getInputString(i + "DisplayOrder"));
					crsApp.updateMerchandise(m);
				}
				listRegTypeMerchandise(ctx);
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "editMerchandise");
		}
	}

	public void updateQuestionOrder(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			if (ctx.getSessionValue("eventLoggedIn") == null) {
				ar.putValue("errorMsg", ERR_conferenceNotFound);
				ar.putValue("nextAction", "adminHome");
				ctx.setReturnValue(ar);
				ctx.goToView("error");
			} else if (!authenticated(AUTH_LEVELS[1], ctx)) {
				login(ctx);
			} else {
				int questionSize = Integer.parseInt(ctx.getInputString("questionSize"));
				log.debug("questionSize" + questionSize);
				for (int i = 0; i < questionSize; i++) {
					Hashtable q = new Hashtable();
					q.put("QuestionID", ctx.getInputString(i + "QuestionID"));
					q.put("DisplayOrder", ctx.getInputString(i + "DisplayOrder"));
					crsApp.updateQuestion(q);
				}
				listRegTypeQuestions(ctx);
			}
		} catch (Exception e) {
			goToErrorPage(ctx, e, "editQuestion");
		}
	}

	/*
	public void uploadDB(ActionContext ctx) {
		ActionResults ar = new ActionResults("adminUpload");
		String eventId = (String) ctx.getSessionValue("eventLoggedIn");
		try {
			String baseFilePath = getServletContext().getRealPath(APP_FOLDER);
			CRSImportExport importExport = CRSImportExport.getInstance(baseFilePath);

			MultipartRequest multi = new MultipartRequest(ctx.getRequest(), importExport.getImportDirectory(),
					20 * 1024 * 1024); // 20MB
			// Max
			String name = (String) (multi.getFileNames().nextElement());
			java.io.File file = multi.getFile(name);
			log.debug("File uploaded: " + file.getName());
			ar.addHashtable("Results", importExport.importFromAccess(file.getName(),
					(String) ctx.getSessionValue("eventLoggedIn")));

			ar.putObject("conference", crsApp.getConference(eventId));
			ar.putValue("ConferenceID", eventId);
			ctx.setReturnValue(ar);
			ctx.goToView("uploadFile");
		} catch (Exception e) {
			goToErrorPage(ctx, e, "adminUpload");
		}
	}
	*/
}
