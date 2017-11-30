package com.cl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.CruiseDTO;
import com.cl.dto.FuneralNoticeDTO;
import com.cl.persistance.mapper.CruiseMapper;
import com.cl.service.ICruiseService;
import com.cl.util.CmmUtil;

@Service("CruiseService")
public class CruiseService implements ICruiseService{
	
	@Resource(name="CruiseMapper")
	private CruiseMapper cruiseMapper;

	@Override
	public int insertCruise(CruiseDTO cDTO) throws Exception {
		cruiseMapper.insertCruiseImg(cDTO);
		cruiseMapper.insertCruiseScheFile(cDTO);
		return cruiseMapper.insertCruise(cDTO);
	}

	@Override
	public HashMap<String, Object> getCruiseList(HashMap<String, Object> hMap) throws Exception {
		List<CruiseDTO> cList = new ArrayList<>();
		cList = cruiseMapper.getCruiseList(hMap);
		hMap.put("list", cList);
		if(cList.size()!=0){
			hMap.put("pageList", cList.get(0).getPage());
		}else{
			hMap.put("pageList", 1);
		}
		return hMap;
	}

	@Override
	public Map<String, String> deleteCruise(CruiseDTO cDTO) throws Exception {
		String imgFullPath = cruiseMapper.getFileFullPath(cDTO.getCruiseImgFileNo() + "");
		String pdfFullPath = cruiseMapper.getFileFullPath(cDTO.getCruiseScheFileNo() + "");
		int result = cruiseMapper.deleteCruise(cDTO);
		Map<String, String> fileNames = new HashMap<>();
		if(result != 0){
			fileNames.put("imgFullPath", imgFullPath);
			fileNames.put("pdfFullPath", pdfFullPath);
		}else{
			fileNames = null;	
		}
		return fileNames;
	}

	@Override
	public CruiseDTO getCruise(String cruiseNo) throws Exception {
		return cruiseMapper.getCruise(cruiseNo);
	}

	@Override
	public boolean updateCruise(CruiseDTO cDTO) throws Exception {
		boolean result = false;
		int queryResult;
		if(CmmUtil.nvl(cDTO.getCruiseImgFileOrgName()).equals("") && 
				CmmUtil.nvl(cDTO.getCruiseScheFileOrgName()).equals("")){
			//둘다 안바꿀 경우
			queryResult = cruiseMapper.updateCruise(cDTO);
			if(queryResult != 0) result = true;
		}else if((!CmmUtil.nvl(cDTO.getCruiseImgFileOrgName()).equals("")) && 
				CmmUtil.nvl(cDTO.getCruiseScheFileOrgName()).equals("")){
			//이미지만 바꿀경우
			cruiseMapper.deleteCruiseImgFile(cDTO);
			cruiseMapper.insertCruiseImg(cDTO);
			queryResult = cruiseMapper.updateCruise(cDTO);
			if(queryResult != 0) result = true;
		}else if(CmmUtil.nvl(cDTO.getCruiseImgFileOrgName()).equals("") && 
				(!CmmUtil.nvl(cDTO.getCruiseScheFileOrgName()).equals(""))){
			//일정만 바꿀경우
			cruiseMapper.deleteCruiseScheFile(cDTO);
			cruiseMapper.insertCruiseScheFile(cDTO);
			queryResult = cruiseMapper.updateCruise(cDTO);
			if(queryResult != 0) result = true;
		}else if((!CmmUtil.nvl(cDTO.getCruiseScheFileOrgName()).equals("")) &&
				(!CmmUtil.nvl(cDTO.getCruiseImgFileOrgName()).equals(""))){
			//둘다 바꿀경우
			cruiseMapper.deleteCruiseImgFile(cDTO);
			cruiseMapper.deleteCruiseScheFile(cDTO);
			cruiseMapper.insertCruiseImg(cDTO);
			cruiseMapper.insertCruiseScheFile(cDTO);
			queryResult = cruiseMapper.updateCruise(cDTO);
			if(queryResult != 0) result = true;
		}else{
			result = false;
		}
		return result;
	}

	
}
