package com.cl.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.CodeDTO;
import com.cl.dto.FuneralInfoDTO;
import com.cl.persistance.mapper.CodeMapper;
import com.cl.persistance.mapper.FuneralInfoMapper;
import com.cl.service.ICodeService;
import com.cl.service.IFuneralInfoService;

@Service("CodeService")
public class CodeService implements ICodeService{
	
	@Resource(name="CodeMapper")
	private CodeMapper codeMapper;

	@Override
	public HashMap<String, List<CodeDTO>> getCodeList() throws Exception {
		
		HashMap<String, List<CodeDTO>> hashMap = new HashMap<>();
		hashMap.put("funeralList", codeMapper.getFuneralList());
		hashMap.put("geoList", codeMapper.getGeoList());
		hashMap.put("telList", codeMapper.getTelList());
		
		return hashMap;
	}

}
