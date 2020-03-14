package com.spring.member.controller;
/*Annotation*/

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spring.board.service.BoardService;
import com.spring.common.utils.BabySession;
import com.spring.common.utils.FilePath;
import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	/*path ����*/
	private static final String PATH = "member";
	@Autowired
	private MemberService memberService;
	@Autowired
	private BoardService boardService;
	
	/*insertMem*/
	@RequestMapping("/insertMem")
	public ModelAndView insertMem(@ModelAttribute MemberVO param, HttpServletRequest req){
		System.out.println("(log) MemberController.insertMem >>>");
		String rStr = "";
//		String uploadPath = FilePath.UPLOAD_FILEPATH;

		String uploadPath = FilePath.UPLOAD_FILEPATH;
		int size = 100*1024*1024;
	
		
		try{
			//������ object Request �Լ�
			MultipartRequest mt = new MultipartRequest(req,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());
			System.out.println("(log) MemberController.loginMem try >>>");
			
			String lmem = mt.getParameter("lmem");
			String lid = mt.getParameter("lid");
			String lpw = mt.getParameter("lpw");
			String lname = mt.getParameter("lname");
			String lgender = mt.getParameter("lgender");
			String lbirth = mt.getParameter("lbirth");
			String lemail = mt.getParameter("lemail");
			String lhp = mt.getParameter("lhp");
			String lpostno = mt.getParameter("lpostno");
			String ljuso = mt.getParameter("ljuso") + " "+ mt.getParameter("ljuso1");
			String limage = mt.getParameter("limage");	
			
			Enumeration lfiles = mt.getFileNames();
			limage = (String)lfiles.nextElement();
			String lfilename = mt.getFilesystemName(limage);
			
	
			System.out.println("(log) lmem >>> " + lmem); 
			System.out.println("(log) lid >>> " + lid);
			System.out.println("(log) lpw >>> " + lpw);
			System.out.println("(log) lname >>> " + lname);
			System.out.println("(log) lgender >>> " + lgender);
			System.out.println("(log) lbirth >>> " + lbirth);
			System.out.println("(log) lemail >>> " + lemail);
			System.out.println("(log) lhp >>> " + lhp);
			System.out.println("(log) lpostno >>> " + lpostno);
			System.out.println("(log) ljuso >>> " + ljuso);
			System.out.println("(log) limage >>> " + limage);
			System.out.println("(log) lfilename >>> " + lfilename);
			
			// set�ʱ�ȭ  get ����
			param.setLmem(lmem);
			param.setLid(lid);
			param.setLpw(lpw);
			param.setLname(lname);
			param.setLgender(lgender);
			param.setLbirth(lbirth);
			param.setLemail(lemail);
			param.setLhp(lhp);
			param.setLpostno(lpostno);
			param.setLjuso(ljuso);
			param.setLimage(lfilename);
			
		}catch(Exception e){
			System.out.println("MemberController.insertMem Error >>> : " +e +"<br>");
		}
		
		// chaebun 
		// List�� ä�� ����ֱ�
		MemberVO lvo = memberService.chaebunMem();
		System.out.println("(log) lvo >>> " + lvo);
		ModelAndView mav = new ModelAndView();
		String num = lvo.getLmem();
		
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
		num = "M" + num;
		System.out.println("(log) num >>> " + num);
	
		// set���� �ʱ�ȭ get���� ����
		param.setLmem(num);
		
		
		int result = memberService.insertMem(param);
	
		if(result>0){
			rStr = "��ϵǾ����ϴ�.";
			
			List<MemberVO> list = memberService.listMem(param);
			
			/*mav�� ������Ʈ ����ֱ�*/
			mav.addObject("listMem",list);
			/*addObject = setAttribute jsp���� getAttribute�� ���� �� ����*/
			mav.setViewName(PATH+"/member_list");
			
		}else{
			rStr= "��Ͽ� ������ �־� �Ϸ����� ���߽��ϴ�.";
			mav.setViewName(PATH+"/member");
		}
		// service -->>>>>>
		mav.addObject("result", rStr);
		System.out.println("(log) MemberController.insertMem <<<");
		
		return mav;
	}
	
	/*listMem*/
	@RequestMapping("/listMem")
	public ModelAndView listMem(@ModelAttribute MemberVO param){
		System.out.println("(log) MemberController.listMem() >>>");
		/*list�� memberService.listMem ȣ�� �� ����ֱ�*/
		List<MemberVO> list = memberService.listMem(param);
		/*ModelAndView mav�� ���� ���� �� instance*/
		ModelAndView mav = new ModelAndView();
		
		/*mav�� ������Ʈ ����ֱ�*/
		mav.addObject("listMem",list);
		/*addObject = setAttribute jsp���� getAttribute�� ���� �� ����*/
		mav.addObject("paramName",param.getLname());
		mav.setViewName(PATH+"/member_list");
		System.out.println("(log) MemberController.listMem() <<<");
		return mav;
	}		
	
	/*selectMem*/
	@RequestMapping("/selectMem")
	public ModelAndView selectMem(@RequestParam(value="lmem",required=false) String lmem){
		System.out.println("(log) MemberController.selectMem() >>>");
		
		// ModelAndView ���� ���� �� instance
		ModelAndView mav = new ModelAndView();
		System.out.println("	lmem >>> " + lmem);
		if(lmem==null || lmem==""){
			mav.addObject("mode","insert");
			mav.setViewName(PATH+"/member");
		}else{
			mav.addObject("memberVO",memberService.selectMem(lmem));
			System.out.println("	lmem >>> " + lmem);
			mav.addObject("mode","update");
			mav.setViewName(PATH+"/member_update");
		}
		
		System.out.println("(log) MemberController.selectMem() <<<");
		return mav;
	}
	
	/*updateMem*/
	@RequestMapping("/updateMem")
	public ModelAndView updateMem(@ModelAttribute MemberVO param){
		System.out.println("(log) MemberController.updateMem() >>>");
		
		String rStr="";
		int result = memberService.updateMem(param);
		System.out.println("	result >>> " + result);
		
		ModelAndView mav = new ModelAndView();
		
		if(result>0){
			rStr = "�����Ǿ����ϴ�.";
			List<MemberVO> list = memberService.listMem(param);
			
			/*mav�� ������Ʈ ����ֱ� (key,value)*/
			mav.addObject("listMem",list);
			/*addObject = setAttribute jsp���� getAttribute�� ���� �� ����*/
			mav.setViewName(PATH+"/member_list");
			
		}else {
			rStr = "����";
			mav.setViewName("./index");
			
		}
		System.out.println("(log) MemberController.updateMem() <<<");
		return mav;
	}
	
	/*deleteMem*/
	@RequestMapping("/deleteMem")
	public ModelAndView deleteMem(@RequestParam("lmem") String lmem){
		System.out.println("(log) MemberController.deleteMem() >>>");
		
		String rStr = "";
		int result = memberService.deleteMem(lmem);
		System.out.println("	lmem >>> " + lmem);
		System.out.println("	result >>> " + result);
		
		if(result>0){
			rStr = "�����Ǿ����ϴ�.";
		}else{
			rStr= "������ �־� �Ϸ����� ���߽��ϴ�.";
		}
		
		ModelAndView mav = new ModelAndView();
		MemberVO param = null;
		List<MemberVO> list = memberService.listMem(param);
		
		mav.addObject("listMem",list);
		mav.setViewName(PATH+"/member_list");
		
		System.out.println("(log) MemberController.deleteMem() <<<");
		
		return mav;
	}
	
	/*loginMem*/
	@RequestMapping("/loginMem")
	public ModelAndView loginMem(@ModelAttribute MemberVO param, HttpServletRequest req){
		System.out.println("(log) MemberController.loginMem() >>>");
		/*ModelAndView mav�� ���� ���� �� instance*/
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		List<MemberVO> loginList = memberService.loginMem(param);
		System.out.println("(log) loginList.size() >>> " + loginList.size());
		
		if(loginList.size()==1){
			System.out.println("�α��� ���� ");
			
			try{
				BabySession.setSession(req, param.getLid());
			}catch(Exception e){
				System.out.println("	Error >>> " + e.getMessage());
			}
			
			List<MemberVO> list = memberService.listMem(param);
			mav.addObject("listMem",list);
			mav.setViewName("member/member_list");
		}else{
			System.out.println("�α��� ����");
			mav.setViewName(PATH+"/member");
		}
		
		System.out.println("(log) MemberController.loginMem() >>>");
		return mav;
	}
	
	/*logout*/
	@RequestMapping("/logoutMem")
	public String logoutMem(HttpServletRequest req){
		System.out.println("(log) MemberController.logoutMem() >>>");
		
		try{
			BabySession.killSession(req);
		}catch(Exception e){
			System.out.println("	Error >>> " + e.getMessage());
		}
		
		System.out.println("(log) MemberController.logoutMem() <<<");
		return "redirect:/";
	}
	
	/*idCheck*/
	@RequestMapping("/idCheck")
	@ResponseBody
	public String idCheck(@ModelAttribute MemberVO param){
		System.out.println("(log) MemberController.idCheck() >>>");
	
		List<MemberVO> result = memberService.idCheck(param);

		System.out.println("(log) MemberController.idCheck() >>>");		
		System.out.println("(log) result.size() >>>" + result.size());	
		if(result.size()==0){
			return "true";
		}else{
			return "false";
		}
	}
	
}// end of MemberController
