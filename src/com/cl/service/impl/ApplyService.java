package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.persistance.mapper.ApplyMapper;
import com.cl.service.IApplyService;

@Service("ApplyService")
public class ApplyService implements IApplyService{
	
	@Resource(name="ApplyMapper")
	private ApplyMapper applyMapper;
	
}
