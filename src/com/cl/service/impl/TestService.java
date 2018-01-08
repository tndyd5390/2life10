package com.cl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.TestDTO;
import com.cl.persistance.mapperForMS.TestMapper;
import com.cl.service.ITestService;

@Service("TestService")
public class TestService implements ITestService {
	
	@Resource(name="TestMapper")
	private TestMapper testMapper;
	
	@Override
	public List<TestDTO> getTestList() throws Exception {
		return testMapper.getTestList();
	}

}
