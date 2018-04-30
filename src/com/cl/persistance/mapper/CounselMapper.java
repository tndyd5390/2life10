package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.CounselDTO;

@Mapper("CounselMapper")

public interface CounselMapper {

	List<CounselDTO> getCounselList(HashMap<String, Object> hMap) throws Exception;

	int insertCounsel(CounselDTO cDTO) throws Exception;

	CounselDTO getCounselDetail(CounselDTO cDTO) throws Exception;

	int updateReplyStat(CounselDTO cDTO) throws Exception;
	
	int deleteCounsel(String cNo) throws Exception;
}
