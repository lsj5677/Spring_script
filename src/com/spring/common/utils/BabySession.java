package com.spring.common.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class BabySession {
		/*
		 * ���� ���̵� ������ ������ �����̸��� ���� 
		 * 
		 * */
		
		private static final String lID = "lid";
		
		/*
		 * Kill Session, ���ǿ� ��� ������ ��� �����.
		 * 
		 * @param	hReq	servlet request
		 * @return 	servlet request�� null�̸� false�� �����ϰ�, 
		 * 			�ƴϸ� ���ǿ� ��� ������ ��� ����� true�� ����.
		 * @exception Exception.
		 * */
		
		public static boolean killSession(final HttpServletRequest req) throws Exception {
			
			if(req == null) return false;
			
			try{
				HttpSession session = req.getSession(true);
				session.invalidate();
			}catch(Exception e){
				
				throw e;
			}
			return true;
		}
		/*
		 * ���� ������ ������ ���ǿ��� �����´�.
		 * 
		 * @param hReq 	servlet request.
		 * @return servlet request �� null �̸� �� ���ڿ�("")�� �����ϰ�, 
		 * @exception Exception
		 * 
		 * */
		
		public static boolean setSession(final HttpServletRequest req, final String lid) throws Exception{
			
			if(req == null) return false;
			if(lid == null || lid.trim().length() == 0) return false;
			
			HttpSession session = req.getSession(true);
			
			try{
				session.setAttribute(lID, lid);
			}catch(Exception e){
				throw e;
			}
			return true;
		}
		
		/*
		* �������̵� ������ ���ǿ��� �����´�.
		* 
		* @param     hReq       servlet request.
		* @return    servlet request�� null�̸� �� ���ڿ�("")�� �����ϰ�, 
		*            �ƴϸ� ������ ������ �ִ� �������̵� ����.
		* @exception Exception.
		*/
		public static String getSession(final HttpServletRequest hReq) throws Exception {
			
			if(hReq == null) return "";
			String strSession;
			
			HttpSession hSession = hReq.getSession(false);
			
			try{
				strSession = (String)hSession.getAttribute(lID);
			}catch(Exception e){
				throw e;
			}
			return strSession;
		}
}
