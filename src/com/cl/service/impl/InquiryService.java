package com.cl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.InquiryDTO;
import com.cl.persistance.mapper.InquiryMapper;
import com.cl.persistance.mapperForMS.InquiryMapperForMS;
import com.cl.service.IInquiryService;

@Service("InquiryService")
public class InquiryService implements IInquiryService{
	
	@Resource(name="InquiryMapper")
	private InquiryMapper inquiryMapper;
	
	@Resource(name="InquiryMapperForMS")
	private InquiryMapperForMS inquiryMapperForMS;

	@Override
	public Map<String, Object> getInquiryTotal(String memberPreNo) throws Exception {
		InquiryDTO iDTO = inquiryMapperForMS.getInquiryInfo(memberPreNo);
		if(iDTO == null) iDTO = new InquiryDTO();
		List<InquiryDTO> iList = inquiryMapperForMS.getInquiryList(memberPreNo);
		if(iList == null) iList = new ArrayList<>();
		Map<String , Object> map = new HashMap<>();
		map.put("iDTO", iDTO);
		map.put("iList", iList);
		return map;
	}

	@Override
	public List<Map<String, Object>> getInquiryTab(Map<Object, Object> memberInfo) throws Exception {
		List<String> memberNos = inquiryMapperForMS.getMemberNos(memberInfo);
		List<Map<String, Object>> result = new ArrayList<>();
		for(String memberPreNo : memberNos){
			Map<String, Object> inquiry = getInquiryTotal(memberPreNo);
			result.add(inquiry);
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> getInquiryTab(String memberPre) throws Exception {
		List<String> memberNos = inquiryMapperForMS.getMemberNosFromMemberPre(memberPre);
		List<Map<String, Object>> result = new ArrayList<>();
		for(String memberPreNo : memberNos){
			Map<String, Object> inquiry = getInquiryTotal(memberPreNo);
			result.add(inquiry);
		}
		return result;
	}
}
