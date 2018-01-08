package com.cl.quartz;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.cl.dto.AdviceDTO;
import com.cl.dto.FuneralInfoDTO;
import com.cl.dto.NoticeDTO;
import com.cl.persistance.mapper.AdviceMapper;
import com.cl.persistance.mapper.FuneralInfoMapper;
import com.cl.persistance.mapper.MainMapper;
import com.cl.service.impl.MainService;

@Service
public class DummyTask {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FuneralInfoMapper")
	private FuneralInfoMapper funeralInfoMapper;
	
	public void print() throws Exception{
		FuneralInfoDTO f = new FuneralInfoDTO();
		f.setFuneralInfoNo("20");
		f = funeralInfoMapper.getFuneralInfoDetail(f);
		System.out.println(f.getFuneralAddress());
	}
}
