package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.persistance.mapper.AdviceMapper;
import com.cl.service.IAdviceService;

@Service("AdviceService")
public class AdviceService implements IAdviceService{
	
	@Resource(name="AdviceMapper")
	private AdviceMapper adviceMapper;
	
}
