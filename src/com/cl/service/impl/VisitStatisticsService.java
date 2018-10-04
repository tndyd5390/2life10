package com.cl.service.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.cl.dto.VisitStatisticsDTO;
import com.cl.persistance.mapper.VisitStatisticsMapper;
import com.cl.service.IVisitStatisticsService;

@Service("VisitStatisticsService")
public class VisitStatisticsService implements IVisitStatisticsService{

	@Resource(name="VisitStatisticsMapper")
	private VisitStatisticsMapper visitStatisticsMapper;
	
	@Override
	public int insertVisitInfo(Map<String, String> visitInfo) throws Exception {
		return visitStatisticsMapper.insertVisitInfo(visitInfo);
	}

	@Override
	public List<VisitStatisticsDTO> getVistitInfo() throws Exception {
		return visitStatisticsMapper.getVisitInfo();
	}

	@Override
	public List<Map<String, String>> getVisitCnt() throws Exception {
		return visitStatisticsMapper.getVisitCnt();
	}
	
	@Override
	public Map<String, Object> getVisitAllData() throws Exception {
		
		Map<String, Object> resultMap = new HashMap<>();
		
		List<VisitStatisticsDTO> visitAllList = getVistitInfo();
		List<Map<String, String>> visitCnt = getVisitCnt();
		resultMap.put("visitAllList", visitAllList);
		resultMap.put("visitCnt", visitCnt);
		return resultMap;
	}
}
