package com.cl.persistance.mapper;

import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.FuneralNoticeDTO;
import com.cl.dto.NoticeDTO;

@Mapper("MainMapper")
public interface MainMapper {

	List<NoticeDTO> getMainNoticeList() throws Exception;

	List<FuneralNoticeDTO> getMainFuneralNoticeList() throws Exception;

}
