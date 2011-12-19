package org.alt60m.ministry.bean;

public class JobStatusTranslator {
	
	private static final String[] _jobStatusCode = new String[] {"EAJ", 				"AAS", 					"ALB", 						"AEC", 							"CA", 					"CC", 				"DCC", 								"FA", 								"CF", 						"HFF", 						"SF", 						"MF", 						"MF", 						"NF", 						"AFB", 						"HFP", 						"OF", 			"EF", 						"LF", 					"BF", 							"AFS", 						"VF", 				"DIS", 					"OC", 				"SC", 				"VCF", 					"HDS", 						"HCF", 				"HCP", 				"HCT", 							"HCC", 				"HLF", 					"HLN", 						"HCS", 								"HCS", 								"HSC", 								"MC", 				"MA", 							"NC", 				"NA", 						"ACB", 				"ACB", 				"VCP", 					"OA", 				"EC", 				"LC", 					"EL", 					"LL", 					"OS", 						"OCS", 					"SCS", 					"SA", 				"SS", 							"SSS", 						"SLB", 					"SLS", 						"BC", 					"ACS", 					"MW", 							"SD", 					"OW", 							"SW", 							"NE", 					"DFF", 										"DFP", 										"MFS", 								"MFF", 										"MFP", 										"NEF", 					"DF", 								"DHF", 								"DHP",								"HTP", 							"MCP", 							"MHF", 								"MHP", 								"MS", 						"NX", 							"ECP", 					"DS", 						"MCS", 								"AW", 								"CW",									"SCP"};
	private static final String[] _jobStatusDesc = new String[] {"Additional Job Over", "Affiliate Applicant", 	"Affiliate on Paid Leave", 	"Applicant on Early Payroll", 	"Associate Applicant", 	"Associate Staff", 	"Dependent Continuing Ben Cvrg", 	"Former Applc for nonemploy pos", 	"Former Associate Staff", 	"Former Full Time Hourly", 	"Former Full Time Staff", 	"Former Ministry Intern", 	"Former Ministry Intern", 	"Former National Staff", 	"Former Paid Affiliate", 	"Former Part Time Hourly", 	"Former STINT", "Former Salaried Exempt", 	"Former Salaried N.E.", "Former Subsidiary Employee", 	"Former Unpaid Affiliate", 	"Former Volunteer", "Full Time Disability", "Full Time STINT", 	"Full Time Staff", 	"Full-Time Volunteer", 	"Hourly Disability Plan", 	"Hourly Full Time", "Hourly Part Time", "Hourly Temporary Full Time", 	"Hourly on Call", 	"Hourly on Paid Leave", "Hourly on Unpaid Leave", 	"Hourly-Salaried w/stafmemo act", 	"Hourly-Salaried w/stafmemo act", 	"Hourly-Salaried w/stafmemo act", 	"Ministry Intern", 	"Ministry Intern Applicant", 	"National Staff", 	"National Staff Applicant", "Paid Affiliate", 	"Paid Affiliate", 	"Part Time Volunteer", 	"STINT Applicant", 	"Salaried Exempt", 	"Salaried Non-exempt", 	"Salaried on Leave", 	"Salaried on Leave", 	"Self Supported Stinter", 	"Self-Supported STINT", "Self-Supported Staff", "Staff Applicant", 	"Staff Raising Init Supprt", 	"Staff on Delayed Payroll", "Staff on Paid Leave", 	"Staff on Unpaid Leave", 	"Subsidiary Employee", 	"Un-Paid Affiliate", 	"Withdrawn Ministry Intern", 	"Withdrawn New Staff", 	"Withdrawn STINT applicant", 	"Withdrawn Staff Applicant", 	"other Non Employee", 	"Former Hourly Full Time w Desig Number", 	"Former Hourly Part Time w Desig Number", 	"Former Salaried Ministry Intern", 	"Former Hourly Full Time Ministry Intern", 	"Former Hourly Part Time Ministry Intern", 	"Former Non-Employee", 	"Former Salaried w Desig Number", 	"Hourly Full Time w Desig Number", 	"Hourly Part Time w Desig Number", 	"Hourly Temporary Part Time", 	"Ministry Intern Part Time", 	"Ministry Intern Hourly Full Time", "Ministry Intern Hourly Part Time", "Ministry Intern Salaried", "National Staff (Expatriate)", 	"Salaried Part Time", 	"Salaried w Desig Number", 	"Self-Supported Ministry Intern", 	"Withdrawn Affiliate Applicant", 	"Withdrawn Ministry Intern Applicant",	"Staff Part Time"};


	public static String codeToDescription(String jobStatusCode) {
		return translate(_jobStatusCode, _jobStatusDesc, jobStatusCode);
	}

	public static String descriptionToCode(String jobStatusDescription) {
		return translate(_jobStatusDesc, _jobStatusCode, jobStatusDescription);
	}


	private static String translate(String[] from, String[] to, String word)
	{
		for(int i =0; i< from.length;i++)
			if (word.equalsIgnoreCase(from[i]))
				return to[i];
		
		// Nothing matched - return null
		return null;
	}
	
	public static void main(String[] args) 
	{
	
		for(int i =0; i<_jobStatusCode.length;i++) 
			if(!descriptionToCode(codeToDescription(_jobStatusCode[i])).equals(_jobStatusCode[i]))
				System.out.println("Failure: "+_jobStatusCode[i]);

		System.out.println("Code=EAJ, Description=" + codeToDescription("EAJ"));
		System.out.println("Code=OF, Description=" + codeToDescription("OF"));
		System.out.println("Code=SLB, Description=" + codeToDescription("SLB"));
		System.out.println("Code=NE, Description=" + codeToDescription("NE"));
		System.out.println("Code=INVALID, Description=" + codeToDescription("INVALID"));

		System.out.println("Description=Additional Job Over, Code=" + descriptionToCode("Additional Job Over"));
		System.out.println("Description=Affiliate on Paid Leave, Code=" + descriptionToCode("Affiliate on Paid Leave"));
		System.out.println("Description=Former Unpaid Affiliate, Code=" + descriptionToCode("Former Unpaid Affiliate"));
		System.out.println("Description=other Non Employee, Code=" + descriptionToCode("other Non Employee"));
		System.out.println("Description=INVALID, Code=" + descriptionToCode("INVALID"));
	



	}
}
