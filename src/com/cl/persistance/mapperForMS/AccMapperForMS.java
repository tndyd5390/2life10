package com.cl.persistance.mapperForMS;

import java.util.List;
import java.util.Map;

import com.cl.config.MapperForMS;
import com.cl.dto.AccDTO;

@MapperForMS("AccMapperForMS")
public interface AccMapperForMS {
	public List<AccDTO> getAccBeforeToday() throws Exception;
	public List<AccDTO> getAccBetweenAnd(Map<String, Object> map) throws Exception;
	public String getAccSize() throws Exception;
}
