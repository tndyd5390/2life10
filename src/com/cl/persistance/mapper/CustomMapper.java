package com.cl.persistance.mapper;

import java.util.Map;

import com.cl.config.Mapper;

@Mapper("CustomMapper")
public interface CustomMapper {
	public int deleteCustomAll() throws Exception;
	public int insertCustoms(Map<String, Object> map) throws Exception;
}
