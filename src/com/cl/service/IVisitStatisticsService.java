package com.cl.service;

import java.util.List;
import java.util.Map;

import com.cl.dto.VisitStatisticsDTO;

public interface IVisitStatisticsService {
	public int insertVisitInfo(Map<String, String> visitInfo) throws Exception;
	public List<VisitStatisticsDTO> getVistitInfo() throws Exception;
	public List<Map<String, String>> getVisitCnt() throws Exception;
	public Map<String, Object> getVisitAllData() throws Exception;
	
}
