package org.alt60m.wsn.sp.jobs;

import org.alt60m.wsn.sp.bean.dbio.WsnApplicationAccountBalanceUpdater;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class WsnAccountBalanceUpdaterJob implements Job {

	private static Log log = LogFactory.getLog(WsnAccountBalanceUpdaterJob.class);
	
	public void execute(JobExecutionContext context) throws JobExecutionException {
		try {
			log.info("Running WsnAccountBalanceUpdater Job");
			WsnApplicationAccountBalanceUpdater updater = new WsnApplicationAccountBalanceUpdater();
			updater.doIt();
			log.info("Finished WsnAccountBalanceUpdater Job");
		} 
		catch (Exception e)
		{
			log.error("Unhandled exception occured during scheduled job: " + context.getJobDetail().getFullName(), e);
			throw new JobExecutionException(e);
		}
	}
}
