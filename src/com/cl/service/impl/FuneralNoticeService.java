package com.cl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.FuneralNoticeDTO;
import com.cl.persistance.mapper.FuneralNoticeMapper;
import com.cl.service.IFuneralNoticeService;

@Service("FuneralNoticeService")
public class FuneralNoticeService implements IFuneralNoticeService{
	
	@Resource(name="FuneralNoticeMapper")
	private FuneralNoticeMapper funeralNoticeMapper;

	@Override
	public int insertFuneralNotice(FuneralNoticeDTO fDTO) throws Exception {
		return funeralNoticeMapper.insertFuneralNotice(fDTO);
	}

	@Override
	public FuneralNoticeDTO getFuneralNoticeDetail(FuneralNoticeDTO fDTO) throws Exception {
		return funeralNoticeMapper.getFuneralNoticeDetail(fDTO);
	}

	@Override
	public int updateFuneralNotice(FuneralNoticeDTO fDTO) throws Exception {
		return funeralNoticeMapper.updateFuneralNotice(fDTO);
	}

	@Override
	public int deleteFuneralNotice(String funeralNoticeNo) throws Exception {
		return funeralNoticeMapper.deleteFuneralNotice(funeralNoticeNo);
	}

	@Override
	public HashMap<String, Object> getFuneralNoticeList(HashMap<String, Object> hMap) throws Exception {
		List<FuneralNoticeDTO> fList = new ArrayList<>();
		fList = funeralNoticeMapper.getFuneralNoticeList(hMap);
		hMap.put("list", fList);
		
		if(fList.size()!=0){
			hMap.put("pageList", fList.get(0).getPage());
		}else{
			hMap.put("pageList", 1);
		}
		return hMap;
	}
	
}
