package com.cl.service;

import java.util.HashMap;
import java.util.List;

import com.cl.dto.FuneralInfoDTO;

public interface IFuneralInfoService {

	int insertFuneralInfo(FuneralInfoDTO fDTO) throws Exception;

	HashMap<String, Object> getFuneralInfoList(HashMap<String, Object> hMap) throws Exception;

	FuneralInfoDTO getFuneralInfoDetail(FuneralInfoDTO fDTO) throws Exception;

	int updateFuneralInfo(FuneralInfoDTO fDTO) throws Exception;

	int deleteFuneralInfo(String funeralInfoNo) throws Exception;

}
