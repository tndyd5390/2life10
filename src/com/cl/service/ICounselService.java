package com.cl.service;

import java.util.HashMap;

import com.cl.dto.CounselDTO;

public interface ICounselService {

	HashMap<String, Object> getCounselList(HashMap<String, Object> hMap) throws Exception;

	int insertCounsel(CounselDTO cDTO) throws Exception;

	CounselDTO getCounselDetail(CounselDTO cDTO) throws Exception;

	int updateReplyStat(CounselDTO cDTO) throws Exception;
	
}
