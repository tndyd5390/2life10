package com.cl.persistance.mapper;

import java.util.List;
import java.util.Map;

import com.cl.config.Mapper;
import com.cl.dto.VisitStatisticsDTO;

@Mapper("VisitStatisticsMapper")
public interface VisitStatisticsMapper {
	public int insertVisitInfo(Map<String, String> visitInfo) throws Exception;
	public List<VisitStatisticsDTO> getVisitInfo() throws Exception;
	public List<Map<String, String>> getVisitCnt() throws Exception;
}
