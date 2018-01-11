package com.cl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.AccDTO;
import com.cl.persistance.mapper.AccMapper;
import com.cl.persistance.mapperForMS.AccMapperForMS;
import com.cl.service.IAccService;

@Service("AccService")
public class AccService implements IAccService {

	@Resource(name="AccMapper")
	private AccMapper accMapper;
	

}
