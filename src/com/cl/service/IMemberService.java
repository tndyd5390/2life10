package com.cl.service;

import com.cl.dto.MemberDTO;

public interface IMemberService {

	int getIdCheck(MemberDTO mDTO) throws Exception;

	int insertMember(MemberDTO mDTO) throws Exception;

	MemberDTO getMemberLogin(MemberDTO mDTO) throws Exception;
	
}
