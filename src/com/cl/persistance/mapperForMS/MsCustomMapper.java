package com.cl.persistance.mapperForMS;

import java.util.List;

import com.cl.config.MapperForMS;
import com.cl.dto.MsCustomDTO;

@MapperForMS("MsCustomMapper")
public interface MsCustomMapper {

	List<MsCustomDTO> getMemberYN(MsCustomDTO msDTO) throws Exception;
	
}
