package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.BoardVO;

public interface BoardMapper {
	public int insertBoard(BoardVO param);
	public BoardVO chaebunBoard();
	public List<BoardVO> listBoard(BoardVO param);
	public BoardVO selectBoard(String lno);
	public int updateBoard(BoardVO param);
	public int deleteBoard(String lno);
}// end of BoardMapper interface
