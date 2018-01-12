package com.cl.persistance.mapperForMS;

import java.util.List;
import java.util.Map;

import com.cl.config.MapperForMS;
import com.cl.dto.MsCustomDTO;

@MapperForMS("MsCustomMapper")
public interface MsCustomMapper {

	List<MsCustomDTO> getMemberYN(MsCustomDTO msDTO) throws Exception;
	List<MsCustomDTO> getMemberBetweenAnd(Map<String, Object> map) throws Exception;
	String getMemberSize() throws Exception;
}
