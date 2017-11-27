package com.cl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.FuneralNoticeDTO;
import com.cl.persistance.mapper.FuneralNoticeMapper;
import com.cl.service.IFuneralNoticeService;

@Service("FuneralNoticeService")
public class FuneralNoticeService implements IFuneralNoticeService{
	
	@Resource(name="FuneralNoticeMapper")
	private FuneralNoticeMapper funeralNoticeMapper;

	@Override
	public List<FuneralNoticeDTO> getFuneralNoticeList(FuneralNoticeDTO fDTO) throws Exception {
		return funeralNoticeMapper.getFuneralNoticeList(fDTO);
	}

	@Override
	public int insertFuneralNotice(FuneralNoticeDTO fDTO) throws Exception {
		return funeralNoticeMapper.insertFuneralNotice(fDTO);
	}

	@Override
	public FuneralNoticeDTO getFuneralNoticeDetail(FuneralNoticeDTO fDTO) throws Exception {
		return funeralNoticeMapper.getFuneralNoticeDetail(fDTO);
	}

	@Override
	public int updateFuneralNotice(FuneralNoticeDTO fDTO) throws Exception {
		return funeralNoticeMapper.updateFuneralNotice(fDTO);
	}

	@Override
	public int deleteFuneralNotice(String funeralNoticeNo) throws Exception {
		return funeralNoticeMapper.deleteFuneralNotice(funeralNoticeNo);
	}
	
}
