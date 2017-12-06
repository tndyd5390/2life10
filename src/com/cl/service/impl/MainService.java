package com.cl.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.FuneralNoticeDTO;
import com.cl.dto.NoticeDTO;
import com.cl.persistance.mapper.MainMapper;
import com.cl.service.IMainService;

@Service("MainService")
public class MainService implements IMainService{
	
	@Resource(name="MainMapper")
	private MainMapper mainMapper;

	@Override
	public HashMap<String, Object> getMainList() throws Exception {
		
		HashMap<String, Object> hMap = new HashMap<>();
		List<NoticeDTO> nList = mainMapper.getMainNoticeList();
		List<FuneralNoticeDTO> fList = mainMapper.getMainFuneralNoticeList();
		
		hMap.put("nList", nList);
		hMap.put("fList", fList);
		
		return hMap;
	}
	
}
