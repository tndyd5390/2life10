package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cl.config.Mapper;
import com.cl.dto.RegulationDTO;

@Mapper("RegulationMapper")
public interface RegulationMapper {
	public int insertRegulationFile(RegulationDTO rDTO) throws Exception;
	public int insertRegulation(RegulationDTO rDTO) throws Exception;
	public List<RegulationDTO> getRegulationList(HashMap<String, Object> hMap) throws Exception;
	public RegulationDTO getRegulationDetail(String regulationNo) throws Exception;
	public int deleteRegulation(RegulationDTO rDTO) throws Exception;
	public int updateRegulationImgNull(Map<String, String> map) throws Exception;
	public int deleteRegulationImg(String regulationFileNo) throws Exception;
	public int updateRegulationImg(RegulationDTO rDTO) throws Exception;
	public int updateRegulation(RegulationDTO rDTO) throws Exception;
	public int updateRegulationViewCnt(String regulationNo) throws Exception;
}
