package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.persistance.mapper.InquiryMapper;
import com.cl.service.IInquiryService;

@Service("InquiryService")
public class InquiryService implements IInquiryService{
	
	@Resource(name="InquiryMapper")
	private InquiryMapper inquiryMapper;
	
}
