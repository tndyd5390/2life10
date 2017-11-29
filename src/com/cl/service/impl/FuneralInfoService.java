package com.cl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.FuneralInfoDTO;
import com.cl.persistance.mapper.FuneralInfoMapper;
import com.cl.service.IFuneralInfoService;

@Service("FuneralInfoService")
public class FuneralInfoService implements IFuneralInfoService{
	
	@Resource(name="FuneralInfoMapper")
	private FuneralInfoMapper funeralInfoMapper;

	@Override
	public int insertFuneralInfo(FuneralInfoDTO fDTO) throws Exception {
		return funeralInfoMapper.insertFuneralInfo(fDTO);
	}

	@Override
	public HashMap<String, Object> getFuneralInfoList(HashMap<String, Object> hMap) throws Exception {
		List<FuneralInfoDTO> fList = new ArrayList<>();
		fList = funeralInfoMapper.getFuneralInfoList(hMap);
		hMap.put("list", fList);
		if(fList.size()!=0){
			hMap.put("pageList", fList.get(0).getPage());
		}else{
			hMap.put("pageList", 1);
		}
		
		return hMap;
	}

	@Override
	public FuneralInfoDTO getFuneralInfoDetail(FuneralInfoDTO fDTO) throws Exception {
		return funeralInfoMapper.getFuneralInfoDetail(fDTO);
	}

	@Override
	public int updateFuneralInfo(FuneralInfoDTO fDTO) throws Exception {
		return funeralInfoMapper.updateFuneralInfo(fDTO);
	}

	@Override
	public int deleteFuneralInfo(String funeralInfoNo) throws Exception {
		return funeralInfoMapper.deleteFuneralInfo(funeralInfoNo);
	}
}
