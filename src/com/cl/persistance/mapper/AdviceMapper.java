package com.cl.persistance.mapper;

import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.AdviceDTO;

@Mapper("AdviceMapper")
public interface AdviceMapper {
	public List<AdviceDTO> getAdviceList() throws Exception;
	public int insertAdvice(AdviceDTO aDTO) throws Exception;
	public AdviceDTO getAdviceDetail(String adviceNo) throws Exception;
	public int deleteAdvice(String adviceNo) throws Exception;
	public int updateAdvice(AdviceDTO aDTO) throws Exception;
}
