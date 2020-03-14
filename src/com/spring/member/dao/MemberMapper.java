package com.spring.member.dao;


import java.util.List;

import com.spring.member.vo.MemberVO;

public interface MemberMapper {
	public int insertMem(MemberVO param);
	public MemberVO chaebunMem();
	public List<MemberVO> listMem(MemberVO param);
	public MemberVO selectMem(String lmem);
	public int updateMem(MemberVO param);
	public int deleteMem(String lmem);
	public List<MemberVO> loginMem(MemberVO param);
	public List<MemberVO> idCheck(MemberVO param);
}// end of MemberMapper interface
