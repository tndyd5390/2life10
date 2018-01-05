package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cl.config.Mapper;
import com.cl.dto.NoticeDTO;

@Mapper("NoticeMapper")
public interface NoticeMapper {

	List<NoticeDTO> getNoticeList(HashMap<String, Object> hMap) throws Exception;

	int insertNotice(NoticeDTO nDTO) throws Exception;

	NoticeDTO getNoticeDetail(NoticeDTO nDTO) throws Exception;

	void updateNoticeViewCnt(NoticeDTO nDTO) throws Exception;

	int updateNoticeDetail(NoticeDTO nDTO) throws Exception;

	int deleteNotice(String noticeNo) throws Exception;
	
	public int insertNoticeFile(NoticeDTO nDTO) throws Exception;
	
	public int updateNoticeImgNull(Map<String, String> map) throws Exception;
	
	public int deleteNoticeImg(String noticeFileNo) throws Exception;
	
	public int updateNoticeImg(NoticeDTO nDTO) throws Exception;
}
