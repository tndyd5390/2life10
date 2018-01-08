package com.cl.service;

import java.util.List;

import com.cl.dto.TestDTO;

public interface ITestService {
	public List<TestDTO> getTestList() throws Exception;
}
