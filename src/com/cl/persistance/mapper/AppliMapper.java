package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.AppliDTO;

@Mapper("AppliMapper")
public interface AppliMapper {
	public int insertAppli(AppliDTO aDTO) throws Exception;
	public List<AppliDTO> getAppliList(HashMap<String, Object> hMap) throws Exception;
	public AppliDTO getAppliDetail(String appliNo) throws Exception;
	public int updateAppliReply(String appliNo) throws Exception;
	public int deleteAppli(String appliNo) throws Exception;
}
