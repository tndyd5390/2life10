package com.cl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cl.dto.CyberDTO;

public interface ICyberService {
	public int insertCyber(CyberDTO cDTO) throws Exception;
	public HashMap<String, Object> getCyberList(HashMap<String, Object> hMap) throws Exception;
	public CyberDTO getCyberDetail(String cyberNo) throws Exception;
	public int deleteCyber(CyberDTO cDTO) throws Exception;
	public int updateCyberMovie(Map<String, Object> map) throws Exception;
	public int updateCyber(CyberDTO cDTO) throws Exception;
}
