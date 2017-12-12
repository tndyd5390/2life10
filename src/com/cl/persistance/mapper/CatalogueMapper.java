package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.CatalogueDTO;

@Mapper("CatalogueMapper")
public interface CatalogueMapper {

	List<CatalogueDTO> getCatalogueList(HashMap<String, Object> hMap) throws Exception;

	void insertCatalogueFile(CatalogueDTO cDTO) throws Exception;

	int insertCatalogue(CatalogueDTO cDTO) throws Exception;

	CatalogueDTO getCatalogueFile(String catalogueNo) throws Exception;

	CatalogueDTO getCatalogueDetail(String catalogueNo) throws Exception;

	int updateCatalogue(CatalogueDTO cDTO) throws Exception;

}
