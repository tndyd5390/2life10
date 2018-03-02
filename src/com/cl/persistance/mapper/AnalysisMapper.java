package com.cl.persistance.mapper;

import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.AnalysisDTO;

@Mapper("AnalysisMapper")
public interface AnalysisMapper {

	List<AnalysisDTO> getSexAnalysisData() throws Exception;

	List<AnalysisDTO> getAgeAnalysisData() throws Exception;

	List<AnalysisDTO> getReRegAnalysis() throws Exception;

	List<AnalysisDTO> getRegYearAnalysis() throws Exception;

	List<AnalysisDTO> getStateAnalysis() throws Exception;

	List<AnalysisDTO> getItemAnalysis() throws Exception;

	List<AnalysisDTO> getCityAnalysis(String state) throws Exception;
}
