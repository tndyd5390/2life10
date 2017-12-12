package com.cl.service;

import java.util.HashMap;

import com.cl.dto.CatalogueDTO;

public interface ICatalogueService {

	HashMap<String, Object> getCatalogueList(HashMap<String, Object> hMap) throws Exception;

	int insertCatalogue(CatalogueDTO cDTO) throws Exception;

	CatalogueDTO getCatalogueFile(String catalogueNo) throws Exception;

	CatalogueDTO getCatalogueDetail(String catalogueNo) throws Exception;

	int updateCatalogue(CatalogueDTO cDTO) throws Exception;
	
}
