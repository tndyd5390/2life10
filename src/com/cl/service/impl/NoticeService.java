package com.cl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.NoticeDTO;
import com.cl.persistance.mapper.NoticeMapper;
import com.cl.service.INoticeService;
import com.cl.util.CmmUtil;
import com.cl.util.FileUtil;

@Service("NoticeService")
public class NoticeService implements INoticeService{
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;

	@Override
	public HashMap<String, Object> getNoticeList(HashMap<String, Object> hMap) throws Exception {
		List<NoticeDTO> nList = noticeMapper.getNoticeList(hMap);
		hMap.put("list", nList);
		if(nList.size()!=0){
			hMap.put("pageList", nList.get(0).getPage());
		}else{
			hMap.put("pageList", 1);
		}
		return hMap;
	}

	@Override
	public int insertNotice(NoticeDTO nDTO) throws Exception {
		if(!"".equals(CmmUtil.nvl(nDTO.getNoticeFileName()))) noticeMapper.insertNoticeFile(nDTO);
		return noticeMapper.insertNotice(nDTO);
	}

	@Override
	public NoticeDTO getNoticeDetail(NoticeDTO nDTO) throws Exception {
		noticeMapper.updateNoticeViewCnt(nDTO);
		return noticeMapper.getNoticeDetail(nDTO);
	}

	@Override
	public int updateNoticeDetail(NoticeDTO nDTO) throws Exception {
		if(!"".equals(CmmUtil.nvl(nDTO.getNoticeFileName()))) noticeMapper.insertNoticeFile(nDTO);
		return noticeMapper.updateNoticeDetail(nDTO);
	}

	@Override
	public int deleteNotice(String noticeNo) throws Exception {
		return noticeMapper.deleteNotice(noticeNo);
	}

	@Override
	public int updateNoticeImgNull(Map<String, String> map) throws Exception {
		String noticeNo = CmmUtil.nvl(map.get("noticeNo"));
		NoticeDTO nDTOTmp = new NoticeDTO();
		nDTOTmp.setNoticeNo(noticeNo);
		String noticeFileNo = CmmUtil.nvl(map.get("noticeFileNo"));
		int result = 0;
		NoticeDTO nDTO = noticeMapper.getNoticeDetail(nDTOTmp);
		int update = noticeMapper.updateNoticeImgNull(map);
		int delete = noticeMapper.deleteNoticeImg(noticeFileNo);
		FileUtil.deleteFile(nDTO.getNoticeFilePath(), nDTO.getNoticeFileName());
		if(update != 0 && delete != 0) {
			result++;
		}
		nDTO = null;
		nDTOTmp = null;
		return result;
	}

	@Override
	public int updateNoticeImg(Map<String, Object> map) throws Exception {
		String preFileNo = CmmUtil.nvl((String)map.get("deleteFileNo"));
		noticeMapper.deleteNoticeImg(preFileNo);
		NoticeDTO nDTO = (NoticeDTO)map.get("nDTO");
		noticeMapper.insertNoticeFile(nDTO);
		return noticeMapper.updateNoticeImg(nDTO);
	}
	
}
