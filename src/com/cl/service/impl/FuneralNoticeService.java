package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.persistance.mapper.FuneralNoticeMapper;
import com.cl.service.IFuneralNoticeService;

@Service("FuneralNoticeService")
public class FuneralNoticeService implements IFuneralNoticeService{
	
	@Resource(name="FuneralNoticeMapper")
	private FuneralNoticeMapper funeralNoticeMapper;
	
}
