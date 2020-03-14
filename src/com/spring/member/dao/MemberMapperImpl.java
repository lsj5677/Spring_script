package com.spring.member.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.spring.member.vo.MemberVO;

public class MemberMapperImpl extends SqlSessionDaoSupport implements MemberMapper {

	/*문자상수*/
	private final String PATH = "com.spring.member.dao.MemberMapper.";

	@Override
	public int insertMem(MemberVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberMapperImpl.insertMem() >>>");
		System.out.println("(log) MemberMapperImpl.insertMem() <<<");
		return (int)getSqlSession().insert(PATH+"insertMem");
	}

	@Override
	public MemberVO chaebunMem() {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberMapperImpl.chaebunMem() >>>");
		System.out.println("(log) MemberMapperImpl.chaebunMem() <<<");
		return getSqlSession().selectOne(PATH+"chaebunMem");
	}
	
	
	
	/*조회*/
	@Override
	public List<MemberVO> listMem(MemberVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberMapperImpl.listMem() >>>");
		
		System.out.println("(log) MemberMapperImpl.listMem() <<<");
		return getSqlSession().selectList(PATH + "listMem");
	}

	@Override
	public MemberVO selectMem(String lmem) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberMapperImpl.selectMem() >>>");
		System.out.println("(log) MemberMapperImpl.selectMem() <<<");
		return (MemberVO)getSqlSession().selectOne(PATH+"selectMem");
	}

	@Override
	public int updateMem(MemberVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberMapperImpl.updateMem() >>>");
		System.out.println("(log) MemberMapperImpl.updateMem() <<<");
		return (int)getSqlSession().update(PATH+"updateMem");
	}

	@Override
	public int deleteMem(String lmem) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberMapperImpl.deleteMem() >>>");
		System.out.println("(log) MemberMapperImpl.deleteMem() <<<");
		return (int)getSqlSession().delete(PATH+"deleteMem");
	}

	@Override
	public List<MemberVO> loginMem(MemberVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberMapperImpl.loginMem() >>>");
		System.out.println("(log) MemberMapperImpl.loginMem() <<<");
		return getSqlSession().selectList(PATH+"loginMem");
	}

	@Override
	public List<MemberVO> idCheck(MemberVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) MemberMapperImpl.idCheck() >>>");
		System.out.println("(log) MemberMapperImpl.idCheck() <<<");
		return getSqlSession().selectList(PATH+"idCheck");
	}



}// end of MemberMapperImpl()
