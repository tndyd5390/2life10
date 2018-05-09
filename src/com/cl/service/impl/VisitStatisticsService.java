package com.cl.service.impl;

import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.cl.persistance.mapper.VisitStatisticsMapper;
import com.cl.service.IVisitStatisticsService;

@Service("VisitStatisticsService")
public class VisitStatisticsService implements IVisitStatisticsService{

	@Resource(name="VisitStatisticsMapper")
	private VisitStatisticsMapper visitStatisticsMapper;
	
	@Override
	public int insertVisitInfo(Map<String, String> visitInfo) throws Exception {
		System.out.println(visitInfo.get("visitID"));
		return visitStatisticsMapper.insertVisitInfo(visitInfo);
	}

}
