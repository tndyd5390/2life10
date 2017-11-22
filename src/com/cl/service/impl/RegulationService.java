package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.persistance.mapper.RegulationMapper;
import com.cl.service.IRegulationService;

@Service("RegulationService")
public class RegulationService implements IRegulationService{
	
	@Resource(name="RegulationMapper")
	private RegulationMapper regulationMapper;
	
}
