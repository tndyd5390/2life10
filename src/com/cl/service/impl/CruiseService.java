package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.CruiseDTO;
import com.cl.persistance.mapper.CruiseMapper;
import com.cl.service.ICruiseService;

@Service("CruiseService")
public class CruiseService implements ICruiseService{
	
	@Resource(name="CruiseMapper")
	private CruiseMapper cruiseMapper;

	@Override
	public int insertCruise(CruiseDTO cDTO) throws Exception {
		cruiseMapper.insertCruiseImg(cDTO);
		cruiseMapper.insertCruiseScheFile(cDTO);
		return cruiseMapper.insertCruise(cDTO);
	}
	
}
