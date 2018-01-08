package com.cl.persistance.mapperForMS;

import java.util.List;

import com.cl.config.MapperForMS;
import com.cl.dto.TestDTO;

@MapperForMS("TestMapper")
public interface TestMapper {
	public List<TestDTO> getTestList() throws Exception;
}
