package com.cl.persistance.mapper;

import com.cl.config.Mapper;
import com.cl.dto.RegulationDTO;

@Mapper("RegulationMapper")
public interface RegulationMapper {
	public int insertRegulationFile(RegulationDTO rDTO) throws Exception;
	public int insertRegulation(RegulationDTO rDTO) throws Exception;
}
