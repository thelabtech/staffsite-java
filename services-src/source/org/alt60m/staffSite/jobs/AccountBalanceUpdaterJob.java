package org.alt60m.staffSite.jobs;

import org.alt60m.staffSite.bean.dbio.AccountBalanceUpdater;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class AccountBalanceUpdaterJob implements Job {
	private static Log log = LogFactory.getLog(AccountBalanceUpdaterJob.class);
	
	public void execute(JobExecutionContext context) throws JobExecutionException {
		
		try {
		log.info("Running AccountBalanceUpdater Job");

		AccountBalanceUpdater abu = new AccountBalanceUpdater();
		
		Boolean verbose = Boolean.parseBoolean((String) context.getJobDetail().getJobDataMap().get("verbose")); 
		if (verbose) {
			log.debug("Performing update (verbose)");
			abu.performUpdate(true);
		}
		else {
			log.debug("Performing update (not verbose)");
			abu.performUpdate(false);
		}
		} catch (Exception e)
		{
			log.error("Unhandled exception occured during scheduled job: " + context.getJobDetail().getFullName(), e);
			throw new JobExecutionException(e);
		}
	}

	
	
	
}
