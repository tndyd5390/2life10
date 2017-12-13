package com.cl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.AppliDTO;
import com.cl.dto.CounselDTO;
import com.cl.persistance.mapper.AppliMapper;
import com.cl.service.IAppliService;

@Service("AppliService")
public class AppliService implements IAppliService{
	
	@Resource(name="AppliMapper")
	private AppliMapper appliMapper;

	@Override
	public int insertAppli(AppliDTO aDTO) throws Exception {
		return appliMapper.insertAppli(aDTO);
	}

	@Override
	public HashMap<String, Object> getAppliList(HashMap<String, Object> hMap) throws Exception {
		List<AppliDTO> aList = new ArrayList<>();
		aList = appliMapper.getAppliList(hMap);
		hMap.put("list", aList);
		if(aList.size()!=0){
			hMap.put("pageList", aList.get(0).getPage());
		}else{
			hMap.put("pageList", 1);
		}
		return hMap;
	}

	@Override
	public AppliDTO getAppliDetail(String appliNo) throws Exception {
		return appliMapper.getAppliDetail(appliNo);
	}

	@Override
	public int updateAppliReply(String appliNo) throws Exception {
		return appliMapper.updateAppliReply(appliNo);
	}
}
