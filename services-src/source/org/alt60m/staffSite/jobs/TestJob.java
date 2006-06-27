package org.alt60m.staffSite.jobs;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class TestJob implements Job {

	private static Log log = LogFactory.getLog(TestJob.class);
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		// TODO Auto-generated method stub

		try {
			log.info("Hello World");
		} catch (Exception e)
		{
			log.error("Unhandled exception occured during scheduled job: " + arg0.getJobDetail().getFullName(), e);
			throw new JobExecutionException(e);
		}
	}

}
