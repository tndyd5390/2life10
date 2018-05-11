package com.cl.service;

import java.util.HashMap;
import java.util.List;

import com.cl.dto.AppliDTO;

public interface IAppliService {
	public int insertAppli(AppliDTO aDTO) throws Exception;
	public HashMap<String, Object> getAppliList(HashMap<String, Object> hMap) throws Exception;
	public AppliDTO getAppliDetail(String appliNo) throws Exception;
	public int updateAppliReply(String appliNo) throws Exception;
	public int deleteAppli(String appliNo) throws Exception;
}
