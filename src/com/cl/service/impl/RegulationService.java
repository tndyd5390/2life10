package com.cl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.RegulationDTO;
import com.cl.persistance.mapper.RegulationMapper;
import com.cl.service.IRegulationService;
import com.cl.util.CmmUtil;
import com.cl.util.FileUtil;

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

	@Override
	public RegulationDTO getRegulationDetail(String regulationNo) throws Exception {
		return regulationMapper.getRegulationDetail(regulationNo);
	}

	@Override
	public RegulationDTO deleteRegulation(String regulationNo) throws Exception {
		RegulationDTO rDTO = regulationMapper.getRegulationDetail(regulationNo);
		int result = regulationMapper.deleteRegulation(rDTO);
		if(result == 0) {
			rDTO = null;
		}
		return rDTO; 
	}

	@Override
	public int updateRegulationImgNull(Map<String, String> map) throws Exception {
		String regulationNo = CmmUtil.nvl(map.get("regulationNo"));
		String regulationFileNo = CmmUtil.nvl(map.get("regulationFileNo"));
		System.out.println(regulationNo);
		System.out.println(regulationFileNo);
		int result = 0;
		RegulationDTO rDTO = regulationMapper.getRegulationDetail(regulationNo);
		int update = regulationMapper.updateRegulationImgNull(map);
		int delete = regulationMapper.deleteRegulationImg(regulationFileNo);
		FileUtil.deleteFile(rDTO.getRegulationFilePath(), rDTO.getRegulationFileName());
		if(update != 0 && delete != 0) {
			result++;
		}
		rDTO = null;
		return result;
	}

	@Override
	public int updateRegulationImg(Map<String, Object> map) throws Exception {
		String preFileNo = CmmUtil.nvl((String)map.get("deleteFileNo"));
		regulationMapper.deleteRegulationImg(preFileNo);
		RegulationDTO rDTO = (RegulationDTO)map.get("rDTO");
		regulationMapper.insertRegulationFile(rDTO);
		return regulationMapper.updateRegulationImg(rDTO);
	}

	@Override
	public int updateRegulation(RegulationDTO rDTO) throws Exception {
		if(!"".equals(CmmUtil.nvl(rDTO.getRegulationFileName()))) {
			regulationMapper.insertRegulationFile(rDTO);
		}
		return regulationMapper.updateRegulation(rDTO);
	}
	
}
