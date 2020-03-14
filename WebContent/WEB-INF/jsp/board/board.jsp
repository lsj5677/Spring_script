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


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Board</title>
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
		</style>
		<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(function(){
				/*insert*/
				$("#insertBtn").click(function(){
					alert("insertBtn >>>> ");
					if(confirm('등록을 진행할까요?')){
						$("#boardWrite").attr("action","/board/insertBoard.lsj").submit();
					}
				});
			});
				
		</script>
	</head>
	<body>
		<div class="wrap">
			<form name="boardWrite" method="POST" id="boardWrite" enctype="multipart/form-data">
				<table class="table">
					<tr>
						<td colspan="2" class="table_title">
							게시판 글쓰기
						</td>
					</tr>
					
					
					<tr>
						<td class="info_title">제목</td>
						<td class="info_input"><input type="text" name="lsubject" id="lsubject" placeholder="제목을 입력하세요"></td>
					</tr>
					<tr>
						<td class="info_title">이름</td>
						<td class="info_input"><input type="text" name="lname" id="lname" placeholder="이름를 입력하세요"></td>
					</tr>
					<tr>
						<td class="info_title">비밀번호</td>
						<td class="info_input"><input type="text" name="lpw" id="lpw" placeholder ="비밀번호를 입력하세요"></td>
					</tr>
				
					<tr>
						<td class="info_title">내용</td>
						<td class="info_input">
							<textarea name="lmemo" id="lmemo" placeholder="내용을 입력하세요"></textarea>
						</td>
					</tr>
					<tr>
						<td class="info_title">첨부파일</td>
						<td class="info_input"><input type="file" name="limage" id="limage"></td>
					</tr>
					<tr>
						<td colspan="2" class="info_button">
							<input type="button" id="insertBtn" name="insertBtn" value="글쓰기" class="btn" />
							<input type="reset" value="다시" id="retry" class="btn" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>