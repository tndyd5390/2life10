package com.cl.persistance.mapper;

import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.CodeDTO;

@Mapper("CodeMapper")
public interface CodeMapper {

	List<CodeDTO> getFuneralList() throws Exception;

	List<CodeDTO> getGeoList() throws Exception;

	List<CodeDTO> getTelList() throws Exception;

}
