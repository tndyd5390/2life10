package com.cl.service;

import java.util.HashMap;

import com.cl.dto.FuneralNoticeDTO;

public interface IFuneralNoticeService {

	HashMap<String, Object> getFuneralNoticeList(HashMap<String, Object> hMap) throws Exception;

	int insertFuneralNotice(FuneralNoticeDTO fDTO) throws Exception;

	FuneralNoticeDTO getFuneralNoticeDetail(FuneralNoticeDTO fDTO) throws Exception;

	int updateFuneralNotice(FuneralNoticeDTO fDTO) throws Exception;

	int deleteFuneralNotice(String funeralNoticeNo) throws Exception;

	HashMap<String, Object> getUserFuneralNoticeList(HashMap<String, Object> hMap) throws Exception;
	
}
