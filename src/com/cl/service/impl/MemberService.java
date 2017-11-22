package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.persistance.mapper.MemberMapper;
import com.cl.service.IMemberService;

@Service("MemberService")
public class MemberService implements IMemberService{
	
	@Resource(name="MemberMapper")
	private MemberMapper memberMapper;
	
}
