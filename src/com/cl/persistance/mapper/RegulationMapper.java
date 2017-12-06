package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.RegulationDTO;

@Mapper("RegulationMapper")
public interface RegulationMapper {
	public int insertRegulationFile(RegulationDTO rDTO) throws Exception;
	public int insertRegulation(RegulationDTO rDTO) throws Exception;
	public List<RegulationDTO> getRegulationList(HashMap<String, Object> hMap) throws Exception;
}
