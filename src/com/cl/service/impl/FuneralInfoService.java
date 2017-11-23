package com.cl.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.CodeDTO;
import com.cl.dto.FuneralInfoDTO;
import com.cl.persistance.mapper.FuneralInfoMapper;
import com.cl.service.IFuneralInfoService;

@Service("FuneralInfoService")
public class FuneralInfoService implements IFuneralInfoService{
	
	@Resource(name="FuneralInfoMapper")
	private FuneralInfoMapper funeralInfoMapper;

	@Override
	public HashMap<String, List<CodeDTO>> getCodeList() throws Exception {
		
		HashMap<String, List<CodeDTO>> hashMap = new HashMap<>();
		hashMap.put("funeralList", funeralInfoMapper.getFuneralList());
		hashMap.put("geoList", funeralInfoMapper.getGeoList());
		
		return hashMap;
	}

	@Override
	public int insertFuneralInfo(FuneralInfoDTO fDTO) throws Exception {
		return funeralInfoMapper.insertFuneralInfo(fDTO);
	}

	@Override
	public List<FuneralInfoDTO> getFuneralInfoList() throws Exception {
		return funeralInfoMapper.getFuneralInfoList();
	}

	@Override
	public FuneralInfoDTO getFuneralInfoDetail(FuneralInfoDTO fDTO) throws Exception {
		return funeralInfoMapper.getFuneralInfoDetail(fDTO);
	}
	
}
