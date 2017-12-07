package com.cl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.RegulationDTO;
import com.cl.persistance.mapper.RegulationMapper;
import com.cl.service.IRegulationService;
import com.cl.util.CmmUtil;
import com.cl.util.FileUtil;

@Service("RegulationService")
public class RegulationService implements IRegulationService{
	
	@Resource(name="RegulationMapper")
	private RegulationMapper regulationMapper;

	@Override
	public int insertRegulation(RegulationDTO rDTO) throws Exception {
		//rDTO에 파일이름이 있으면 파일을 저장하는 것이므로 FILE_INFO테이블에 파일 저장 파일 저장싱 selectKey로 primary key를 받아옴
		if(!"".equals(CmmUtil.nvl(rDTO.getRegulationFileName()))) regulationMapper.insertRegulationFile(rDTO);
		//상조관련법듀 등록
		return regulationMapper.insertRegulation(rDTO);
	}

	@Override
	public HashMap<String, Object> getRegulationList(HashMap<String, Object> hMap) throws Exception {
		List<RegulationDTO> rList = new ArrayList<>();
		rList = regulationMapper.getRegulationList(hMap);
		hMap.put("list", rList);
		if(rList.size() != 0) {
			hMap.put("pageList", rList.get(0).getPage());
		}else {
			hMap.put("pageList", 1);
		}
		return hMap;
	}

	@Override
	public RegulationDTO getRegulationDetail(String regulationNo) throws Exception {
		//조회수 증가
		regulationMapper.updateRegulationViewCnt(regulationNo);
		//상조관련법규 불러오기
		return regulationMapper.getRegulationDetail(regulationNo);
	}

	@Override
	public RegulationDTO deleteRegulation(String regulationNo) throws Exception {
		//상조관련법규을 일단 불러옴 이미지가 있을경우 이미지를 삭제하기 위하여
		RegulationDTO rDTO = regulationMapper.getRegulationDetail(regulationNo);
		//상조관련법규 삭제 FILE_INFO, RUGULATION_INFO두개의 테이블에서 delete
		int result = regulationMapper.deleteRegulation(rDTO);
		//상조관련법규가 삭제 되지 않았다면 rDTO에 null을 넣고 반환
		if(result == 0) {
			rDTO = null;
		}
		return rDTO; 
	}

	@Override
	public int updateRegulationImgNull(Map<String, String> map) throws Exception {
		//상조관련법규 번호
		String regulationNo = CmmUtil.nvl(map.get("regulationNo"));
		//상조관련법규의 파일 번호
		String regulationFileNo = CmmUtil.nvl(map.get("regulationFileNo"));
		//결과 변수
		int result = 0;
		//파일을 삭제하기 위해 일단 상조관련법규를 불러온다
		RegulationDTO rDTO = regulationMapper.getRegulationDetail(regulationNo);
		//REGULATION_INFO 테이블에 file_no컬럼을 null로 업데이트
		int update = regulationMapper.updateRegulationImgNull(map);
		//FILE_INFO테이블에서 파일을 delete
		int delete = regulationMapper.deleteRegulationImg(regulationFileNo);
		//file삭제
		FileUtil.deleteFile(rDTO.getRegulationFilePath(), rDTO.getRegulationFileName());
		if(update != 0 && delete != 0) {
			result++;
		}
		rDTO = null;
		return result;
	}

	@Override
	public int updateRegulationImg(Map<String, Object> map) throws Exception {
		//수정하기 전의 파일 번호(삭제해야함)
		String preFileNo = CmmUtil.nvl((String)map.get("deleteFileNo"));
		//수정하기 전의 파일번호 삭제
		regulationMapper.deleteRegulationImg(preFileNo);
		//수정된 상조관련법규 DTO
		RegulationDTO rDTO = (RegulationDTO)map.get("rDTO");
		//수정된 파일을 FILE_INFO에 insert
		regulationMapper.insertRegulationFile(rDTO);
		//상조관련법규 이미지 수정
		return regulationMapper.updateRegulationImg(rDTO);
	}

	@Override
	public int updateRegulation(RegulationDTO rDTO) throws Exception {
		//파일을 새로 등록한다면 FILE_INFO에 file을 insert
		if(!"".equals(CmmUtil.nvl(rDTO.getRegulationFileName()))) {
			regulationMapper.insertRegulationFile(rDTO);
		}
		//상조관련법규 update
		return regulationMapper.updateRegulation(rDTO);
	}
	
}
