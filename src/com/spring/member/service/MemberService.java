package com.spring.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.member.vo.MemberVO;

public interface MemberService {
	public int insertMem(MemberVO param);
	public MemberVO chaebunMem();
	public List<MemberVO> listMem(MemberVO param);
	public MemberVO selectMem(String lmem);
	public int updateMem(MemberVO param);
	public int deleteMem(String lmem);
	public List<MemberVO> loginMem(MemberVO param);
	public List<MemberVO> idCheck(MemberVO param);
}// end of MemberService interface
