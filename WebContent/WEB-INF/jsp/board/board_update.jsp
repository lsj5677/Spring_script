<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="com.spring.board.dao.BoardMapper" %>
<%@ page import="com.spring.board.dao.BoardMapperImpl" %>
<%@ page import="com.spring.board.vo.BoardVO" %>
<%@ page import="java.util.ArrayList" %>  
<%@ page import ="java.util.List" %>

<%
	request.setCharacterEncoding("EUC-KR");
%>

<%

	BoardVO bvo = (BoardVO)request.getAttribute("boardVO");	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update</title>
		<style>
			.table {border:1px solid #ccc; width:500px; margin:0 auto; border-collapse:collapse; font-size:13px;}
			.table tr {border:1px solid #ddd; height: 40px;}
			.table tr:nth-child(odd) {background-color:#f3f3f3;}
			.table .table_title {text-align:center; font-size:15px;}
			.table tr td {padding:15px 0;} 
			.table tr .info_title {text-align:center; }
			.table tr .info_input {padding: 15px 20px; border-left:1px solid #ddd;}
			.table tr .info_input input {padding:5px; box-sizing:border-box; width: 100%; border: 1px solid #ccc;}
			.table tr .info_input span {display:block; font-size:11px; line-height:2; padding-top: 5px; text-align:right;}
			.table tr .info_button {text-align:center;}
			.table tr .info_button .btn{ border:none; background-color:#ddd; padding: 8px; width: 90px; box-sizing: border-box; cursor:pointer;}
			.table tr .info_button .btn:hover {background-color:#222; color:#fff; transition: all .3s ease;}
			.table tr .info_button .btn#retry {background-color:#cf0000; color:#fff;}
			textarea {width:100%; box-sizing: border-box;}
			
			.pw_box{display: flex;  box-sizing:border-box;}
			.table tr .info_input input#lpw{width:70%;}
			.table tr .info_input input#lpwCheck {width:30%; border-left: 0;} 
		</style>
		<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script>
		$(function(){
			$("#listBtn").click(function(){
				alert("listBtn >>>>> ");
				$("#boardUpdate").attr("action","/board/listBoard.lsj").submit();
			});	
			
			$("#updateBtn").click(function(){
				alert("updateBtn >>>>> ");
				if(confirm('수정을 진행할까요?')){
					$("#boardUpdate").attr("action","/board/updateBoard.lsj").submit();
				}
			});	
		});
		</script>
	</head>
	<body>
	
		
		<form name="boardUpdate" method="POST" id="boardUpdate">
			<table class="table">
				<tr>
					<td colspan="2" class="table_title">
						게시글 수정하기
					</td>
				</tr>
				
				<tr>
					<td class="info_title">글번호</td>
					<td class="info_input">
						<input type="text" name="lno" id="lno" readonly value=<%=bvo.getLno() %>></td>
				</tr>
				<tr>
					<td class="info_title">제목</td>
					<td class="info_input"><input type="text" name="lsubject" id="lsubject" value=<%=bvo.getLsubject() %>></td>
				</tr>
				<tr>
					<td class="info_title">이름</td>
					<td class="info_input"><input type="text" name="lname" id="lname" value=<%=bvo.getLname() %>></td>
				</tr>
				<tr>
					<td class="info_title">입력일</td>
					<td class="info_input"><input type="text" name="linsertdate" readonly value=<%=bvo.getLinsertdate() %>></td>
				</tr>
				<tr>
					<td class="info_title">수정일</td>
					<td class="info_input"><input type="text" name="lupdatedate" readonly value=<%=bvo.getLupdatedate() %>></td>
				</tr>
				<tr>
					<td class="info_title">내용</td>
					<td class="info_input">
						<textarea name="lmemo" id="lmemo" <%=bvo.getLmemo() %>></textarea>
					</td>
				</tr>
				<tr>
					<td class="info_title">비밀번호</td>
					<td class="info_input pw_box">
						<input type ="password" name="lpw" id="lpw">
						<input type ="button" id="lpwCheck" value="비밀번호 확인"">
					</td>
				</tr>

				<tr>
					<td colspan="3" class="info_button">
							<input type="button" value="수정" id="updateBtn" name="updateBtn" class="btn">
							<input type="button" value="목록" id="listBtn" name="listBtn" class="btn">
						</td>
				</tr>
			</table>
		</form>

	
	</body>
</html>