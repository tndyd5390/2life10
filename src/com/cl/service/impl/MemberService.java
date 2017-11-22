package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.MemberDTO;
import com.cl.persistance.mapper.MemberMapper;
import com.cl.service.IMemberService;

@Service("MemberService")
public class MemberService implements IMemberService{
	
	@Resource(name="MemberMapper")
	private MemberMapper memberMapper;

	@Override
	public int getIdCheck(MemberDTO mDTO) throws Exception {
		return memberMapper.getIdCheck(mDTO);
	}

	@Override
	public int insertMember(MemberDTO mDTO) throws Exception {
		return memberMapper.insertMember(mDTO);
	}

	@Override
	public MemberDTO getMemberLogin(MemberDTO mDTO) throws Exception {
		return memberMapper.getMemberLogin(mDTO);
	}
	
}
