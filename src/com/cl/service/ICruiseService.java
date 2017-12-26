package com.cl.service;

import java.util.HashMap;
import java.util.Map;

import com.cl.dto.CruiseDTO;

public interface ICruiseService {
	public int insertCruise(CruiseDTO cDTO) throws Exception;
	HashMap<String, Object> getCruiseList(HashMap<String, Object> hMap) throws Exception;
	public Map<String, String> deleteCruise(CruiseDTO cDTO) throws Exception;
	public CruiseDTO getCruise(String cruiseNo) throws Exception;
	public boolean updateCruise(CruiseDTO cDTO) throws Exception;
	public boolean orderByCruise(String[] cruiseList) throws Exception;
}