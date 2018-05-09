package com.cl.persistance.mapper;

import java.util.Map;

import com.cl.config.Mapper;

@Mapper("VisitStatisticsMapper")
public interface VisitStatisticsMapper {
	public int insertVisitInfo(Map<String, String> visitInfo) throws Exception;
}
