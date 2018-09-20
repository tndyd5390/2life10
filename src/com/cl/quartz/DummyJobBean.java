package com.cl.quartz;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class DummyJobBean extends QuartzJobBean{
	private DummyTask dummyTask;
	
	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
			try {
				//dummyTask.truncateAndInsertMember();
				dummyTask.print();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public void setDummyTask(DummyTask dummyTask){
		this.dummyTask = dummyTask;
	}
}
