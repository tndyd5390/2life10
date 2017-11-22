package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.persistance.mapper.NoticeMapper;
import com.cl.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService{
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;
	
}
