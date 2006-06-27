package org.alt60m.ministry.jobs;

import org.alt60m.ministry.bean.ApplyStaffChanges;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class ApplyStaffChangesJob implements Job {


	private static Log log = LogFactory.getLog(ApplyStaffChangesJob.class);
	
	public void execute(JobExecutionContext context) throws JobExecutionException {
		try {
			log.info("Running ApplyStaffChanges Job");
		    ApplyStaffChanges.applyChanges(); 
			
		} catch (Exception e)
		{
			log.error("Unhandled exception occured during scheduled job: " + context.getJobDetail().getFullName(), e);
			throw new JobExecutionException(e);
		}
		
		
	}

	
}
