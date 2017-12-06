package com.cl.service;

import java.util.HashMap;

import com.cl.dto.RegulationDTO;

public interface IRegulationService {
	public int insertRegulation(RegulationDTO rDTO) throws Exception;
	public HashMap<String, Object> getRegulationList(HashMap<String, Object> hMap) throws Exception;
}
