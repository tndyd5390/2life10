package com.cl.persistance.mapper;

import java.util.HashMap;
import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.MemberDTO;

@Mapper("MemberMapper")
public interface MemberMapper {

	int getIdCheck(MemberDTO mDTO) throws Exception;

	int insertMember(MemberDTO mDTO) throws Exception;

	MemberDTO getMemberLogin(MemberDTO mDTO) throws Exception;

	List<MemberDTO> getMemberList(HashMap<String, Object> hMap);

	MemberDTO getMemberDetail(MemberDTO mDTO);

	int updateMember(MemberDTO mDTO);
	
	int deleteMember(String memberNo);

}
