package com.cl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.CyberDTO;
import com.cl.dto.RegulationDTO;
import com.cl.persistance.mapper.CyberMapper;
import com.cl.service.ICyberService;

@Service("CyberService")
public class CyberService implements ICyberService{
	
	@Resource(name="CyberMapper")
	private CyberMapper cyberMapper;

	@Override
	public int insertCyber(CyberDTO cDTO) throws Exception {
		cyberMapper.insertCyberFile(cDTO);
		return cyberMapper.insertCyber(cDTO);
	}

	@Override
	public HashMap<String, Object> getCyberList(HashMap<String, Object> hMap) throws Exception {
		List<CyberDTO> cList = new ArrayList<>();
		cList = cyberMapper.getCyberList(hMap);
		hMap.put("list", cList);
		if(cList.size() != 0) {
			hMap.put("pageList", cList.get(0).getPage());
		}else {
			hMap.put("pageList", 1);
		}
		return hMap;
	}
}
