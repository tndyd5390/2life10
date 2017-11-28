package com.cl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.AdviceDTO;
import com.cl.persistance.mapper.AdviceMapper;
import com.cl.service.IAdviceService;

@Service("AdviceService")
public class AdviceService implements IAdviceService{
	
	@Resource(name="AdviceMapper")
	private AdviceMapper adviceMapper;

	@Override
	public Map<String, Object> getAdviceList(Map<String, Integer> startEndPage) throws Exception {
		Map<String, Object> aMap = new HashMap<>();
		aMap.put("aList", adviceMapper.getAdviceList(startEndPage));
		aMap.put("adviceRecordCnt", adviceMapper.getAdviceRecordCnt());
		return aMap;
	}
	
	@Override
	public int insertAdvice(AdviceDTO aDTO) throws Exception {
		return adviceMapper.insertAdvice(aDTO);
	}

	@Override
	public AdviceDTO getAdviceDetail(String adviceNo) throws Exception {
		return adviceMapper.getAdviceDetail(adviceNo);
	}

	@Override
	public int deleteAdvice(String adviceNo) throws Exception {
		return adviceMapper.deleteAdvice(adviceNo);
	}

	@Override
	public int updateAdvice(AdviceDTO aDTO) throws Exception {
		return adviceMapper.updateAdvice(aDTO);
	}

	@Override
	public Map<String, Object> getAdivceSearch(Map<String, Object> startEndPage) throws Exception {
		Map<String, Object> aMap = new HashMap<>();
		aMap.put("aList", adviceMapper.getAdviceSearch(startEndPage));
		aMap.put("adviceRecordCnt", adviceMapper.getAdviceSearchRecordCnt((String)startEndPage.get("searchWord")));
		return aMap;
	}
}
