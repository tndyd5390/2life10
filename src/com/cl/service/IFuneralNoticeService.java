package com.cl.service;

import java.util.List;

import com.cl.dto.FuneralNoticeDTO;

public interface IFuneralNoticeService {

	List<FuneralNoticeDTO> getFuneralNoticeList(FuneralNoticeDTO fDTO) throws Exception;

	int insertFuneralNotice(FuneralNoticeDTO fDTO) throws Exception;

	FuneralNoticeDTO getFuneralNoticeDetail(FuneralNoticeDTO fDTO) throws Exception;

	int updateFuneralNotice(FuneralNoticeDTO fDTO) throws Exception;

	int deleteFuneralNotice(String funeralNoticeNo) throws Exception;
	
}
