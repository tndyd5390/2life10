package com.cl.quartz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.impl.SLF4JLocationAwareLog;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.cl.dto.AccDTO;
import com.cl.dto.AdviceDTO;
import com.cl.dto.FuneralInfoDTO;
import com.cl.dto.NoticeDTO;
import com.cl.dto.TestDTO;
import com.cl.persistance.mapper.AccMapper;
import com.cl.persistance.mapper.AdviceMapper;
import com.cl.persistance.mapper.FuneralInfoMapper;
import com.cl.persistance.mapper.MainMapper;
import com.cl.persistance.mapperForMS.AccMapperForMS;
import com.cl.persistance.mapperForMS.TestMapper;
import com.cl.service.impl.MainService;
import com.cl.util.CmmUtil;

@Service
public class DummyTask {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AccMapperForMS")
	private AccMapperForMS accMapperForMS;
	@Resource(name="AccMapper")
	private AccMapper accMapper;
	public void print() throws Exception{
		log.info("cron start!!!");
		long start = System.currentTimeMillis();
		int size= Integer.parseInt(accMapperForMS.getAccSize());
		for(int i = 1;i< size; i+=5000 ){
			/*if(i > size - 5000){
				int finalSize = size - i
				for(int j = i; i <= size; i++ )
			}*/
			Map<String, Object> map = new HashMap<>();
			map.put("start", i + "");
			map.put("end", (i + 4999) + "");
			log.info("---------------------");
			log.info("Start : "+i);
			log.info("End : "+(i+4999));
			log.info("---------------------");
			List<AccDTO> aList = accMapperForMS.getAccBetweenAnd(map);
			map.put("accList", aList);
			accMapper.insertAccs(map);
			log.info("i : " + i);
		}
		long end = System.currentTimeMillis();
		long take = end - start;
		log.info("it takes " + take + "ms");
		log.info("cron end");
	}
}
