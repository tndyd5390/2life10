package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.FuneralInfoDTO;

@Mapper("FuneralInfoMapper")
public interface FuneralInfoMapper {

	int insertFuneralInfo(FuneralInfoDTO fDTO) throws Exception;

	List<FuneralInfoDTO> getFuneralInfoList(HashMap<String, Object> hMap) throws Exception;

	FuneralInfoDTO getFuneralInfoDetail(FuneralInfoDTO fDTO) throws Exception;

	int updateFuneralInfo(FuneralInfoDTO fDTO) throws Exception;

	int deleteFuneralInfo(String funeralInfoNo) throws Exception;


}
