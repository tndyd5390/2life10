package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cl.config.Mapper;
import com.cl.dto.RegulationDTO;

@Mapper("RegulationMapper")
public interface RegulationMapper {
	//상조관련법규 이미지 등록시 FILE_INFO테이블에 insert할 mapper
	public int insertRegulationFile(RegulationDTO rDTO) throws Exception;
	//상조관련법규 insert mapper
	public int insertRegulation(RegulationDTO rDTO) throws Exception;
	//상조관련법규 리스트 select
	public List<RegulationDTO> getRegulationList(HashMap<String, Object> hMap) throws Exception;
	//상조관련법규 상세 select
	public RegulationDTO getRegulationDetail(String regulationNo) throws Exception;
	//상조관련법수 삭제 delete
	public int deleteRegulation(RegulationDTO rDTO) throws Exception;
	//상조관련법규 이미지 삭제  REGULATION_INFO에  update
	public int updateRegulationImgNull(Map<String, String> map) throws Exception;
	//상조관련법규 이미지 삭제 FILE_INFO에 delete
	public int deleteRegulationImg(String regulationFileNo) throws Exception;
	//상조관련법규 이미지 수정 update
	public int updateRegulationImg(RegulationDTO rDTO) throws Exception;
	//상조관련법규 수정 update
	public int updateRegulation(RegulationDTO rDTO) throws Exception;
	//상조관련법규 조회수증가 update
	public int updateRegulationViewCnt(String regulationNo) throws Exception;
}
