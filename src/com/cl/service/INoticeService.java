package com.cl.service;

import java.util.HashMap;
import java.util.Map;

import com.cl.dto.NoticeDTO;

public interface INoticeService {

	HashMap<String, Object> getNoticeList(HashMap<String, Object> hMap) throws Exception;

	int insertNotice(NoticeDTO nDTO) throws Exception;

	NoticeDTO getNoticeDetail(NoticeDTO nDTO) throws Exception;

	int updateNoticeDetail(NoticeDTO nDTO) throws Exception;

	int deleteNotice(String noticeNo) throws Exception;
	
	public int updateNoticeImgNull(Map<String, String> map) throws Exception;
	
	public int updateNoticeImg(Map<String, Object> map) throws Exception;
}
