package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.CruiseDTO;

@Mapper("CruiseMapper")
public interface CruiseMapper {
	//크루즈 이미지 insert
	public int insertCruiseImg(CruiseDTO cDTO) throws Exception;
	//크루즈 일정 insert
	public int insertCruiseScheFile(CruiseDTO cDTO) throws Exception;
	//크루즈 insert
	public int insertCruise(CruiseDTO cDTO) throws Exception;
	//크루즈 리스트 select
	public List<CruiseDTO> getCruiseList(HashMap<String, Object> hMap) throws Exception;
	//크루즈 파일들의 풀 경로 select
	public String getFileFullPath(String fileNo) throws Exception;
	//크루즈 delete
	public int deleteCruise(CruiseDTO cDTO) throws Exception;
	//크루즈 상세 select
	public CruiseDTO getCruise(String cruiseNo) throws Exception;
	//크루즈 수정 update
	public int updateCruise(CruiseDTO cDTO) throws Exception;
	//크루즈 이미지 delete
	public int deleteCruiseImgFile(CruiseDTO cDTO) throws Exception;
	//크루즈 일정 delete
	public int deleteCruiseScheFile(CruiseDTO cDTO) throws Exception;
}