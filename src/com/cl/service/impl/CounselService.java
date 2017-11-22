package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.persistance.mapper.CounselMapper;
import com.cl.service.ICounselService;

@Service("CounselService")
public class CounselService implements ICounselService{
	
	@Resource(name="CounselMapper")
	private CounselMapper counselMapper;
	
}
