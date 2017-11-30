package com.cl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.CounselDTO;
import com.cl.persistance.mapper.CounselMapper;
import com.cl.service.ICounselService;

@Service("CounselService")
public class CounselService implements ICounselService{
	
	@Resource(name="CounselMapper")
	private CounselMapper counselMapper;

	@Override
	public HashMap<String, Object> getCounselList(HashMap<String, Object> hMap) throws Exception {
		List<CounselDTO> cList = new ArrayList<>();
		cList = counselMapper.getCounselList(hMap);
		hMap.put("list", cList);
		if(cList.size()!=0){
			hMap.put("pageList", cList.get(0).getPage());
		}else{
			hMap.put("pageList", 1);
		}
		
		return hMap;
	}

	@Override
	public int insertCounsel(CounselDTO cDTO) throws Exception {
		return counselMapper.insertCounsel(cDTO);
	}

	@Override
	public CounselDTO getCounselDetail(CounselDTO cDTO) throws Exception {
		return counselMapper.getCounselDetail(cDTO);
	}

	@Override
	public int updateReplyStat(CounselDTO cDTO) throws Exception {
		return counselMapper.updateReplyStat(cDTO);
	}
	
}
