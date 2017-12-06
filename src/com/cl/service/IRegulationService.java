package com.cl.service;

import java.util.HashMap;
import java.util.Map;

import com.cl.dto.RegulationDTO;

public interface IRegulationService {
	public int insertRegulation(RegulationDTO rDTO) throws Exception;
	public HashMap<String, Object> getRegulationList(HashMap<String, Object> hMap) throws Exception;
	public RegulationDTO getRegulationDetail(String regulationNo) throws Exception;
	public RegulationDTO deleteRegulation(String regulationNo) throws Exception;
	public int updateRegulationImgNull(Map<String, String> map) throws Exception;
	public int updateRegulationImg(Map<String, Object> map) throws Exception;
	public int updateRegulationWithoutImg(RegulationDTO rDTO) throws  Exception;
}
