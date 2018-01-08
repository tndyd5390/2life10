package com.cl.quartz;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.cl.dto.NoticeDTO;
import com.cl.service.IMainService;

public class DummyTask {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MainService")
	private IMainService mainService;
	
	
	public void print() throws Exception{
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = mainService.getMainList();
		
		List<NoticeDTO> nList = (List) hMap.get("nList");
		
		for(NoticeDTO nDTO : nList){
			System.out.println(nDTO.getNoticeTitle());
		}
	}
}
