package com.cl.persistance.mapper;

import java.util.Map;

import com.cl.config.Mapper;

@Mapper("AccMapper")
public interface AccMapper {
	public int insertAccs(Map<String, Object> map) throws Exception;
}
