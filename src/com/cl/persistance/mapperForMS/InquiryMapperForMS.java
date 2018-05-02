package com.cl.persistance.mapperForMS;

import java.util.List;
import java.util.Map;

import com.cl.config.MapperForMS;
import com.cl.dto.InquiryDTO;

@MapperForMS("InquiryMapperForMS")
public interface InquiryMapperForMS {
	public InquiryDTO getInquiryInfo(String memberPreNo) throws Exception;
	public List<InquiryDTO> getInquiryList(String memberPreNo) throws Exception;
	public List<String> getMemberNos(Map<Object, Object> memberInfo) throws Exception;
}
