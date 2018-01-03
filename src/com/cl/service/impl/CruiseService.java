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
		//크루즈 이미지 등록
		cruiseMapper.insertCruiseImg(cDTO);
		//크루즈 일정 등록
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
		//크루즈 이미지 절대경로 가져오기
		String imgFullPath = cruiseMapper.getFileFullPath(cDTO.getCruiseImgFileNo() + "");
		//크루즈 일정파일 절대경로 가져오기
		String pdfFullPath = cruiseMapper.getFileFullPath(cDTO.getCruiseScheFileNo() + "");
		//크루즈 삭제
		int result = cruiseMapper.deleteCruise(cDTO);
		Map<String, String> fileNames = new HashMap<>();
		if(result != 0){
			fileNames.put("imgFullPath", imgFullPath);
			fileNames.put("pdfFullPath", pdfFullPath);
		}else{
			fileNames = null;	
		}
		//파일의 절대경로를 반환하여 contorller에서 삭제
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
			//이미지만 바꿀경우 기존 이미지 삭제후 새로 insert
			cruiseMapper.deleteCruiseImgFile(cDTO);
			cruiseMapper.insertCruiseImg(cDTO);
			queryResult = cruiseMapper.updateCruise(cDTO);
			if(queryResult != 0) result = true;
		}else if(CmmUtil.nvl(cDTO.getCruiseImgFileOrgName()).equals("") && 
				(!CmmUtil.nvl(cDTO.getCruiseScheFileOrgName()).equals(""))){
			//일정만 바꿀경우 기존 일정 삭제후 새로 insert
			cruiseMapper.deleteCruiseScheFile(cDTO);
			cruiseMapper.insertCruiseScheFile(cDTO);
			queryResult = cruiseMapper.updateCruise(cDTO);
			if(queryResult != 0) result = true;
		}else if((!CmmUtil.nvl(cDTO.getCruiseScheFileOrgName()).equals("")) &&
				(!CmmUtil.nvl(cDTO.getCruiseImgFileOrgName()).equals(""))){
			//둘다 바꿀경우 둘다 삭제후 새로 insert
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

	@Override
	public boolean orderByCruise(String[] cruiseList) throws Exception {
		int i = 1;
		try{
			for(String cruiseNo : cruiseList){
				Map<String, String> hMap = new HashMap<>();
				hMap.put("cruiseNo", cruiseNo);
				hMap.put("cruiseOrderNo", i + "");
				i++;
				cruiseMapper.updateCruiseOrderBy(hMap);
			}
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<CruiseDTO> getCruiseListWithoutPaging() throws Exception {
		return cruiseMapper.getCruiseListWithoutPaging();
	}
}