package com.cl.persistance.mapper;

import com.cl.config.Mapper;
import com.cl.dto.MemberDTO;

@Mapper("MemberMapper")
public interface MemberMapper {

	int getIdCheck(MemberDTO mDTO) throws Exception;

	int insertMember(MemberDTO mDTO) throws Exception;

	MemberDTO getMemberLogin(MemberDTO mDTO) throws Exception;

}
