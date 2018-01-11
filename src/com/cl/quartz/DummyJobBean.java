package com.cl.quartz;

import java.util.HashMap;
import java.util.List;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.cl.dto.NoticeDTO;
import com.cl.service.impl.MainService;

public class DummyJobBean extends QuartzJobBean{
	private DummyTask dummyTask;
	
	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
			/*try {
				dummyTask.print();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
	}
	
	public void setDummyTask(DummyTask dummyTask){
		this.dummyTask = dummyTask;
	}
}
