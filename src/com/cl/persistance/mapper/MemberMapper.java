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

	MemberDTO getMemberDetail(MemberDTO mDTO) throws Exception;

	int updateMember(MemberDTO mDTO) throws Exception;
	
	int deleteMember(String memberNo) throws Exception;

	MemberDTO getMemberId(MemberDTO mDTO) throws Exception;

	int updateTmpPass(MemberDTO mDTO) throws Exception;

	int updateMemberPassword(MemberDTO mDTO) throws Exception;

	List<MemberDTO> getnSignMemberList(HashMap<String, Object> hMap) throws Exception;

}
