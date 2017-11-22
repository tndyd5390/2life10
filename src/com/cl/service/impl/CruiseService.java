package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.persistance.mapper.CruiseMapper;
import com.cl.service.ICruiseService;

@Service("CruiseService")
public class CruiseService implements ICruiseService{
	
	@Resource(name="CruiseMapper")
	private CruiseMapper cruiseMapper;
	
}
