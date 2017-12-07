package com.cl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.AdviceDTO;
import com.cl.dto.FuneralNoticeDTO;
import com.cl.persistance.mapper.AdviceMapper;
import com.cl.service.IAdviceService;

@Service("AdviceService")
public class AdviceService implements IAdviceService{
	
	@Resource(name="AdviceMapper")
	private AdviceMapper adviceMapper;

	@Override
	public HashMap<String, Object> getAdviceList(HashMap<String, Object> hMap) throws Exception {
		List<AdviceDTO> aList = new ArrayList<>();
		aList = adviceMapper.getAdviceList(hMap);
		hMap.put("list", aList);
		if(aList.size()!=0){
			hMap.put("pageList", aList.get(0).getPage());
		}else{
			hMap.put("pageList", 1);
		}
		return hMap;
	}
	
	@Override
	public int insertAdvice(AdviceDTO aDTO) throws Exception {
		return adviceMapper.insertAdvice(aDTO);
	}

	@Override
	public AdviceDTO getAdviceDetail(String adviceNo) throws Exception {
		return adviceMapper.getAdviceDetail(adviceNo);
	}

	@Override
	public int deleteAdvice(String adviceNo) throws Exception {
		return adviceMapper.deleteAdvice(adviceNo);
	}

	@Override
	public int updateAdvice(AdviceDTO aDTO) throws Exception {
		return adviceMapper.updateAdvice(aDTO);
	}
}
