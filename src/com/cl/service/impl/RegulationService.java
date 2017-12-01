package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.RegulationDTO;
import com.cl.persistance.mapper.RegulationMapper;
import com.cl.service.IRegulationService;
import com.cl.util.CmmUtil;

@Service("RegulationService")
public class RegulationService implements IRegulationService{
	
	@Resource(name="RegulationMapper")
	private RegulationMapper regulationMapper;

	@Override
	public int insertRegulation(RegulationDTO rDTO) throws Exception {
		if(!"".equals(CmmUtil.nvl(rDTO.getRegulationFileName()))) regulationMapper.insertRegulationFile(rDTO);
		return regulationMapper.insertRegulation(rDTO);
	}
	
}
