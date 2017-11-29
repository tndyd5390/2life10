package com.cl.persistance.mapper;

import com.cl.config.Mapper;
import com.cl.dto.CruiseDTO;

@Mapper("CruiseMapper")
public interface CruiseMapper {
	public int insertCruiseImg(CruiseDTO cDTO) throws Exception;
	public int insertCruiseScheFile(CruiseDTO cDTO) throws Exception;
	public int insertCruise(CruiseDTO cDTO) throws Exception;
}
