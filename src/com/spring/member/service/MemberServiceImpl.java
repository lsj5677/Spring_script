package com.spring.member.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.member.dao.MemberMapper;
import com.spring.member.vo.MemberVO;
/*Annotation*/
@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public int insertMem(MemberVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberServiceImpl.insertMem() >>>");
		System.out.println("(log) MemberServiceImpl.insertMem() <<<");
		return memberMapper.insertMem(param);
	}

	@Override
	public MemberVO chaebunMem() {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberServiceImpl.chaebunMem() >>>");
		System.out.println("(log) MemberServiceImpl.chaebunMem() <<<");
		return memberMapper.chaebunMem();
	}
	
	@Override
	public List<MemberVO> listMem(MemberVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberServiceImpl.listMem() >>>");
		
		// list 참조변수 선언 후 instance
		List<MemberVO> list = new ArrayList<MemberVO>();
		// aList에 listMem() 호출해서 담기
		list = memberMapper.listMem(param);
		
		System.out.println("(log) MemberServiceImpl.listMem() <<<");
		return list;
	}

	@Override
	public MemberVO selectMem(String lmem) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberServiceImpl.selectMem() >>>");
		System.out.println("(log) MemberServiceImpl.selectMem() <<<");
		return memberMapper.selectMem(lmem);
	}

	@Override
	public int updateMem(MemberVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberServiceImpl.updateMem() >>>");
		System.out.println("(log) MemberServiceImpl.updateMem() <<<");
		return memberMapper.updateMem(param);
	}

	@Override
	public int deleteMem(String lmem) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberServiceImpl.deleteMem() >>>");
		System.out.println("(log) MemberServiceImpl.deleteMem() <<<");
		return memberMapper.deleteMem(lmem);
	}

	@Override
	public List<MemberVO> loginMem(MemberVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberServiceImpl.loginMem() >>>");
		System.out.println("(log) MemberServiceImpl.loginMem() <<<");
		return memberMapper.loginMem(param);
	}

	@Override
	public List<MemberVO> idCheck(MemberVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberServiceImpl.idCheck() >>>");
		System.out.println("(log) MemberServiceImpl.idCheck() <<<");
		return memberMapper.idCheck(param);
	}



}// end of MemberServiceImpl class
