package com.cl.service;

import java.util.List;
import java.util.Map;

public interface IInquiryService {
	public Map<String, Object> getInquiryTotal(String memberPreNo) throws Exception;
	public List<Map<String, Object>> getInquiryTab(Map<Object, Object> memberInfo) throws Exception;
	public List<Map<String, Object>> getInquiryTab(String memberPre) throws Exception;
}
