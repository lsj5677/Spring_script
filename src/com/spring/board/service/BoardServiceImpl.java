package com.spring.board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.dao.BoardMapper;
import com.spring.board.vo.BoardVO;
/*Annotation*/
@Service
@Transactional
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public int insertBoard(BoardVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) BoardServiceImpl.insertBoard >>>");
		System.out.println("(log) BoardServiceImpl.insertBoard <<<");
		return boardMapper.insertBoard(param);
	}

	@Override
	public BoardVO chaebunBoard() {
		// TODO Auto-generated method stub
		System.out.println("(log) BoardServiceImpl.chaebunBoard >>>");
		System.out.println("(log) BoardServiceImpl.chaebunBoard <<<");
		return boardMapper.chaebunBoard();
	}

	@Override
	public List<BoardVO> listBoard(BoardVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) BoardServiceImpl.listBoard >>>");
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		list = boardMapper.listBoard(param);
		
		System.out.println("(log) BoardServiceImpl.listBoard <<<");
		return list;
	}

	@Override
	public BoardVO selectBoard(String lno) {
		// TODO Auto-generated method stub
		System.out.println("(log) BoardServiceImpl.selectBoard >>>");
		System.out.println("(log) BoardServiceImpl.selectBoard <<<");
		return boardMapper.selectBoard(lno);
	}

	@Override
	public int updateBoard(BoardVO param) {
		// TODO Auto-generated method stub
		System.out.println("(log) BoardServiceImpl.updateBoard >>>");
		System.out.println("(log) BoardServiceImpl.updateBoard <<<");
		return boardMapper.updateBoard(param);
	}

	@Override
	public int deleteBoard(String lno) {
		// TODO Auto-generated method stub
		System.out.println("(log) BoardServiceImpl.deleteBoard >>>");
		System.out.println("(log) BoardServiceImpl.deleteBoard <<<");
		return boardMapper.deleteBoard(lno);
	}

}
