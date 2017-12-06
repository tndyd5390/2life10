package com.cl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

	@Override
	public HashMap<String, Object> getRegulationList(HashMap<String, Object> hMap) throws Exception {
		List<RegulationDTO> rList = new ArrayList<>();
		rList = regulationMapper.getRegulationList(hMap);
		hMap.put("list", rList);
		if(rList.size() != 0) {
			hMap.put("pageList", rList.get(0).getPage());
		}else {
			hMap.put("pageList", 1);
		}
		return hMap;
	}
	
}
