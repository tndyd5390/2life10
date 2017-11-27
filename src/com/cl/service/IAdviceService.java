package com.cl.service;

import java.util.List;

import com.cl.dto.AdviceDTO;

public interface IAdviceService {
	public List<AdviceDTO> getAdviceList() throws Exception;
	public int insertAdvice(AdviceDTO aDTO) throws Exception;
	public AdviceDTO getAdviceDetail(String adviceNo) throws Exception;
	public int deleteAdvice(String adviceNo) throws Exception;
	public int updateAdvice(AdviceDTO aDTO) throws Exception;
}
