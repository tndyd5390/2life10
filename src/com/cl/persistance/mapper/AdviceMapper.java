package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cl.config.Mapper;
import com.cl.dto.AdviceDTO;

@Mapper("AdviceMapper")
public interface AdviceMapper {
	public List<AdviceDTO> getAdviceList(HashMap<String, Object> hMap) throws Exception;
	public int insertAdvice(AdviceDTO aDTO) throws Exception;
	public AdviceDTO getAdviceDetail(String adviceNo) throws Exception;
	public int deleteAdvice(String adviceNo) throws Exception;
	public int updateAdvice(AdviceDTO aDTO) throws Exception;
	public int getAdviceRecordCnt() throws Exception;
	public List<AdviceDTO> getAdviceSearch(Map<String, Object> startEndPage) throws Exception;
	public int getAdviceSearchRecordCnt(String adviceSearchName) throws Exception;
}
