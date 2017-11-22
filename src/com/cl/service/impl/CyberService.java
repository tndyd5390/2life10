package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.persistance.mapper.CyberMapper;
import com.cl.service.ICyberService;

@Service("CyberService")
public class CyberService implements ICyberService{
	
	@Resource(name="CyberMapper")
	private CyberMapper cyberMapper;
	
}
