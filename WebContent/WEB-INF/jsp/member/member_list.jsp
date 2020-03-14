<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import ="com.spring.member.dao.MemberMapper" %>
<%@ page import ="com.spring.member.dao.MemberMapperImpl" %> 
<%@ page import ="com.spring.member.vo.MemberVO" %> 
<%@ page import = "java.util.ArrayList"%>
<%@ page import ="java.util.List" %>


<% request.setCharacterEncoding("EUC-KR"); %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>aLLMembers</title>
		<style>
			.table {border:1px solid #ccc; border-collapse:collapse; text-align:center; margin:0 auto;}
			.table tr .table_title {font-size:20px; background-color:#eee;}
			.table tr td {padding: 10px;}
			.table tr .info_button {text-align:center;}
			.table tr .info_button .btn{ border:none; background-color:#ddd; padding: 8px; width: 90px; box-sizing: border-box; cursor:pointer;}
			.table tr .info_button .btn:hover {background-color:#222; color:#fff; transition: all .3s ease;}
			.table tr .info_button .btn#retry {background-color:#cf0000; color:#fff;}
		</style>
		<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.11.0.min.js"></script> 
		
		<script>
			$(function(){
				$("#listData").click(function(){
					alert("listData >>>>> ");
					$("#memberList").attr("action","/member/listMem.lsj").submit();
				});	
				
				$("#updateData").click(function(){
					alert("updateData >>>>> ");
					if(confirm('수정을 진행할까요?')){
						$("#memberList").attr("action","/member/selectMem.lsj");
						$("#memberList").submit();
					}
				});	
				
				$("#deleteData").click(function(){
					alert("deleteData >>>>> ");
					$("#memberList").attr("action","/member/deleteMem.lsj").submit();
				});	
				
				$("#listBtn").click(function(){
					alert("listBtn >>>>> ");
					$("#memberList").attr("action","/board/listBoard.lsj").submit();
				});
				
				$("#logoutBtn").click(function(){
					alert("logoutBtn >>>>> ");
					$("#memberList").attr("action","/member/logout.lsj").submit();
				});	
			});
		</script>
	</head>
	<body>
		<form name="memberList" id="memberList" method ="POST">
		<% 

		Object obj = request.getAttribute("listMem"); 
		System.out.println("obj >>> : " +obj);
				
		if (obj != null){
			List<MemberVO> list = (ArrayList<MemberVO>) obj;
			if (list.size() == 0){
	
			%>	
			<table border="1" class="table">
				<tr>
					<td>NO DATA</td>
				</tr>
			</table>			
			<% 		
	 		}else{
			%>
			<table border="1" class="table">
				<tr>
					<td colspan="16" align="center"><h3>회원정보  </h3></td>
				</tr>	
				<tr>
					<td class="info_title"><input type="checkbox" name="chkAll" id="chkAll"></td>
				 	<td class="info_title">회원번호</td>
					<td class="info_title">아이디</td>
					<td class="info_title">비밀번호</td>
					<td class="info_title">이름</td>
					<td class="info_title">성별</td>
					<td class="info_title">생년월일</td>
					<td class="info_title">이메일</td>
					<td class="info_title">핸드폰</td>
					<td class="info_title">우편번호</td>
					<td class="info_title">주소</td>
					<td class="info_title">회원사진</td>
				</tr>
			 		
		<% 		for(int i =0; i<list.size(); i++){  
					MemberVO lvo = list.get(i);
					/* System.out.println("사진경로>>> : "+ "../upload/"+ lvo.getLimage()); */
		%>
				<tr>
				    <td class="info_con"><input type="checkbox" name="lmem" id="lmem"  
												value=<%= lvo.getLmem() %>  onclick="checkOnly(this)"></td>
				<td class="info_con"><%=lvo.getLmem() %></td>
				<td class="info_con"><%=lvo.getLid() %></td>
				<td class="info_con"><%=lvo.getLpw() %></td>
				<td class="info_con"><%=lvo.getLname() %></td>
				<td class="info_con"><%=lvo.getLgender() %></td>
				<td class="info_con"><%=lvo.getLbirth() %></td>
				<td class="info_con"><%=lvo.getLemail() %></td>
				<td class="info_con"><%=lvo.getLhp() %></td>
				<td class="info_con"><%=lvo.getLpostno() %></td>
				<td class="info_con"><%=lvo.getLjuso() %></td>
				<td><img src = "./upload/<%=lvo.getLimage()%>" border=0 width="150" height="100"></td>
				</tr>
				
		<%			} //for끝
				} //aList.size if 끝
			}//object if 끝
			%>
			<!-- tr -->
				<tr>
					<td colspan="16" class="info_button">
						<input type="button" value="수정" id="updateData" name="updateData" class="btn">
						<input type="button" value="삭제" id="deleteData" name="deleteData" class="btn">
						<input type="button" value="회원목록" id="listData" name="listData" class="btn">
						<input type="button" value="게시판목록" id="listBtn" name="listBtn" class="btn">
						<input type="button" value="로그아웃" id="logoutBtn" name="logoutBtn" class="btn" style="background-color:#cf0000;">
					</td>
				</tr>
				<!-- //tr -->
			</table>	
		</form>
	
		
	</body>
</html>