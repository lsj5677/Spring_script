package com.spring.board.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVO;
import com.spring.common.utils.FilePath;
@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	private static final String PATH_BOARD = "board";
	
	@Autowired
	private BoardService boardService;
	
	/*insertBoard*/
	@RequestMapping("/insertBoard")
	public ModelAndView insertBoard(@ModelAttribute BoardVO param, HttpServletRequest req){
		System.out.println("(log) BoardController.insertBoard >>>");
		String rStr = "";
//		String uploadPath = FilePath.UPLOAD_FILEPATH;

		String uploadPath = FilePath.UPLOAD_FILEPATH;
		int size = 100*1024*1024;
	
		
		try{
			//������ object Request �Լ�
			MultipartRequest mt = new MultipartRequest(req,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());
			System.out.println("(log) BoardController.insertBoard try >>>");
			
			String chkInLno = mt.getParameter("chkInLno");
			String lno = mt.getParameter("lno");
			String lsubject = mt.getParameter("lsubject");
			String lname = mt.getParameter("lname");
			String lpw = mt.getParameter("lpw");
			String lmemo = mt.getParameter("lmemo");
			String limage = mt.getParameter("limage");
			
			Enumeration lfiles = mt.getFileNames();
			limage = (String)lfiles.nextElement();
			String lfilename = mt.getFilesystemName(limage);
			
	
			System.out.println("(log) chkInLno >>> " + chkInLno); 
			System.out.println("(log) lno >>> " + lno);
			System.out.println("(log) lsubject >>> " + lsubject);
			System.out.println("(log) lname >>> " + lname);
			System.out.println("(log) lpw >>> " + lpw);
			System.out.println("(log) lmemo >>> " + lmemo);
			System.out.println("(log) limage >>> " + limage);
			System.out.println("(log) lfilename >>> " + lfilename);
			
			// set�ʱ�ȭ  get ����
			param.setLno(lno);
			param.setLsubject(lsubject);
			param.setLname(lname);
			param.setLpw(lpw);
			param.setLmemo(lmemo);
			param.setLimage(lfilename);
			
		}catch(Exception e){
			System.out.println("BoardController.insertBoard Error >>> : " +e +"<br>");
		}
		
		// chaebun 
		// List�� ä�� ����ֱ�
		BoardVO bvo = boardService.chaebunBoard();
		System.out.println("(log) bvo >>> " + bvo);
		ModelAndView mav = new ModelAndView();
		String num = bvo.getLno();
		
		// ���� �ڸ����� �� �� �϶� 000 + ����
		if (1 == num.length()) {
			num = "000" + num;
		}
		// ���� �ڸ����� �� �� �϶� 00 + ����
		if (2 == num.length()) {
			num = "00" + num;
		}
		// ���� �ڸ����� �� �� �϶� 0 + ����
		if (3 == num.length()) {
			num = "0" + num;
		}
		num = "B" + num;
		System.out.println("(log) num >>> " + num);
	
		// set���� �ʱ�ȭ get���� ����
		param.setLno(num);
		
		
		int result = boardService.insertBoard(param);
	
		if(result>0){
			rStr = "��ϵǾ����ϴ�.";
			
			List<BoardVO> list = boardService.listBoard(param);
			
			/*mav�� ������Ʈ ����ֱ�*/
			mav.addObject("listBoard",list);
			/*addObject = setAttribute jsp���� getAttribute�� ���� �� ����*/
			mav.setViewName(PATH_BOARD+"/board_list");
			
		}else{
			rStr= "��Ͽ� ������ �־� �Ϸ����� ���߽��ϴ�.";
			mav.setViewName(PATH_BOARD+"/board");
		}
		// service -->>>>>>
		mav.addObject("result", rStr);
		System.out.println("(log) BoardController.insertBoard <<<");
		
		return mav;
	}
	
	/*listBoard*/
	@RequestMapping("/listBoard")
	public ModelAndView listBoard(@ModelAttribute BoardVO param){
		System.out.println("(log) BoardController.listBoard() >>>");
		/*list�� boardService.listBoard ȣ�� �� ����ֱ�*/
		List<BoardVO> list = boardService.listBoard(param);
		/*ModelAndView mav�� ���� ���� �� instance*/
		ModelAndView mav = new ModelAndView();
		
		/*mav�� ������Ʈ ����ֱ�*/
		mav.addObject("listBoard",list);
		/*addObject = setAttribute jsp���� getAttribute�� ���� �� ����*/
		mav.addObject("paramName",param.getLname());
		mav.setViewName(PATH_BOARD+"/board_list");
		System.out.println("(log) BoardController.listBoard() <<<");
		return mav;
	}		
	
	/*selectBoard*/
	@RequestMapping("/selectBoard")
	public ModelAndView selectBoard(@RequestParam(value = "lno", required = false) String lno) {
		System.out.println("(log) BoardController.selectBoard() >>>");
		// ModelAndView ���� ���� �� instance
		ModelAndView mav = new ModelAndView();
		System.out.println("	lno >>> " + lno);
		if (lno == null || lno == "") {
			mav.addObject("mode", "insert");
			mav.setViewName(PATH_BOARD + "/board");
		} else {
			mav.addObject("boardVO", boardService.selectBoard(lno));
			System.out.println("	lno >>> " + lno);
			mav.addObject("mode", "update");
			mav.setViewName(PATH_BOARD + "/board_update");
		}

		System.out.println("(log) BoardController.selectBoard() <<<");
		return mav;
	}

	/*updateBoard*/
	@RequestMapping("/updateBoard")
	public ModelAndView updateBoard(@ModelAttribute BoardVO param){
		System.out.println("(log) BoardController.updateBoard() >>>");
		
		String rStr="";
		int result = boardService.updateBoard(param);
		System.out.println("	result >>> " + result);
		
		ModelAndView mav = new ModelAndView();
		
		if(result>0){
			rStr = "�����Ǿ����ϴ�.";
			List<BoardVO> list = boardService.listBoard(param);
			
			/*mav�� ������Ʈ ����ֱ� (key,value)*/
			mav.addObject("listBoard",list);
			/*addObject = setAttribute jsp���� getAttribute�� ���� �� ����*/
			mav.setViewName(PATH_BOARD+"/board_list");
			
		}else {
			rStr = "����";
			mav.setViewName("./index");
			
		}
		System.out.println("(log) BoardController.updateBoard() <<<");
		return mav;
	}
	
	/*deleteBoard*/
	@RequestMapping("/deleteBoard")
	public ModelAndView deleteBoard(@RequestParam("lno") String lno){
		System.out.println("(log) BoardController.deleteBoard() >>>");
		
		String rStr = "";
		int result = boardService.deleteBoard(lno);
		System.out.println("	lno >>> " + lno);
		System.out.println("	result >>> " + result);
		
		if(result>0){
			rStr = "�����Ǿ����ϴ�.";
		}else{
			rStr= "������ �־� �Ϸ����� ���߽��ϴ�.";
		}
		
		ModelAndView mav = new ModelAndView();
		BoardVO param = null;
		List<BoardVO> list = boardService.listBoard(param);
		
		mav.addObject("listBoard",list);
		mav.setViewName(PATH_BOARD+"/board_list");
		
		System.out.println("(log) BoardController.deleteBoard() <<<");
		
		return mav;
	}

}// end of BoardController
