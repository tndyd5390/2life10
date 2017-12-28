package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.CyberDTO;

@Mapper("CyberMapper")
public interface CyberMapper {
	public int insertCyberFile(CyberDTO cDTO) throws Exception;
	public int insertCyber(CyberDTO cDTO) throws Exception;
	public List<CyberDTO> getCyberList(HashMap<String, Object> hMap) throws Exception;
	public CyberDTO getCyberDetail(String cyberNo) throws Exception;
	public int deleteCyber(CyberDTO cDTO) throws Exception;
	public int deleteCyberFile(String fileNo) throws Exception;
	public int updateCyberMovie(CyberDTO cDTO) throws Exception;
	public int updateCyber(CyberDTO cDTO) throws Exception;
	public CyberDTO getCyberFileInfo(String cyberNo) throws Exception;
	public int updateCyberCnt(String cyberNo) throws Exception;
}
