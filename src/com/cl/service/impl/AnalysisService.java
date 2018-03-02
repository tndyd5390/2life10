package com.cl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.AnalysisDTO;
import com.cl.persistance.mapper.AnalysisMapper;
import com.cl.service.IAnalysisService;

@Service("AnalysisService")
public class AnalysisService implements IAnalysisService {
	
	@Resource(name="AnalysisMapper")
	private AnalysisMapper analysisMapper;

	@Override
	public List<AnalysisDTO> getSexAnalysisData() throws Exception {
		return analysisMapper.getSexAnalysisData();
	}

	@Override
	public List<AnalysisDTO> getAgeAnalysisData() throws Exception {
		return analysisMapper.getAgeAnalysisData();
	}

	@Override
	public List<AnalysisDTO> getReRegAnalysis() throws Exception {
		return analysisMapper.getReRegAnalysis();
	}

	@Override
	public List<AnalysisDTO> getRegYearAnalysis() throws Exception {
		return analysisMapper.getRegYearAnalysis();
	}

	@Override
	public List<AnalysisDTO> getStateAnalysis() throws Exception {
		return analysisMapper.getStateAnalysis();
	}
	
}
