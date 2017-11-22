package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.persistance.mapper.FuneralInfoMapper;
import com.cl.service.IFuneralInfoService;

@Service("FuneralInfoService")
public class FuneralInfoService implements IFuneralInfoService{
	
	@Resource(name="FuneralInfoMapper")
	private FuneralInfoMapper funeralInfoMapper;
	
}
