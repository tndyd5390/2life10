package com.cl.service;

import java.util.HashMap;

import com.cl.dto.MemberDTO;

public interface IMemberService {

	int getIdCheck(MemberDTO mDTO) throws Exception;

	int insertMember(MemberDTO mDTO) throws Exception;

	MemberDTO getMemberLogin(MemberDTO mDTO) throws Exception;

	HashMap<String, Object> getMemberList(HashMap<String, Object> hMap) throws Exception;

	MemberDTO getMemberDetail(MemberDTO mDTO) throws Exception;

	int deleteMember(String memberNo) throws Exception;
	
}
