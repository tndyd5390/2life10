package com.cl.service;

import java.util.HashMap;
import java.util.List;

import com.cl.dto.CodeDTO;
import com.cl.dto.FuneralInfoDTO;

public interface IFuneralInfoService {

	HashMap<String, List<CodeDTO>> getCodeList() throws Exception;

	int insertFuneralInfo(FuneralInfoDTO fDTO) throws Exception;

	List<FuneralInfoDTO> getFuneralInfoList(FuneralInfoDTO fDTO) throws Exception;

	FuneralInfoDTO getFuneralInfoDetail(FuneralInfoDTO fDTO) throws Exception;

	int updateFuneralInfo(FuneralInfoDTO fDTO) throws Exception;

	int deleteFuneralInfo(String funeralInfoNo) throws Exception;

	List<FuneralInfoDTO> getFuneralInfoSearch(FuneralInfoDTO fDTO) throws Exception;
	
}
