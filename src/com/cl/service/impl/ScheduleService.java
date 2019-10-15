package com.cl.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service("ScheduleService")
public class ScheduleService {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Scheduled(cron="*/5 * * * * *") 
	public void scheduleRun(){

	 Calendar calendar = Calendar.getInstance();
	 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 log.info("스케줄 실행 : " + dateFormat.format(calendar.getTime()));

	}
	
}
