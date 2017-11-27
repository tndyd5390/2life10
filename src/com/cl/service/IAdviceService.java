package com.cl.service;

import java.util.List;
import java.util.Map;

import com.cl.dto.AdviceDTO;

public interface IAdviceService {
	public Map<String, Object> getAdviceList(Map<String, Integer> startEndPage) throws Exception;
	public int insertAdvice(AdviceDTO aDTO) throws Exception;
	public AdviceDTO getAdviceDetail(String adviceNo) throws Exception;
	public int deleteAdvice(String adviceNo) throws Exception;
	public int updateAdvice(AdviceDTO aDTO) throws Exception;
}
