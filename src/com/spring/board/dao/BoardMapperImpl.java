package com.spring.board.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.spring.board.vo.BoardVO;

public class BoardMapperImpl extends SqlSessionDaoSupport implements BoardMapper {

	private final String PATH_BOARD = "com.spring.board.dao.BoardService.";
	@Override
	public int insertBoard(BoardVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) BoardMapperImpl.insertBoard >>>");
		System.out.println("(log) BoardMapperImpl.insertBoard <<<");
		return (int)getSqlSession().insert(PATH_BOARD+"insertBoard");
	}

	@Override
	public BoardVO chaebunBoard() {
		// TODO Auto-generated method stub
		System.out.println("(log) BoardMapperImpl.chaebunBoard >>>");
		System.out.println("(log) BoardMapperImpl.chaebunBoard <<<");
		return getSqlSession().selectOne(PATH_BOARD+"chaebunBoard");
	}

	@Override
	public List<BoardVO> listBoard(BoardVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) BoardMapperImpl.listBoard >>>");
		System.out.println("(log) BoardMapperImpl.listBoard <<<");
		return getSqlSession().selectList(PATH_BOARD+"listBoard");
	}
	
	@Override
	public BoardVO selectBoard(String lno) {
		// TODO Auto-generated method stub
		System.out.println("(log) BoardMapperImpl.selectBoard >>>");
		System.out.println("(log) BoardMapperImpl.selectBoard <<<");
		return (BoardVO)getSqlSession().selectOne(PATH_BOARD+"selectBoard");
	}

	@Override
	public int updateBoard(BoardVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) BoardMapperImpl.updateBoard >>>");
		System.out.println("(log) BoardMapperImpl.updateBoard <<<");
		return getSqlSession().update(PATH_BOARD+"updateBoard");
	}

	@Override
	public int deleteBoard(String lno) {
		// TODO Auto-generated method stub
		System.out.println("(log) BoardMapperImpl.deleteBoard >>>");
		System.out.println("(log) BoardMapperImpl.deleteBoard <<<");
		return (int)getSqlSession().delete(PATH_BOARD+"deleteBoard");
	}

}
