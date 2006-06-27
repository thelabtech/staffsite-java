package org.alt60m.staffSite.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.alt60m.servlet.Controller;
import org.alt60m.staffSite.jobs.TestJob;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleTrigger;
import org.quartz.Trigger;
import org.quartz.TriggerUtils;
import org.quartz.xml.JobSchedulingDataProcessor;

public class ScheduleController extends Controller {


	private SchedulerFactory factory;

	private Scheduler sched;

	/* Cron syntax:
	 * 1.  Seconds
	 * 2. Minutes
	 * 3. Hours
	 * 4. Day-of-Month
	 * 5. Month
	 * 6. Day-of-Week
	 * 7. Year (optional field)
	 *  
	 */

	//Every night: 0 0 0 ? * *
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			factory = new org.quartz.impl.StdSchedulerFactory();
			sched = factory.getScheduler();

			JobSchedulingDataProcessor xmlProcessor = new JobSchedulingDataProcessor();
			//xmlProcessor.processFileAndScheduleJobs("quartz-jobs.xml", sched, true);
			log.debug("Reading quartz_jobs.xml");
			xmlProcessor.processStream(config.getServletContext().getResourceAsStream("WEB-INF/quartz_jobs.xml"), JobSchedulingDataProcessor.QUARTZ_SYSTEM_ID);
			xmlProcessor.scheduleJobs(xmlProcessor.getScheduledJobs(), sched, true);
			
			// define the job and tie it to our HelloJob class
			//JobDetail job = new JobDetail("job1", "group1", TestJob.class);

			// Trigger the job to run on the next round minute

			//Trigger trigger = new CronTrigger("trigger2", "group1",
			//		"0/20 * * * * ?");

			// Tell quartz to schedule the job using our trigger
			//sched.scheduleJob(job, trigger);

			// Start up the scheduler 
			log.debug("Starting scheduler");
			sched.start();

		} catch (Exception e) {
			log.error(e, e);
			throw new ServletException(e);
		}
	}

	@Override
	public void destroy() {
		super.destroy();
		try {
			if (sched != null) {
				log.debug("Shutting down scheduler");
				sched.shutdown(true);
			}
		} catch (SchedulerException e) {
			log.error("Unable to shut down scheduler!", e);
		}
	}
	
	public void listJobs(ActionContext ctx) throws IOException, SchedulerException
	{
		PrintWriter out = ctx.getResponse().getWriter();
		out.println("Scheduled Jobs:");
		String[] jobGroups;
		String[] jobsInGroup;
		int i;
		int j;

		jobGroups = sched.getJobGroupNames();
		for (i = 0; i < jobGroups.length; i++) {
		   out.println("Group: " + jobGroups[i] + " contains the following jobs:");
		   jobsInGroup = sched.getJobNames(jobGroups[i]);

		   for (j = 0; j < jobsInGroup.length; j++) {
		      out.println("- " + jobsInGroup[j]);
		   }
		}
		out.println();
		out.println("Scheduled Triggers:");
		
		String[] triggerGroups;
		String[] triggersInGroup;

		triggerGroups = sched.getTriggerGroupNames();
		for (i = 0; i < triggerGroups.length; i++) {
		   out.println("Group: " + triggerGroups[i] + " contains the following triggers");
		   triggersInGroup = sched.getTriggerNames(triggerGroups[i]);
		   
		   for (j = 0; j < triggersInGroup.length; j++) {
		      out.println("- " + triggersInGroup[j]);
		   }
		}
	}

}
