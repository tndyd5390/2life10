package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.FuneralNoticeDTO;

@Mapper("FuneralNoticeMapper")
public interface FuneralNoticeMapper {

	List<FuneralNoticeDTO> getFuneralNoticeList(HashMap<String, Object> hMap) throws Exception;

	int insertFuneralNotice(FuneralNoticeDTO fDTO) throws Exception;

	FuneralNoticeDTO getFuneralNoticeDetail(FuneralNoticeDTO fDTO) throws Exception;

	int updateFuneralNotice(FuneralNoticeDTO fDTO) throws Exception;

	int deleteFuneralNotice(String funeralNoticeNo) throws Exception;

}
