package com.cl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cl.dto.AdviceDTO;

public interface IAdviceService {
	public HashMap<String, Object> getAdviceList(HashMap<String, Object> hMap) throws Exception;
	public int insertAdvice(AdviceDTO aDTO) throws Exception;
	public AdviceDTO getAdviceDetail(String adviceNo) throws Exception;
	public int deleteAdvice(String adviceNo) throws Exception;
	public int updateAdvice(AdviceDTO aDTO) throws Exception;
	public Map<String, Object> getAdivceSearch(Map<String, Object> startEndPage) throws Exception;
}
