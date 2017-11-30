package com.cl.service;

import java.util.HashMap;

import com.cl.dto.NoticeDTO;

public interface INoticeService {

	HashMap<String, Object> getNoticeList(HashMap<String, Object> hMap) throws Exception;

	int insertNotice(NoticeDTO nDTO) throws Exception;

	NoticeDTO getNoticeDetail(NoticeDTO nDTO) throws Exception;

	int updateNoticeDetail(NoticeDTO nDTO) throws Exception;

	int deleteNotice(String noticeNo) throws Exception;
	
}
