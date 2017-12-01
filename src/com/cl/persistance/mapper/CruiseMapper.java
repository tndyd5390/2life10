package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.CruiseDTO;

@Mapper("CruiseMapper")
public interface CruiseMapper {
	public int insertCruiseImg(CruiseDTO cDTO) throws Exception;
	public int insertCruiseScheFile(CruiseDTO cDTO) throws Exception;
	public int insertCruise(CruiseDTO cDTO) throws Exception;
	public List<CruiseDTO> getCruiseList(HashMap<String, Object> hMap) throws Exception;
	public String getFileFullPath(String fileNo) throws Exception;
	public int deleteCruise(CruiseDTO cDTO) throws Exception;
	public CruiseDTO getCruise(String cruiseNo) throws Exception;
	public int updateCruise(CruiseDTO cDTO) throws Exception;
	public int deleteCruiseImgFile(CruiseDTO cDTO) throws Exception;
	public int deleteCruiseScheFile(CruiseDTO cDTO) throws Exception;
}